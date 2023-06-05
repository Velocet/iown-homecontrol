import asyncio
import logging

from pyvlx import PYVLXLOG, PyVLX


async def main(loop):
    print('Log packets from Bus.')

    print('Setting debug')
    PYVLXLOG.setLevel(logging.DEBUG)
    stream_handler = logging.StreamHandler()
    stream_handler.setLevel(logging.DEBUG)
    PYVLXLOG.addHandler(stream_handler)

    print('Connecting to KLF 200')
    pyvlx = PyVLX('pyvlx.yaml', loop=loop)
    #pyvlx = PyVLX(host="192.168.2.127", password="velux123", loop=loop)

    print('Load Scenes')
    await pyvlx.load_scenes()
    print('Load Nodes')
    await pyvlx.load_nodes()
    await asyncio.sleep(90) # increase timeout for longer log time

    print('Cleanup because of terrible in handling lost connections')
    await pyvlx.disconnect()


if __name__ == '__main__':
    # pylint: disable=invalid-name
    print('Just a demo of the new PyVLX module.')
    LOOP = asyncio.get_event_loop()
    LOOP.run_until_complete(main(LOOP))
    # LOOP.run_forever()
    LOOP.close()
