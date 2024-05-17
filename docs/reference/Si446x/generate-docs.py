# Script to create HTML pages for documentation extracted from SPITools_PRO2.xml
# Input: NewWDS.exe from Silicon Labs WDS (Wireless Development Suite)
# Output: registers.html - internal registers of radio IC
#         spiapi.html - SPI API, including undocumented commands and internal remarks

import argparse
import xml.etree.ElementTree as ET
import urllib.parse
import re

# table to fixup registers that are clearly in the wrong module
module_fix = {  'IE': 'interrupts', 'EIE1': 'interrupts', 'EIE2': 'interrupts', 'IP': 'interrupts',
                'EIP1': 'interrupts', 'EIP2': 'interrupts', 'IRQ': 'interrupts', 'EIRQ1': 'interrupts', 'EIRQ2': 'interrupts', 
                'NIRQ0': 'interrupts', 'NIRQ1': 'interrupts', 'NIRQ2': 'interrupts', 
                'NIRQ0_CLR': 'interrupts', 'NIRQ1_CLR': 'interrupts', 'NIRQ2_CLR': 'interrupts', 
                'PSW': 'mcu_core', 'A': 'mcu_core', 'B': 'mcu_core',
                'BIT_SWAP': 'sfr_regs',
                'RAWSARDAT': 'auxadc_dig',
                'RX1CHFLTCOE5': 'modem', 'RX1CHFLTCOE4': 'modem', 'RX1CHFLTCOE3': 'modem',
                'RX1CHFLTCOE2': 'modem', 'RX1CHFLTCOE1': 'modem', 'RX1CHFLTCOE0': 'modem',
                'RX1CHFLTCOEM0': 'modem', 'RX1CHFLTCOEM1': 'modem', 'RX1CHFLTCOEM2': 'modem', 'RX1CHFLTCOEM3': 'modem',
                'RX2CHFLTCOE13': 'modem', 'RX2CHFLTCOE12': 'modem', 'RX2CHFLTCOE11': 'modem',
                'DMA_RST': 'spi_dma', 'DMA_CFG': 'spi_dma', 'DMARD_VALID': 'spi_dma',
                'DMA_WROFF_LSBS': 'spi_dma', 'DMA_RDOFF_LSBS': 'spi_dma', 'DMA_WROFF_MSBS': 'spi_dma', 'DMA_RDOFF_MSBS': 'spi_dma', 
                'DMAWR_WRPNT_LSB': 'spi_dma', 'DMARD_WRPNT_LSB': 'spi_dma', 'DMA_WRPNT_MSBS': 'spi_dma',
                'DMAWR_BASE_LSB': 'spi_dma', 'DMARD_BASE_LSB': 'spi_dma', 'DMA_BASE_MSBS': 'spi_dma',
                'DMAWR_LIMIT_LSB': 'spi_dma', 'DMARD_LIMIT_LSB': 'spi_dma', 'DMARD_LIMIT_MSB': 'spi_dma', 'DMAWR_LIMIT_MSB': 'spi_dma',
                'SPI_CMD_STATUS': 'spi',
                'FIELD_NUM': 'packet_handler', 'FIELD_LENGTH_1': 'packet_handler', 'FIELD_LENGTH_2': 'packet_handler',
                'FIELD_CONFIG': 'packet_handler', 'FIELD_CRC_CONFIG': 'packet_handler',
                'GPIO_TST': 'dig_test_mux'
             }

# using bootstrap as base CSS
css_global = 'href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"'

# overrides for CSS
css_local = '<style type="text/css">\
    body { padding: 10px; font-size: 14; }\
    h1, h2, h3 { padding-top: 20px; }\
    h4 { padding-top: 10px; }\
    p { font-size: 14; } \
    code { font-size: 14; color: black } \
    table { min-width: 50%; border: 1px solid black; border-spacing: 1px; text-align: center; font-size: 14; }\
    td { border: 1px solid black; border-spacing: 0px; padding-left: 3px; padding-right: 3px; }\
    thead { text-align: center; background: #bbd5f0; }\
    dl { width: 100%; margin-top: 0; margin-bottom: 0; overflow: hidden; }\
    dt { width: 10%; float: left; text-aling: right } \
    dd { width: 90%; float: left; } \
    ul { margin-top: 0; margin-bottom: 0; } \
    </style>'

# output string to file
def emit(str, lf = True):    
    out_file.write(str)
    if lf == True:
        out_file.write('\n')

# return register for a given address
def addr2reg(addr, regs = None):
    if regs is None:
        regs = reg_list
    for r in regs:
        if r['address'] == addr:
            return r
    return None

# extract XML file from blob
def extract_xml(data_src, element_name):
    start_str = '<' + element_name + ' '
    start_str2 = '<' + element_name + '>'
    end_str = '</' + element_name + '>'
    start_bin = start_str.encode('utf-8')
    start_bin2 = start_str2.encode('utf-8')
    end_bin = end_str.encode('utf-8')

    start_pos = data_src.find(start_bin)
    if (start_pos == -1):
        start_pos = data_src.find(start_bin2)
    end_pos = data_src.find(end_bin)
    if (start_pos != -1):
        start_pos = data_src.rfind('<?xml'.encode('utf-8'), 0, start_pos)
    if (start_pos == -1) or (end_pos == -1) or (end_pos < start_pos):
        print('{} XML not found.'.format(element_name))
        return None
    else:
        print('{} XML found from {} to {}.'.format(element_name, start_pos, end_pos));

    return data_src[start_pos:(end_pos+len(end_bin))].decode('utf-8')

# extract registers structures from XML, returns list of dicts
def extract_regs(part):
    reg_list = []

    for reg in part.iter('Register'):
        if reg.get('name') == 'spare':
            continue
        r = {}
        r['address'] = int(reg.get('address'), 16)
        r['name'] = reg.get('name').upper()
        r['title'], r['text'] = load_extra('regs', 'reg', r['name'].lower())
        try:
            r['defaultVal'] = int(reg.get('defaultVal'), 16)
        except:
            r['defaultVal'] = None
        r['isRead'] = int(reg.get('isRead'))
        r['isWrite'] = int(reg.get('isWrite'))
        r['mode'] = int(reg.get('mode'))
        c = reg.find('Classification')
        r['isTestReg'] = int(c.get('isTestReg'))
        r['isRFReg'] = int(c.get('isRFReg'))
        r['isDigitalReg'] = int(c.get('isDigitalReg'))
        r['isMiscReg'] = int(c.get('isMiscReg'))
        r['isStatusReg'] = int(c.get('isStatusReg'))
        if c.get('isAconfig'):
            r['isAconfig'] = int(c.get('isAconfig'))
        else:
            r['isAconfig'] = 0
        if r['address'] >= 0x5480 and r['address'] <= 0x54ff:
            r['isSFR'] = 1
        else:
            r['isSFR'] = 0
        if r['address'] >= 0x5000 and r['address'] <= 0x51ff:
            r['isXReg'] = 1
        else:
            r['isXReg'] = 0

        fields = [None] * 8
        for bit in reg.findall('Bit'):
            f = {}
            fname = bit.get('name')
            if fname.find('[') > 0:
                f['name'] = fname.split('[')[0]
                f['bit'] = int(fname.split('[')[1].split(']')[0])
            else:
                f['name'] = fname
            if f['name'] != 'reserved':
                f['name'] = f['name'].upper()
            fields[int(bit.get('index'))] = f
        r['fields'] = fields

        d = reg.find('Description')
        r['description'] = d.text
        if r['description'].startswith('\\\\'):
            if r['name'].upper() in module_fix:
                # Manual assignment of module for obvious errors in XML file
                r['module'] = module_fix[r['name']]
                r['submodule'] = r['module']
            else:
                r['module'] = d.text.split('\\modules\\',1)[1].split('\\',1)[0]
                if r['module'].startswith('pro2_is_'):
                    r['module'] = r['module'][8:]
                elif r['module'].startswith('pro2_'):
                    r['module'] = r['module'][5:]
                r['submodule'] = d.text.split('\\docs\\specs\\',1)[1].split('.docx',1)[0]
                if r['submodule'].endswith('_stop'):
                    r['submodule'] = r['submodule'][:-5]
                # distinguish acfg ckgen
                if r['module'] == 'clkgen':
                    r['module'] = 'clk_gen_acfg'
                    r['submodule'] = 'clk_gen_acfg'
            r['module'] = r['module'].upper()
            r['submodule'] = r['submodule'].upper()
        reg_list.append(r)

    return reg_list

# extract fields of a register from XML, returns list of dicts
def extract_fields(r):
    fields = r['fields']
    flist = []
    f = {}
    for b in reversed(range(8)):
        if fields[b]:
            if 'name' in f:
                if fields[b]['name'] == f['name']:
                    f['last'] = fields[b]['bit']                        
                    f['default'] = (f['default'] << 1) | ((r['defaultVal'] >> b) & 1)
                    f['span'] += 1
                    continue
                flist.append(f)
                f = {}
            f['name'] = fields[b]['name']
            f['default'] = (r['defaultVal'] >> b) & 1
            f['pos'] = b
            if 'bit' in fields[b]:
                f['first'] = f['last'] = fields[b]['bit']
                f['span'] = 1
            else:
                flist.append(f)
                f = {}
        else:
            # missing field, should not happen..
            if 'name' in f:
                flist.append(f)
                f = {}
            else:
                flist.append({'name': '', 'default': (r['defaultVal'] >> b) & 1})
    if 'name' in f:
        flist.append(f)
    return flist

# extract SPI API command argument/reply and property fields from XML, returns list of dicts
def extract_params(root):
    params = []
    for ps in root.findall('parameter_set'):
        param = {}
        param['name'] = ps.get('name')
        param['index_start'] = int(ps.get('index_start'), 16)
        param['index_end'] = int(ps.get('index_end'), 16)
        param['type'] = ps.get('ps_type')
        param['fields'] = []
        for f in ps.findall('field'):
            field = {}
            field['name'] = f.get('name')
            field['size'] = int(f.get('fsize'))
            field['ftype'] = f.get('ftype')
            if field['ftype'] == 'ENUM':
                e = f.find('enum_set_id')
                if not e is None:
                    field['enum'] = f.find('enum_set_id').text
            if not f.get('value_min') is None and len(f.get('value_min')) > 0:
                field['min'] = int(f.get('value_min'))
                field['max'] = int(f.get('value_max'))
            if f.find('descriptions/description'):
                # ignores mutliple entries with activation logic, may need revisiting
                field['description'] = f.find('descriptions/description')
            if len(f.find('comments')) > 0:
                field['comments'] = f.find('comments')
            field['mapping'] = []
            for m in f.findall('parameter_set_mapping/mapping'):
                mapping = {}
                mapping['index'] = int(m.get('parameter_start_index'), 16)
                mapping['bit_msb'] = int(m.get('parameter_bit_msb'))
                mapping['size'] = int(m.get('fsize'))
                if not m.get('split_msb') is None:
                    mapping['split_msb'] = int(m.get('split_msb'))
                    mapping['split_lsb'] = int(m.get('split_lsb'))
                field['mapping'].append(mapping)
            param['fields'].append(field)
        params.append(param)
    return params

# extract SPI API commands from XML, returns list of dicts
def extract_cmds(root):
    cslist = []
    for cs in root.find('command_sets').iter('command_set'):
        cset = {}
        cset['name'] = cs.get('name')
        cset['commands'] = []
        for c in cs.findall('command'):
            cmd = {}
            cmd['name'] = c.get('name')
            cmd['number'] = int(c.get('number'), 16)
            cmd['summary'] = c.find('summary/text').text
            if c.find('descriptions/description'):
                # ignores mutliple entries with activation logic, may need revisiting
                cmd['description'] = c.find('descriptions/description')
            if len(c.find('comments')) > 0:
                cmd['comments'] = c.find('comments')
            cmd['inputs'] = extract_params(c.find('inputs'))
            cmd['outputs'] = extract_params(c.find('outputs'))
            cset['commands'].append(cmd)
        cslist.append(cset)
    return cslist

# extract SPI API properties from XML, returns list of dicts
def extract_props(root):
    pglist = []
    for pg in root.find('property_groups').iter('property_group'):
        pgroup = {}
        pgroup['name'] = pg.get('name')
        pgroup['number'] = int(pg.get('group_num'), 16)
        pgroup['properties'] = []
        for p in pg.iter('property'):
            prop = {}                    
            prop['name'] = p.get('name')
            prop['index_start'] = int(p.get('index_start'), 16)
            prop['index_end'] = int(p.get('index_end'), 16)
            if len(list(filter(lambda x: x['index_start'] == prop['index_start'], pgroup['properties']))) > 0:
                # ignore multiple entries with different activation logic, may need revisiting 
                continue
            pa = p.find('property_activation')
            prop['default'] = pa.get('default')  # don't convert to int, biggest number is > 2^64
            if pa.find('summary/text') is None:
                prop['summary'] = ''
            else:
                prop['summary'] = pa.find('summary/text').text
            if p.get('array_index'):
                prop['array_index'] = int(p.get('array_index'), 16)
            if pa.find('descriptions/description'):
                # ignores mutliple entries with activation logic, may need revisiting
                prop['description'] = pa.find('descriptions/description')
            if len(pa.find('comments')) > 0:
                prop['comments'] = pa.find('comments')
            prop['params'] = extract_params(pa)
            pgroup['properties'].append(prop)
        pglist.append(pgroup)
    return pglist

# extract SPI API enumerations from XML, returns list of dicts
def extract_enums(root):
    sets = []
    for es in root.find('enum_sets').iter('enum_set'):            
        enum_set = {}
        enum_set['name'] = es.get('name')
        enum_set['id'] = es.get('id')
        enums = []
        for e in es:
            enum = {}
            enum['name'] = e.get('name').upper()
            enum['value'] = int(e.get('value'))
            if e.find('descriptions/description'):
                # ignores mutliple entries with activation logic, may need revisiting
                enum['description'] = e.find('descriptions/description')
            if len(e.find('comments')) > 0:
                enum['comments'] = e.find('comments')
            enums.append(enum)
        enum_set['enums'] = enums
        sets.append(enum_set)
    return sets

# return properly encoded anchor
def anchor(category, name):
    return '{}-{}'.format(category, urllib.parse.quote(name))

# return link to command set
def csetlink(name):
    return '<a href="#{}">{}</a>'.format(anchor('cset', name), name)

# return link to command
def cmdlink(name, external = False):
    if external == False:
        return '<a href="#{}"><code>{}</code></a>'.format(anchor('cmd', name), name)
    else:
        # target won't jump to anchor if API page already open
        # return '<a href="{}#{}" target="api"><code>{}</code></a>'.format(api_doc, anchor('cmd', name), name)
        return '<a href="{}#{}"><code>{}</code></a>'.format(api_doc, anchor('cmd', name), name)

# return link to command argument field
def arglink(name):
    return '<a href="#{}">{}</a>'.format(anchor('arg', name), name)

# return link to command reply field
def replylink(name):
    return '<a href="#{}">{}</a>'.format(anchor('reply', name), name)

# return link to property group
def pgrplink(name):
    return '<a href="#{}">{}</a>'.format(anchor('pgrp', name), name)

# return link to property
def proplink(name, external = False):
    if external == False:
        return '<a href="#{}">{}</a>'.format(anchor('prop', name), name)
    else:
        # target won't jump to anchor if API page already open
        # return '<a href="{}#{}" target="api"><code>{}</code></a>'.format(api_doc, anchor('prop', name), name)
        return '<a href="{}#{}"><code>{}</code></a>'.format(api_doc, anchor('prop', name), name)

# return link to property field
def fieldlink(name, external = False):
    if external == False:
        return '<a href="#{}">{}</a>'.format(anchor('field', name), name)
    else:
        # target won't jump to anchor if API page already open
        # return '<a href="{}#{}" target="api"><code>{}</code></a>'.format(api_doc, anchor('field', name), name)
        return '<a href="{}#{}"><code>{}</code></a>'.format(api_doc, anchor('field', name), name)

# return link to peripheral module
def modlink(name):
    return '<a href="#{}">{}</a>'.format(anchor('mod', name), name)

# return link to register map
def maplink(name):
    return '<a href="#{}">{}</a>'.format(anchor('map', name), name)

# return link to register
def reglink(name, external = False):
    if external == False:
        return '<a href="#{}"><code>{}</code></a>'.format(anchor('reg', name), name)
    else:
        # target won't jump to anchor if API page already open
        # return '<a href="{}#{}" target="api"><code>{}</code></a>'.format(reg_doc, anchor('reg', name), name)
        return '<a href="{}#{}"><code>{}</code></a>'.format(reg_doc, anchor('reg', name), name)

# generate HTML register map
def emit_regmap(name, start, end = 0, width = 8, regs = None, offset = 0):
    if regs is None:
        regs = reg_list
    if end == 0:
        for r in regs:
            if r['address'] - offset > end:
                end = r['address'] - offset
    emit('<h3><a name="{}">{}</a></h3>'.format(anchor('map', name), name))
    emit('<table>')
    emit('<thead><tr>')
    emit('<td></td>')
    for col in range(width):
        emit('<td><code>{:X}</code></td>'.format(col))
    emit('</tr></thead>')
    emit('<tbody>')
    for row in range(start, end, width):
        emit('<tr><td style="hpadding: 4px"><code>{:02X}</code></td>'.format(row))
        for addr in range(row, row+width):
            r = addr2reg(addr + offset, regs)
            if r:
                emit('<td>{}</td>'.format(reglink(r['name'])))
            else:
                emit('<td></td>')
        emit('</tr>')
    emit('</tbody></table>')

# generate HTML text from XML fragment, used in SPI API descriptions and comments
def emit_description(root):
    emit('<ul><li>')
    for e in root:
        if e.tag == 'text':
            emit(e.text, False)
        elif e.tag == 'li':
            emit('</li><li>')
        elif e.tag == 'reference':
            ref_type = e.get('ref_type')
            ref_text = e.get('ref_text')
            if ref_type == 'ref_prop':
                emit(proplink(ref_text))
            elif ref_type == 'ref_cmd':
                emit(cmdlink(ref_text))
            elif ref_type == 'ref_prop_field':
                emit(fieldlink(ref_text))
            elif ref_type == 'ref_cmd_arg':                    
                emit(arglink(ref_text))
            elif ref_type == 'ref_cmd_arg_field':
                emit(fieldlink(ref_text))
            elif ref_type == 'ref_cmd_reply':
                emit(replylink(ref_text))
            elif ref_type == 'ref_cmd_reply_field':
                emit(fieldlink(ref_text))
            else:
                print('unhandled ref {}: {}'.format(ref_type, ref_text))
                emit(ref_text)
        elif e.tag == 'sub':
            emit('<sub>{}</sub>'.format(e.get('text')), False)
        elif e.tag == 'sup':
            emit('<sup>{}</sup>'.format(e.get('text')), False)
        elif e.tag == 'img':
            emit('<br />[embedded image: {}]'.format(e.get('alt')))
        elif e.tag == 'latex':
            emit('<br />[LATEX equation: {}]'.format(e.get('equation')))
        else:
            print('unknown tag in text: {}'.format(e.tag))
    emit('</li></ul>')

# generate HTML table of fields in SPI API command argument or reply
def emit_cmd_field_table(cmd, title, params):
    emit('<br />')
    emit('<table>')
    emit('<thead><tr><th colspan="10">{} {} Stream</th></tr>'.format(cmd['name'], title))
    emit('<tr><td>Index</td><td>Name</td><td>7</td><td>6</td><td>5</td><td>4</td><td>3</td><td>2</td><td>1</td><td>0</td></tr>')
    emit('</thead><tbody>')
    for p in params:
        for i in range(p['index_start'], p['index_end']+1):
            emit('<tr><td>0x{:02x}</td>'.format(i))
            if (i == p['index_start']):
                emit('<td rowspan="{}"><b>{}</b></td>'.format(p['index_end'] - p['index_start'] + 1, p['name']))
            if p['name'] == 'CMD':
                # CMD field
                emit('<td colspan="8">0x{:02x}</td>'.format(cmd['number']))
            else:
                b = 7
                n = 0
                while b >= 0:
                    if n < len(p['fields']):
                        f = p['fields'][n]
                        m = next(filter(lambda x: x['index'] == i, f['mapping']))
                        if m['bit_msb'] == b:
                            if 'split_msb' in m:
                                emit('<td colspan="{}">{}[{}:{}]</td>'.format(m['size'], f['name'], m['split_msb'], m['split_lsb']))
                            else:
                                emit('<td colspan="{}">{}</td>'.format(m['size'], f['name']))
                            b -= m['size']
                            n += 1
                        else:
                            emit('<td>0</td>')
                            b -= 1
                    else:
                        emit('<td>0</td>')
                        b -= 1
            emit('</tr>')
    emit('</tbody></table><br />')

# generate HTML table with fields of a SPI API property
def emit_prop_field_table(prop, params):
    emit('<br />')
    emit('<table>')

    # build flattened list of fields
    bitmask = [ 0x01, 0x03, 0x07, 0x0f, 0x1f, 0x3f, 0x7f, 0xff ]
    flist = []
    for p in params:
        flist = []
        for f in p['fields']:
            for m in f['mapping']:
                regf = {}
                if 'split_msb' in m:
                    regf['name'] = '{}[{}:{}]'.format(f['name'], m['split_msb'], m['split_lsb'])
                else:
                    regf['name'] = f['name']
                # extract default value from hex string 
                default_pos = len(prop['default']) - ((prop['index_end'] - m['index']) * 2) - 2
                regf['default'] = (int(prop['default'][default_pos:default_pos+2], 16)
                                        >> (m['bit_msb'] - (m['size'] - 1))) & bitmask[m['size'] - 1]
                regf['index'] = m['index']
                regf['bit_msb'] = m['bit_msb']
                regf['size'] = m['size']
                flist.append(regf)

    # output fields
    emit('<thead><tr><td></td><th colspan="8">{}</th></tr>'.format(prop['name']))
    emit('<tr><td>Index</td><td>7</td><td>6</td><td>5</td><td>4</td><td>3</td><td>2</td><td>1</td><td>0</td></tr>')
    emit('</thead><tbody>')
    iterf = iter(sorted(flist, key=lambda i: (i['index'], 7 - i['bit_msb'])))
    currf = next(iterf)
    for i in range(p['index_start'], p['index_end']+1):
        emit('<tr><td>0x{:02x}</td>'.format(i))
        b = 7
        while b >= 0:
            if not currf is None and currf['bit_msb'] == b:
                emit('<td colspan="{}">{}</td>'.format(currf['size'], currf['name']))
                b -= currf['size']
                try:
                    currf = next(iterf)
                except:
                    # no more fields, still need to complete table
                    currf = None
            else:
                emit('<td>0</td>')
                b -= 1
        emit('</tr>')
    emit('</tbody>')

    # output defaults
    emit('<thead><tr><td></td><th colspan="8">Defaults</th></tr>')
    emit('</thead><tbody>')
    iterf = iter(sorted(flist, key=lambda i: (i['index'], 7 - i['bit_msb'])))
    currf = next(iterf)
    for i in range(p['index_start'], p['index_end']+1):
        emit('<tr><td>0x{:02x}</td>'.format(i))
        b = 7
        while b >= 0:
            if not currf is None and currf['bit_msb'] == b:
                emit('<td colspan="{}">0x{:x}</td>'.format(currf['size'], currf['default']))
                b -= currf['size']
                try:
                    currf = next(iterf)
                except:
                    # no more fields, still need to complete table
                    currf = None
            else:
                emit('<td>0x0</td>')
                b -= 1
        emit('</tr>')
    emit('</tbody>')

    emit('</table><br />')

# generate HTML with details of fields in SPI API command argument/reply and properties
def emit_field_details(params, ptype, parent, prefix = False):
    emit('<ul>')
    for p in params:
        if len(p['fields']) == 0:
            continue
        if prefix == True:
            name = parent + '_' + p['name']
        else:
            name = p['name']
        emit('<li><a name="{}">{}</a><ul>'.format(anchor(ptype, parent + ':' + name), name))
        for f in p['fields']:
            if (ptype == 'prop'):
                emit('<li><a name="{}">{}</a>'.format(anchor('field', name + ':' + f['name']), f['name']))
            else:
                emit('<li><a name="{}">{}</a>'.format(anchor(ptype, parent + ':' + f['name']), f['name']))
            if 'description' in f:
                emit('<dl><dt>Description:</dt><dd>')                
                emit_description(f['description'])
                emit('</dd></dl>')
            if 'comments' in f:
                emit('<dl><dt>Comments:</dt><dd>')
                emit_description(f['comments'])
                emit('</dd></dl>')
            emit('<dl><dt>Type:</dt>')
            if f['ftype'] == 'ENUM':
                emit('<dd>Enumeration<br />')
                if 'enum' in f:
                    emit('<table>')
                    emit('<thead><tr><td align="left">Name</td><td>Value</td><td align="left">Description</td></tr></thead>')
                    emit('<tbody>')
                    es = next(filter(lambda x: x['id'] == f['enum'], enum_list))
                    for e in es['enums']:
                        emit('<tr valign="top"><td align="left">{}</td><td>{}</td><td align="left">'.format(e['name'], e['value']))
                        emit_description(e['description'])
                        if 'comments' in e:
                            emit('Comments: ')
                            emit_description(e['comments'])
                        emit('</td></tr>')
                    emit('</tbody></table>')
            else:
                emit('<dd>{}</dd>'.format(f['ftype']))                    
            emit('</dl>')
            if 'min' in f:
                emit('<dl><dt>Min:</dt><dd>0x{:x}</dd></dl>'.format(f['min']))
            if 'max' in f:
                emit('<dl><dt>Max:</dt><dd>0x{:x}</dd></dl>'.format(f['max']))
            emit('</li>')
        emit('</ul></li>')
    emit('</ul>')

# emit text as HTML using a basic markdown parser
def emit_markdown(text, level, doc):
    if (doc == 'API'):
        api_external = False;
        reg_external = True;
    else:
        api_external = True;
        reg_external = False;
    text = text.rstrip()
    if len(text) == 0:
        return    
    re_hex = re.compile(r'0x([0-9A-F]*)', re.IGNORECASE)
    re_reglink = re.compile(r'reg:([A-Z0-9_]*)', re.IGNORECASE)
    re_modlink = re.compile(r'mod:([A-Z0-9_]*)', re.IGNORECASE)
    re_cmdlink = re.compile(r'cmd:([A-Z0-9_]*)', re.IGNORECASE)
    re_proplink = re.compile(r'prop:([A-Z0-9_]*)', re.IGNORECASE)
    re_fieldlink = re.compile(r'field:([A-Z0-9_:]*)', re.IGNORECASE)
    re_li = re.compile(r'^\* (.*)')
    re_bold = re.compile(r'.\*([^\*]*)')
    re_code = re.compile(r'`([^`]*)`', re.IGNORECASE)
    emit('<p>')
    first_line = True
    for line in text.splitlines():
        if len(line.rstrip()) == 0:
            if first_line == True:
                # ignore empty line after heading
                pass
            else:
                emit('</p><p>')
        elif line.startswith('# '):
            emit('<h{}>{}</h{}>'.format(level, line[2:], level))
        elif line.startswith('## '):
            emit('<h{}>{}</h{}>'.format(level+1, line[3:], level+1))
        elif line.startswith('### '):
            emit('<h{}>{}</h{}>'.format(level+2, line[4:], level+2))
        else:
            line = re_hex.sub(lambda x: '<code>0x{}</code>'.format(x.group(1).upper()), line)
            line = re_reglink.sub(lambda x: reglink(x.group(1).upper(), reg_external), line)
            line = re_modlink.sub(lambda x: modlink(x.group(1).upper()), line)
            line = re_cmdlink.sub(lambda x: cmdlink(x.group(1).upper(), api_external), line)
            line = re_proplink.sub(lambda x: proplink(x.group(1).upper(), api_external), line)
            line = re_fieldlink.sub(lambda x: fieldlink(x.group(1).upper(), api_external), line)
            line = re_li.sub(lambda x: '<li>{}</li>'.format(x.group(1)), line)
            line = re_bold.sub(lambda x: '<b>{}</b>'.format(x.group(1)), line)
            html = re_code.sub(lambda x: '<code>{}</code>'.format(x.group(1)), line)
            emit(html)
        first_line = False
    emit('</p>')

# load additional information stored in markdown files
def load_extra(folder, type, id):
    filename = '{}{}/{}-{}.md'.format(args.out, folder, type, id)
    title = ''
    text = ''
    try:
        with open(filename, 'r', encoding='utf-8') as extra:
            found_title = False
            for line in extra:
                if found_title == False and line.startswith('# '):
                    found_title = True
                    title = line[2:].rstrip()
                else:
                    text += line
    except FileNotFoundError:
        pass
    return title, text

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generates HTML pages with register documentation for EZRadioPRO radio IC.')
    parser.add_argument('wds', type=argparse.FileType('rb', 0),
                        help='Path and name of WDS executable to extract documentation from.')
    parser.add_argument('-o', '--out', default='./',
                        help='Location to store generated HTML pages.')
    parser.add_argument('-p', '--part', default='Si4467',
                        help='Part number for which to extract register map. For example Si4467')
    parser.add_argument('-r', '--rev',
                        help='Part revision. If no revision is specified, the highest revision available will be used.')
    args = parser.parse_args()

    # load NewWDS.exe
    wds_data = args.wds.read()
    print('{} bytes read from {}'.format(len(wds_data), args.wds.name))
    args.wds.close()

    #########################################################################
    # register.html - documents internal registers of radio IC
    #########################################################################

    # SPITools_PRO2 XML fragment contains register description
    xml_src = extract_xml(wds_data, 'SPITools_PRO2')
    if xml_src is None:
        print('SPITools_PRO2.xml not found.')
        exit()

    print('Parsing XML data...')
    try:
        root = ET.fromstring(xml_src)
    except:
        print('Errors parsing XML data.')
        exit()

    # XML file contains information for multiple parts, pick one
    if args.rev:
        parts = root.findall("./SPIDevice/[@type='{}'][@revision='{}']".format(args.part, args.rev))
    else:
        parts = root.findall("./SPIDevice/[@type='{}']".format(args.part))

    if len(parts) == 0:
        if args.rev:
            print('Part \'{}\' rev \'{}\' not found in {}.'.format(args.part, args.rev, 'SPITools_PRO2.xml'))
        else:
            print('Part \'{}\' not found in {}.'.format(args.part, 'SPITools_PRO2.xml'))
        exit()

    if len(parts) > 1:
        print('{} parts found:'.format(len(parts)))
        part = parts[0]
        for p in parts:
            print('\t{} rev {}'.format(p.get('type'), p.get('revision')))
            if p.get('revision') > part.get('revision'):
                part = p
        print('Using {} rev {}'.format(part.get('type'), part.get('revision')))
    else:
        part = parts[0]
        print('Found {} rev {}'.format(part.get('type'), part.get('revision')))

    part_type = part.get('type')
    part_rev = part.get('revision')

    reg_doc = 'registers-{}-{}.html'.format(part_type, part_rev)
    api_doc = 'spiapi-{}-{}.html'.format(part_type, part_rev)

    # extract list of registers from XML
    reg_list = extract_regs(part)

    # build list of modules (peripherals)
    ml = []
    for r in reg_list:
        if 'module' in r and next(filter(lambda m: m['name'] == r['module'], ml), None) is None:
            mod = {}
            mod['name'] = r['module']
            mod['title'], mod['text'] = load_extra('regs', 'mod', mod['name'].lower())
            ml.append(mod)
    module_list = sorted(ml, key = lambda m: m['name'])

    # create HTML file
    print('Generating registers.html')
    out_name = args.out + reg_doc
    try:
        out_file = open(out_name, 'w', encoding='utf-8')
    except:
        print('Failed writing {}.'.format(out_name))
        exit()

    # HTML header, title
    emit('<html><head>')
    emit('<title>{} rev {} Registers</title>'.format(part_type, part_rev))
    emit('<link rel="stylesheet" {}>'.format(css_global))
    emit(css_local)
    emit('</head>')
    emit('<body>')
    emit('<h1>{} rev {}</h1>'.format(part.get('type'), part.get('revision')))
    
    # TOC
    emit('<h2>Table of Contents</h2>')
    emit('<ul>')
    emit('<li><a href="#register-map">Register Maps</a></li>')
    if len(module_list) > 0:
        emit('<li><a href="#modules">Peripherals</a></li>')
    emit('<li><a href="#registers">Registers</a></li>')
    emit('</ul>')
    emit('<hr />')

    # register maps (SFR, ACFG, XREG)
    emit('<h2><a name="register-map">Register Maps</a></h2>')
    sfr_list = [r for r in reg_list if r['isSFR'] == 1]
    acfg_list = [r for r in reg_list if r['isAconfig'] == 1]
    xreg_list = [r for r in reg_list if r['isXReg'] == 1]
    if len(sfr_list) > 0:
        emit('<ul>')
        emit('<li>{}</li>'.format(maplink('SFR')))
        emit('<li>{}</li>'.format(maplink('ACFG')))
        emit('<li>{}</li>'.format(maplink('XREG')))
        emit('</ul>')
        emit('<hr />')
        emit_regmap('SFR', 0x80, 0, 8, sfr_list, 0x5400)
        emit('<hr />')
        emit_regmap('ACFG', 0x0, 0, 4, acfg_list)
        emit('<hr />')
        emit_regmap('XREG', 0x5000, 0, 8, xreg_list)
        emit('<hr />')
    else:
        regmap('Register Map', 0, 0, 8, reg_list)
        emit('<hr />')

    # registers grouped by module (peripheral)
    if len(module_list) > 0:
        emit('<h2><a name="modules">Peripherals</a></h2>')

        emit('<ul>')
        for m in module_list:
            if len(m['title']) > 0:
                emit('<li>{} - {}</li>'.format(modlink(m['name']), m['title']))
            else:
                emit('<li>{}</li>'.format(modlink(m['name'])))
        emit('</ul>')
        emit('<hr />')

        for m in module_list:
            if len(m['title']) > 0:
                mod_title = '{} - {}'.format(m['name'], m['title'])
            else:
                mod_title = m['name']
            emit('<h3><a name="{}">{}</a></h3>'.format(anchor('mod', m['name']), mod_title))
            if 'text' in m:
                emit_markdown(m['text'], 3, 'REG')
            emit('<h4>Registers</h4>')
            mregs = sorted(filter(lambda r: 'module' in r and r['module'] == m['name'], reg_list), key = lambda r: r['name'])
            sml = set()
            for r in mregs:
                if 'submodule' in r:
                    sml.add(r['submodule'])
            if len(sml) > 1:
                submod_list = sorted(sml)
                for sm in submod_list:
                    emit('<h4>{}</h4>'.format(sm))
                    emit('<ul>')
                    for r in filter(lambda r: 'submodule' in r and r['submodule'] == sm, mregs):
                        emit('<li>')
                        emit(reglink(r['name']))
                        if len(r['title']) > 0:
                            emit(' - {}'.format(r['title']))
                        emit('</li>')
                    emit('</ul>')
            else:
                emit('<ul>')
                for r in mregs:
                    emit('<li>')
                    emit(reglink(r['name']))
                    if len(r['title']) > 0:
                        emit(' - {}'.format(r['title']))
                    emit('</li>')
                emit('</ul>')
            emit('<hr />')

    # individual registers
    emit('<h2><a name="registers">Registers</a></h2>')
    for r in sorted(reg_list, key = lambda r: r['address']):
        if len(r['title']) > 0:
            reg_title = '{} - {}'.format(r['name'], r['title'])
        else:
            reg_title = r['name']
        emit('<h3><a name="{}">{}</a></h3>'.format(anchor('reg', r['name']), reg_title))
        emit('<p>Peripheral: {}<br />'.format(modlink(r['module'])))
        rspace = None
        raddr = r['address']
        if r['isSFR'] == True:
            rspace = 'SFR'
            raddr -= 0x5400
        elif r['isAconfig'] == True:
            rspace = 'ACFG'
        else:
            rspace = 'XREG'
        emit('Register space: {}<br />'.format(maplink(rspace)))
        emit('Offset: <code>0x{:02X}</code><br />'.format(raddr))
        emit('Reset value: <code>0x{:02X}</code><br />'.format(r['defaultVal']))
        raccess = ''
        if r['isRead'] == 1:
            raccess += 'R'
        if r['isWrite'] == 1:
            raccess += 'W'
        emit('Access: {}'.format(raccess))
        emit('</p>')

        # table with fields of register
        flist = extract_fields(r)
        emit('<table><thead><tr>')
        emit('<td>Bit</td>')
        for bit in reversed(range(8)):
            emit('<td>{}</td>'.format(bit))
        emit('</tr></thead>')
        emit('<tbody><tr>')
        emit('<td>Field</td>')
        for f in flist:
            if 'first' in f:
                if f['span'] == 1:
                    bits = '[{}]'.format(f['first'])
                else:
                    bits = '[{}:{}]'.format(f['first'], f['last'])
                emit('<td colspan="{}"><code>{}{}</code></td>'.format(f['span'], f['name'], bits))
            else:
                emit('<td><code>{}</code></td>'.format(f['name']))
        emit('</tr>')
        emit('<tr>')
        emit('<td>Reset</td>')
        for f in flist:
            if 'first' in f:
                emit('<td colspan="{}"><code>0x{:X}</code></td>'.format(f['span'], f['default']))
            else:                
                emit('<td><code>0x{:X}</code></td>'.format(f['default']))

        emit('</tr></tbody></table>')
        emit('<p></p>')
        emit_markdown(r['text'], 3, 'REG')
        emit('<hr />')
    emit('</body>')
    emit('</html>')

    #########################################################################
    # spiapi.html - documents SPI API of radio IC, including internal info
    #########################################################################

    # root XML fragment contains register description
    xml_src = extract_xml(wds_data, 'root')
    if xml_src is None:
        print('root.xml not found.')
        exit()

    print('Parsing XML data...')
    try:
        root = ET.fromstring(xml_src)
    except:
        print('Errors parsing XML data.')
        exit()

    # build Python structures from XML
    cmd_list = extract_cmds(root)
    prop_list = extract_props(root)
    enum_list = extract_enums(root)

    # create HTML file
    print('Generating spiapi.html')
    out_name = args.out + api_doc
    try:
        out_file = open(out_name, 'w', encoding='utf-8')
    except:
        print('Failed writing {}.'.format(out_name))
        exit()

    # HTML header, title, ..
    emit('<html><head>')
    emit('<title>EZRadioPRO SPI API</title>')
    emit('<link rel="stylesheet" {}>'.format(css_global))
    emit(css_local)
    emit('</head>')
    emit('<body>')
    emit('<h1>EZRadioPRO SPI API</h1>')

    # table with all commands
    emit('<h2>Command Summary</h2>')
    emit('<table>')
    for cset in cmd_list:
        emit('<thead><tr><th colspan="3">{}</th></tr>'.format(csetlink(cset['name'])))
        emit('<tr><td>Number</td><td>Name</td><td>Summary</td></tr>')
        emit('</thead><tbody>')
        for cmd in sorted(cset['commands'], key = lambda c: c['number']):
            emit('<tr><td>0x{:02x}</td>'.format(cmd['number']))
            emit('<td align="left">{}</td>'.format(cmdlink(cmd['name'])))
            emit('<td align="left">{}</td></tr>'.format(cmd['summary']))
        emit('</tbody>')
    emit('</table>')
    emit('<hr />')

    # table with all properties
    emit('<h2>Property Summary</h2>')
    emit('<table>')
    for group in prop_list:
        emit('<thead><tr><th colspan="5">{}</th></tr>'.format(pgrplink(group['name'])))
        emit('<tr><td>Group</td><td>Number</td><td>Name</td><td>Default</td><td>Summary</td></tr>')
        emit('</thead><tbody>')
        for prop in sorted(group['properties'], key = lambda p: p['index_start']):
            emit('<tr><td>0x{:02x}</td>'.format(group['number']))
            emit('<td>0x{:02x}'.format(prop['index_start']))
            if prop['index_start'] != prop['index_end']:
                for i in range(prop['index_start']+1, prop['index_end']+1):
                    emit('<br/>0x{:02x}'.format(i))
            emit('</td>')
            if 'array_index' in prop:
                emit('<td align="left">{}[{}]</td>'.format(proplink(prop['name']), prop['array_index']))
            else:
                emit('<td align="left">{}</td>'.format(proplink(prop['name'])))
            emit('<td>{}'.format(prop['default'][:4]))
            if prop['index_start'] != prop['index_end']:
                for i in range(4, len(prop['default']), 2):
                    emit('<br/>0x{}'.format(prop['default'][i:i+2]))
            emit('<td align="left">{}</td></tr>'.format(prop['summary']))
        emit('</tbody>')
    emit('</table>')
    emit('<hr />')

    # documentation for each command
    emit('<h2><a name="cmd-details">Command Details</a></h2>')
    for cset in cmd_list:
        emit('<h3><a name="{}">{}</a></h3>'.format(anchor('cset', cset['name']), cset['name']))
        for cmd in sorted(cset['commands'], key = lambda c: c['number']):
            emit('<h4><a name="{}">{}</a></h4>'.format(anchor('cmd', cmd['name']), cmd['name']))
            emit('<ul>')
            emit('<li>Number: 0x{:02x}</li>'.format(cmd['number']))
            emit('<li>Summary: {}</li>'.format(cmd['summary']))
            emit('<li>Purpose:</li>')
            if 'description' in cmd:
                emit_description(cmd['description'])
            if 'comments' in cmd:
                emit('<li>Comments (internal):</li>')
                emit_description(cmd['comments'])
            emit('<li>Argument Stream:')
            emit_cmd_field_table(cmd, 'Argument', cmd['inputs'])
            emit('</li>')
            emit('<li>Reply Stream:')
            emit_cmd_field_table(cmd, 'Reply', cmd['outputs'])
            emit('</li>')
            emit('<li>Argument Fields:')
            emit_field_details(cmd['inputs'], 'arg', cmd['name'])
            emit('</li>')
            emit('<li>Reply Fields:')
            emit_field_details(cmd['outputs'], 'reply', cmd['name'])
            emit('</li>')
            emit('</ul>')
            notes_title, notes_text = load_extra('api', 'cmd', cmd['name'].lower())
            if len(notes_text) > 0:
                if len(notes_title) > 0:
                    emit('<h5>{}</h5>'.format(notes_title))
                else:
                    emit('<h5>Notes</h5>')
                emit_markdown(notes_text, 5, 'API')
            emit('<hr />')

    # documentaiton for each property
    emit('<h2><a name="prop-details">Property Details</a></h2>')
    for pgroup in prop_list:
        emit('<h3><a name="{}">{}</a></h3>'.format(anchor('pgrp', pgroup['name']), pgroup['name']))
        for prop in pgroup['properties']:            
            emit('<h4><a name="{}">{}</a></h4>'.format(anchor('prop', prop['name']), prop['name']))
            emit('<ul>')
            emit('<li>Group: 0x{:02x}</li>'.format(pgroup['number']))
            if prop['index_start'] == prop['index_end']:
                emit('<li>Index: 0x{:02x}</li>'.format(prop['index_start']))
            else:
                emit('<li>Index: 0x{:02x} ... 0x{:02x}</li>'.format(prop['index_start'], prop['index_end']))
            emit('<li>Summary: {}</li>'.format(prop['summary']))
            emit('<li>Purpose:</li>')
            if 'description' in prop:
                emit_description(prop['description'])
            if 'comments' in prop:
                emit('<li>Comments (internal):</li>')
                emit_description(prop['comments'])
            emit('<li>Defaults: ', False)
            emit('0x{}'.format(prop['default'][2:4]), False)
            pos = 4
            while pos < len(prop['default']):
                emit(', 0x{}'.format(prop['default'][pos:pos+2]), False)
                pos += 2
            emit('</li>')
            emit('<li>Register View:')
            emit_prop_field_table(prop, prop['params'])
            emit('</li>')
            emit('<li>Field Details:')
            emit_field_details(prop['params'], 'prop', pgroup['name'], True)
            emit('</li>')
            emit('</ul>')
            notes_title, notes_text = load_extra('api', 'prop', prop['name'].lower())
            if len(notes_text) > 0:
                if len(notes_title) > 0:
                    emit('<h5>{}</h5>'.format(notes_title))
                else:
                    emit('<h5>Notes</h5>')
                emit_markdown(notes_text, 5, 'API')
            emit('<hr />')

    emit('</body>')
    emit('</html>')
