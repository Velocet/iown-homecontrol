export enum BUSINESS_UNIT {
    USA = 'BU470',
    CZECH_REPUBLIC = 'BU230',
    POLAND = 'BU380',
    NETHERLAND = 'BU360',
    AUSTRIA = 'BU180',
    SWITZERLAND = 'BU430',
    DEUTSCHLAND = 'BU250',
    FRANCE = 'BU240',
    BELUX = 'BU190',
    NORWAY = 'BU530',
    SWEDEN = 'BU370',
    UK_IRELAND = 'BU460',
    ITALIE = 'BU320',
    ESPAGNE = 'BU420',
    PORTUGAL = 'BU390',
    GREECE= 'BU260',
    ROMANIE= 'BU510',
    HUNGARY= 'BU280',

}

const constants = {
    OAUTH: {
        JSON_WEB_TOKEN_NAME: 'jsonwebtoken',
        ACCESS_TOKEN_NAME: 'oauth2accesstoken',
        REFRESH_TOKEN_NAME: 'oauth2refreshtoken',
        SCOPE: 'oauth2scope',
        EXPIRE: 'oauth2expirein',

    },
    UNKNOWN_MAJ: 'Unknown',
    UNKNOWN: 'unknown',
    STATES_NAMES: {
        TYPE_ID: 1111,
        SOFT_VERSION: 'actuator_software_version'
    },
    STATE_TRANSFORMATIONS: {
        TRANSLATE: 'translate',
        TO_DATE: 'timestamp',
        UPPERCASE: 'uppercase',
        TO_DATE_FROM_ISO_STRING: 'iso-date',
    },
    CGU: {
        LANGUAGE: {
            'FRANCE': 'Conditions_juridiques_d_acces_a_la_solution_Serv-e-go_FR',
            'AUSTRIA': 'Legal_conditions_to_access_Serv-e-go_DE_Austria',
            'SWITZERLAND': 'Legal_conditions_to_access_Serv-e-go_DE_Switzerland',
            'DEUTSCHLAND': 'Legal_conditions_to_access_Serv-e-go_DE_Germany',
        }
    },
    IMG_NAMES : {
        'default': 'questionmark',
        'mss_camera_myfox_1': 'camera',
        'home_secure_rfid_badge': 'badge',
        'home_secure_siren_outdoor': 'siren_outdoor',
        'home_secure_siren_indoor': 'siren_indoor',
        'home_secure_keypad_lcd': 'clavier',
        'home_secure_remote_5': 'teleco',
        'connexoon': {
            'default': 'Connexoon',
            'icon': 'connexoon'
        },
        'tahoma_v2': {
            'default': 'TaHomaV2',
            'icon': 'TaHomaV2Gateway'
        },
        'tahoma': {
            'default': 'TaHomaV2',
            'icon': 'TaHomaV2Gateway'
        },
        'tahoma_rail_din': {
            'default': 'TaHomaRailDin',
            'icon': 'TaHomaRailDinGateway'
        },
        'tahoma_rail_din_dtc': {
            'default': 'TaHomaRailDinDtc',
            'icon': 'TaHomaRailDinDtcGateway'
        },
        'tahoma_v1': {
            'default': 'TaHomaV1',
            'icon': 'TaHomaGateway'
        },
        'tahoma_switch': {
            'default': 'TaHomaSwitch',
            'icon': 'TaHomaSwitch'
        },
        'hub_tahoma_2': {
            'default': 'TaHomaV2',
            'icon': 'TaHomaV2Gateway'
        },
        'hub_tahoma_1': {
            'default': 'TaHomaV1',
            'icon': 'TaHomaGateway'
        },
        'home_secure_gateway': {
            'default': 'HomeKeeper',
            'icon': 'homekeeper'
        },
        'hub_tahoma_raildin': {
            'default': 'TaHomaRailDin',
            'icon': 'TaHomaRailDinGateway'
        },
        'hub_connexoon': {
            'default': 'Connexoon',
            'icon': 'connexoon'
        },
        'hub_tahoma_switch': {
            'default': 'TaHomaSwitch',
            'icon': 'TaHomaSwitch'
        },
        'hub_tahoma_raildin_dtc': {
            'default': 'TaHomaRailDinDtc',
            'icon': 'TaHomaRailDinDtcGateway'
        },
        PROTOCOLS : {
            'io': 'io',
            'rts': 'rts',
            'rtd': 'rtd',
            'rtds': 'rtd',
            'rtn': 'rtn',
            'ramses': 'ramses',
            'enocean': 'enocean',
            'zwave': 'zwave',
            'camera': 'camera',
            'ovp': 'ovp',
            'modbus': 'modbus',
            'hue': 'hue',
            'internal': 'internal',
            'zigbee': 'zigbee',
            'upnpcontrol': 'upnpcontrol',
            'profalux868': 'profalux868',
            'ogp': 'ogp',
        },
        PIN_GATEWAY_ICONES: {
            '04': 'connexoon',
            '12': 'TaHomaV2Gateway',
            '22': 'TaHomaRailDinGateway',
            '20': 'TaHomaSwitch',
            '02': 'TaHomaGateway',
            '10': 'TaHomaRailDinGateway',
            '11': 'TaHomaV2Gateway',
            '08': 'connexoon'
        },
    },
    DEFECT: {
        'DEAD': 'DEFECT_BATTERY_DEAD',
        'NONE': 'DEFECT_NONE',
        'BATTERY_LOW': 'DEFECT_BATTERY_LOW',
        'VALUE_UNKNOWN': 'DEFECT_VALUE_UNKNOWN',
        'MAINTENANCE_REQUIRED': 'DEFECT_MAINTENANCE_REQUIRED',
        'MAINTENANCE_REQUIRED_VALUE': 'maintenanceRequired',
        'LOW_BATTERY': 'lowBattery',
        'BATTERY_DEAD': 'dead',
        'NODEFECT': 'nodefect'
    },
    FEEDBACK_NAME_VALUES: ['4', '8', '16', '17', '19', '20'],
    GATEWAYS : [
        'home_secure_gateway',
        'hub_tahoma_2',
        'hub_tahoma_1',
        'hub_tahoma_raildin',
        'hub_connexoon',
        'hub_tahoma_switch',
        'hub_tahoma_raildin_dtc',

    ],
    GATEWAYS_SERVEGO: [
        'hub_tahoma_2',
        'hub_tahoma_raildin',
        'hub_connexoon',
        'hub_tahoma_switch',
        'hub_tahoma_raildin_dtc',
    ],
    GATEWAYS_NAME: {
        TAHOMA_V2: 'hub_tahoma_2',
        CONNEXOON: 'hub_connexoon',
        TAHOMA_V1: 'hub_tahoma_1'
    },
    DATE_FORMATS : {
        DEFINITION : {
            'fr': 'dddd Do MMMM YYYY',
            'cs': 'dddd Do MMMM YYYY',
            'en': 'dddd, MMMM Do YYYY',
            'de': 'dddd, MMMM Do YYYY',
            'nl': 'dddd, MMMM Do YYYY',
        },
    },
    DEFAULTS : [
        'battery_low',
        'radio_quality'
    ],
    ADMIN: {
        URLS: {
            HOME: '/admin/home',
            LOGIN: '/admin/login'
        },
        COUNTRIES : [
            {
                value : 'FRANCE',
                code : 'FR',
                bu: BUSINESS_UNIT.FRANCE,
            },
            {
                value : 'DEUTSCHLAND',
                code : 'DE',
                bu: BUSINESS_UNIT.DEUTSCHLAND,
            },
            {
                value : 'AUSTRIA',
                code : 'AT',
                bu: BUSINESS_UNIT.AUSTRIA,
            },
            {
                value : 'POLAND',
                code : 'PL',
                bu: BUSINESS_UNIT.POLAND,
            },
            {
                value : 'USA',
                code : 'US',
                bu: BUSINESS_UNIT.USA,
            },
            {
                value : 'HUNGARY',
                code : 'HU',
                bu: BUSINESS_UNIT.HUNGARY,
            },
            {
                value : 'ROMANIE',
                code : 'RO',
                bu: BUSINESS_UNIT.ROMANIE,
            },
            {
                value : 'BELGIUM',
                code : 'BE',
                bu: BUSINESS_UNIT.BELUX,
            },
            {
                value : 'LUXEMBOURG',
                code : 'LU',
                bu: BUSINESS_UNIT.BELUX,
            },
            {
                value : 'GREECE',
                code : 'GR',
                bu: BUSINESS_UNIT.GREECE,
            },
            {
                value : 'CZECH_REPUBLIC',
                code : 'CZ',
                bu: BUSINESS_UNIT.CZECH_REPUBLIC,
            },
            {
                value : 'SPAIN',
                code : 'ES',
                bu: BUSINESS_UNIT.ESPAGNE,
            },
            {
                value : 'ITALIE',
                code : 'IT',
                bu: BUSINESS_UNIT.ITALIE,
            },
            {
                value : 'NETHERLAND',
                code : 'NL',
                bu: BUSINESS_UNIT.NETHERLAND,
            },
            {
                value : 'NORWAY',
                code : 'NO',
                bu: BUSINESS_UNIT.NORWAY,
            },
            {
                value : 'PORTUGAL',
                code : 'PT',
                bu: BUSINESS_UNIT.PORTUGAL,
            },
            {
                value : 'SWEDEN',
                code : 'SE',
                bu: BUSINESS_UNIT.SWEDEN,
            },
            {
                value : 'SWITZERLAND',
                code : 'CH',
                bu: BUSINESS_UNIT.SWITZERLAND,
            },
            {
                value : 'IRELAND',
                code : 'IE',
                bu: BUSINESS_UNIT.UK_IRELAND,
            },
            {
                value : 'UK',
                code : 'GB',
                bu: BUSINESS_UNIT.UK_IRELAND,
            },
            {
                value : 'SLOVAKIA',
                code : 'SK',
                bu: BUSINESS_UNIT.CZECH_REPUBLIC,
            },
            {
                value : 'ALBANIA',
                code : 'AL',
                bu: BUSINESS_UNIT.HUNGARY,
            },
            {
                value : 'BULGARIA',
                code : 'BG',
                bu: BUSINESS_UNIT.HUNGARY,
            },
            {
                value : 'CROATIA',
                code : 'HR',
                bu: BUSINESS_UNIT.HUNGARY,
            },
            {
                value : 'SERBIA',
                code : 'RS',
                bu: BUSINESS_UNIT.HUNGARY,
            },
            {
                value : 'SLOVENIA',
                code : 'SI',
                bu: BUSINESS_UNIT.HUNGARY,
            },
        ],
        COUNTRY_SOMFYPRO: [
            {
                value: 'fr',
                returnToSomfyProUrl: 'https://www.somfypro.fr',
                returnToSomfyProPreprodUrl: 'https://fr-b2b.ppr.somfy.com/',
            },
            {
                value: 'de',
                returnToSomfyProUrl: 'https://www.somfynetz.de',
                returnToSomfyProPreprodUrl: 'https://de-b2b.ppr.somfy.com/',
            },
            {
                value: 'ch',
                returnToSomfyProUrl: 'https://www.somfypro.ch',
                returnToSomfyProPreprodUrl: 'https://ch-b2b.ppr.somfy.com/',
            },
            {
                value: 'at',
                returnToSomfyProUrl: 'https://www.somfynetz.at',
                returnToSomfyProPreprodUrl: 'https://www.somfynetz.at',
            },
            {
                value: 'nl',
                returnToSomfyProUrl: 'https://www.somfypro.nl/',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.nl/',
            },
            {
                value: 'pl',
                returnToSomfyProUrl: 'https://www.somfybiznes.pl',
                returnToSomfyProPreprodUrl: 'https://www.somfybiznes.pl',
            },
            {
                value: 'cz',
                returnToSomfyProUrl: 'https://www.somfypro.cz',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.cz',
            },
            {
                value: 'us',
                returnToSomfyProUrl: 'https://www.somfypro.com',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.com',
            },
            {
                value: 'be',
                returnToSomfyProUrl: 'https://www.somfypro.be',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.be',
            },
            {
                value: 'no',
                returnToSomfyProUrl: 'https://www.somfypro.com',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.com',
            },
            {
                value: 'se',
                returnToSomfyProUrl: 'https://www.somfypro.se',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.se',
            },
            {
                value: 'ie',
                returnToSomfyProUrl: 'https://www.somfypro.co.uk',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.co.uk',
            },
            {
                value: 'dk',
                returnToSomfyProUrl: 'https://www.somfynordic.dk',
                returnToSomfyProPreprodUrl: 'https://www.somfynordic.dk',
            },
            {
                value: 'fi',
                returnToSomfyProUrl: 'https://www.somfynordic.fi',
                returnToSomfyProPreprodUrl: 'https://www.somfynordic.fi',
            },
            {
                value: 'lu',
                returnToSomfyProUrl: 'https://www.somfypro.be',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.be',
            },
            {
                value: 'uk',
                returnToSomfyProUrl: 'https://www.somfypro.co.uk',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.co.uk',
            },
            {
                value: 'it',
                returnToSomfyProUrl: 'https://www.somfypro.it',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.it',
            },
            {
                value: 'pt',
                returnToSomfyProUrl: 'https://www.somfy-profissional.pt',
                returnToSomfyProPreprodUrl: 'https://www.somfy-profissional.pt',
            },
            {
                value: 'es',
                returnToSomfyProUrl: 'https://www.somfy-profesional.es',
                returnToSomfyProPreprodUrl: 'https://www.somfy-profesional.es',
            },
            {
                value: 'gr',
                returnToSomfyProUrl: 'https://www.somfypro.gr',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.gr',
            },
            {
                value: 'ro',
                returnToSomfyProUrl: 'https://www.somfypro.ro',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.ro',
            },
            {
                value: 'hu',
                returnToSomfyProUrl: 'https://www.somfypro.hu',
                returnToSomfyProPreprodUrl: 'https://www.somfypro.hu',
            },
        ],
        BU: [
            {
                value: BUSINESS_UNIT.FRANCE,
                viewValue: 'COUNTRY_FRANCE',
            },
            {
                value: BUSINESS_UNIT.DEUTSCHLAND,
                viewValue: 'COUNTRY_DEUTSCHLAND',
            },
            {
                value: BUSINESS_UNIT.SWITZERLAND,
                viewValue: 'COUNTRY_SWITZERLAND',
            },
            {
                value: BUSINESS_UNIT.AUSTRIA,
                viewValue: 'COUNTRY_AUSTRIA',
            },
            {
                value: BUSINESS_UNIT.NETHERLAND,
                viewValue: 'COUNTRY_NETHERLAND',
            },
            {
                value: BUSINESS_UNIT.POLAND,
                viewValue: 'COUNTRY_POLAND',
            },
            {
                value: BUSINESS_UNIT.CZECH_REPUBLIC,
                viewValue: 'COUNTRY_CZECH_REPUBLIC',
            },
            {
                value: BUSINESS_UNIT.USA,
                viewValue: 'COUNTRY_US',
            },
            {
                value: BUSINESS_UNIT.BELUX,
                viewValue: 'COUNTRY_BELUX',
            },
            {
                value: BUSINESS_UNIT.NORWAY,
                viewValue: 'COUNTRY_NORWAY',
            },
            {
                value: BUSINESS_UNIT.SWEDEN,
                viewValue: 'COUNTRY_SWEDEN',
            },
            {
                value: BUSINESS_UNIT.UK_IRELAND,
                viewValue: 'COUNTRY_UK_IRELAND',
            },
            {
                value: BUSINESS_UNIT.ITALIE,
                viewValue: 'COUNTRY_ITALIE',
            },
            {
                value: BUSINESS_UNIT.ESPAGNE,
                viewValue: 'COUNTRY_ESPAGNE',
            },
            {
                value: BUSINESS_UNIT.GREECE,
                viewValue: 'COUNTRY_GREECE',
            },
            {
                value: BUSINESS_UNIT.PORTUGAL,
                viewValue: 'COUNTRY_PORTUGAL',
            },
            {
                value: BUSINESS_UNIT.ROMANIE,
                viewValue: 'COUNTRY_ROMANIE',
            },
            {
                value: BUSINESS_UNIT.HUNGARY,
                viewValue: 'COUNTRY_HUNGARY',
            },
        ],
        BU_COUNTRY: [
            {
                bu: BUSINESS_UNIT.FRANCE,
                country: ['FRANCE'],
            },
            {
                bu: BUSINESS_UNIT.DEUTSCHLAND,
                country: ['DEUTSCHLAND'],
            },
            {
                bu: BUSINESS_UNIT.SWITZERLAND,
                country: ['SWITZERLAND'],
            },
            {
                bu: BUSINESS_UNIT.AUSTRIA,
                country: ['AUSTRIA'],
            },
            {
                bu: BUSINESS_UNIT.NETHERLAND,
                country: ['NETHERLAND'],
            },
            {
                bu: BUSINESS_UNIT.POLAND,
                country: ['POLAND'],
            },
            {
                bu: BUSINESS_UNIT.CZECH_REPUBLIC,
                country: ['CZECH_REPUBLIC', 'SLOVAKIA'],
            },
            {
                bu: BUSINESS_UNIT.USA,
                country: ['USA'],
            },
            {
                bu: BUSINESS_UNIT.BELUX,
                country: ['LUXEMBOURG', 'BELGIUM'],
            },
            {
                bu: BUSINESS_UNIT.NORWAY,
                country: ['NORWAY'],
            },
            {
                bu: BUSINESS_UNIT.SWEDEN,
                country: ['SWEDEN'],
            },
            {
                bu: BUSINESS_UNIT.UK_IRELAND,
                country: ['IRELAND', 'UK'],
            },
            {
                bu: BUSINESS_UNIT.ITALIE,
                country: ['ITALIE'],
            },
            {
                bu: BUSINESS_UNIT.ESPAGNE,
                country: ['SPAIN'],
            },
            {
                bu: BUSINESS_UNIT.GREECE,
                country: ['GREECE'],
            },
            {
                bu: BUSINESS_UNIT.PORTUGAL,
                country: ['PORTUGAL'],
            },
            {
                bu: BUSINESS_UNIT.ROMANIE,
                country: ['ROMANIE'],
            },
            {
                bu: BUSINESS_UNIT.HUNGARY,
                country: ['HUNGARY', 'ALBANIA', 'BULGARIA', 'CROATIA', 'SERBIA', 'SLOVENIA'],
            },
        ],
        ROLES: [
            {
                value: 'SUPER_ADMIN',
                viewValue: 'Super ADMIN'
            },
            {
                value: 'BA_ADMIN',
                viewValue: 'ADMIN BA'
            },
            {
                value: 'TECHNICIEN_ADMIN',
                viewValue: 'ADMIN TECHNICIEN'
            }
        ]
    },
    GPS_COORDINATES: {
        PARIS_DEFAULT: {
            latitude: 48.857,
            longitude: 2.343
        },
    },
    LOCAL_STORAGE_APP_PREFIX: 'serv-e-go',
    LOCAL_STORAGE_DEV_TOOL_KEY: 'devtool-enabled',
    LOCAL_STORAGE_DEV_TOOL_COLLAPSED_KEY: 'devtool-collapsed',
    LOCAL_STORAGE_DEV_TOOL_BYPASS_SSO_KEY: 'bypass-sso',
    LOCAL_STORAGE_DEV_TOOL_BYPASS_BULLET_HQ_KEY: 'bypass-bullet-hq',
    LOCAL_STORAGE_DEV_TOOL_OVERRIDE_INSTALLER_KEY: 'installer-override',
    LOCAL_STORAGE_DEV_TOOL_GET_DEVICES_SYNCH_KEY: 'get-devices-synch-override',
    LOCAL_STORAGE_BYPASS_ONBOARDING: 'bypassonboarding',
    LOCAL_STORAGE_DEV_TOOL_BYPASS_SALESFORCE_KEY: 'devtool-bypass-salesforce',
    AVAILABLE_APP_LOCALE: [
        {
            shortName: 'fr',
            name: 'Français',
        },
        {
            shortName: 'de',
            name: 'Deutsch',
        },
        {
            shortName: 'en',
            name: 'English',
        },
        {
            shortName: 'nl',
            name: 'Nederlands',
        },
        {
            shortName: 'cz',
            name: 'Čeština',
        },
        {
            shortName: 'da',
            name: 'Dansk',
        },
        {
            shortName: 'fi',
            name: 'Suomi',
        },
        {
            shortName: 'nn',
            name: 'Norsk',
        },
        {
            shortName: 'pl',
            name: 'Język polski',
        },
        {
            shortName: 'sv',
            name: 'Svenska',
        },
        {
            shortName: 'el',
            name: 'Ελληνικά',
        },
        {
            shortName: 'it',
            name: 'Italiano',
        },
        {
            shortName: 'es',
            name: 'Español',
        },
        {
            shortName: 'pt',
            name: 'Português',
        },
        {
            shortName: 'sk',
            name: 'Slovenčina',
        },
        {
            shortName: 'ro',
            name: 'Română',
        },
        {
            shortName: 'hu',
            name: 'magyar',
        },
    ],
    ALERT_SLIDER_PARAMETER_NAME : {
        ALERT_NOMBRE_CYCLE_AWG: 'cycleNumberAwg',
        ALERT_MAINTENANCE_ACCESS_CYCLE: 'cycleNumberAccess',
        ALERT_MAINTENANCE_AWG_FREQUENCY: 'productionAlertFrequence',
        ALERT_MAINTENANCE_ACCESS_NUMBER_OF_OBSTACLE: 'numberOfObstacle',
        ALERT_NUMBER_BATTERY_LOW: 'numberOfBatteryLow'
    },
    SUPPORT_PAGE_CONTACT: {
        fr: 'https://www.somfypro.fr/contactez-nous',
        de: 'https://www.somfy.de/hilfe-center',
        nl: 'https://www.somfypro.nl/algemene-vraag',
        en: 'https://www.somfypro.co.uk/contact-us',
        ch: 'https://www.somfypro.ch/contact',
        at: 'https://www.somfy.at/hilfe-center',
        pl: 'https://www.somfybiznes.pl/kontakt-z-somfy',
        cz: 'https://www.somfypro.cz/kontakty',
        us: 'https://www.somfypro.com/contact-us',
        be: 'https://www.somfypro.be/contact',
        no: 'https://www.somfynordic.com/kontakt-oss1',
        se: 'https://www.somfynordic.se/kontakta-oss',
        ie: 'https://www.somfypro.co.uk/contact-us',
        dk: 'https://www.somfynordic.dk/kontakt-os1',
        fi: 'https://www.somfynordic.fi/why_choose_somfy',
        lu: 'https://www.somfypro.be/contact',
        uk: 'https://www.somfypro.co.uk/contact-us',
        it: 'https://www.somfypro.it/contatti',
        pt: 'https://www.somfy-profissional.pt/contacto',
        es: 'https://www.somfy-profesional.es/contacto',
        gr: 'https://www.somfypro.gr/contact-us',
        ro: 'https://www.somfypro.ro/contact',
        hu: 'https://www.somfypro.hu/kapcsolat'
    },
    BACK_TO_SOMFY_PRO: {
        fr: 'https://www.somfypro.fr',
        de: 'https://www.somfynetz.de',
        nl: 'https://www.somfypro.nl/',
        en: 'https://www.somfypro.co.uk',
        ch: 'https://www.somfypro.ch',
        at: 'https://www.somfynetz.at',
        pl: 'https://www.somfybiznes.pl',
        cz: 'https://www.somfypro.cz',
        us: 'https://www.somfypro.com',
        be: 'https://www.somfypro.be',
        no: 'https://www.somfypro.com',
        se: 'https://www.somfypro.se',
        ie: 'https://www.somfypro.co.uk',
        dk: 'https://www.somfynordic.dk',
        fi: 'https://www.somfynordic.fi',
        lu: 'https://www.somfypro.be',
        uk: 'https://www.somfypro.co.uk',
        it: 'https://www.somfypro.it',
        pt: 'https://www.somfy-profissional.pt',
        es: 'https://www.somfy-profesional.es',
        gr: 'https://www.somfypro.gr',
        ro: 'https://www.somfypro.ro',
        hu: 'https://www.somfypro.hu'
    },

};
export enum ADMIN_ROLES {
    ba_admin = 'ba_admin',
    technicien_admin = 'technicien_admin',
    super_admin = 'super_admin',
}
export default constants;
