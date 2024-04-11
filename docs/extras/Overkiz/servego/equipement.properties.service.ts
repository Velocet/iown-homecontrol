import { of as observableOf, Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { Buffer } from 'buffer';
import {
    isArray,
    isArrayBuffer,
    isArrayLikeObject,
    isBoolean,
    isBuffer,
    isEmpty,
    isInteger,
    isNumber,
    isString,
    isUndefined,
} from 'lodash';
import * as moment from 'moment';
import Constants from '../../../const';
import { DefUiProperty } from '../models/DefUiProperty';
import { DeviceMS } from '../models/Device';
import {
    computeStateValueExpression,
    convertTimeStampToDateMomentjs,
    momentLLLLWithoutTime,
    sanitizeEMS2StateString,
    numberToFixed,
} from '../../utils';

@Injectable()
export class EquipementPropertiesService {
    // Map with all functions
    private functions = {
        all: {
            EQUIPMENT_DETAIL_OEM_NAME: {
                read: sanitizeEMS2StateString,
            },
            OF_NB: {
                read: sanitizeEMS2StateString,
            },
            CDE_NB: {
                read: sanitizeEMS2StateString,
            },
            CLIENT_MODEL_NAME: {
                read: sanitizeEMS2StateString,
            },
            CLIENT_MODEL_REFERENCE: {
                read: sanitizeEMS2StateString,
            },
            CUSTOMER_PRODUCTION_DATE: {
                read: (val: string) => {
                    // date is a 6 digits string "ddmmyy"
                    const str = sanitizeEMS2StateString(val);
                    if (str.length === 0) {
                        return '';
                    }
                    /*if (str.length === 6) {
                        // return the unix timestamp (seconds)
                        // this will be formatted later with momentjs
                        return moment(str, 'DDMMYY').unix();
                    }*/
                    return str;
                },
            },
            RSSI_LEVEL: {
                read: (val) => {
                    switch (true) {
                        case val > 60:
                            return 'EXCELLENT';
                        case val <= 60 && val > 20:
                            return 'BON';
                        case val <= 20:
                            return 'FAIBLE';
                    }
                },
            },
            EQUIPMENT_AVAILABLE: {
                read: (val) => {
                    if (val === true || val === 'true') {
                        return 'AVAILABLE';
                    } else {
                        return 'UNAVAILABLE';
                    }
                },
            },
            EQUIPMENT_DETAIL_STATE_BACK_IMPULSE: {
                read: (val) => {
                    if (isInteger(val) && val > 0) {
                        return 'YES';
                    }
                    return 'NO';
                },
            },
            labelChoice: (val, label) => `${label}_${val}`,
            EQUIPMENT_DETAIL_IO_PROFIL: {
                read: (val) => {
                    if (isArray(val)) {
                        return val[0];
                    } else {
                        return val;
                    }
                },
            },
            EQUIPMENT_DETAIL_LATEST_MOTOR_STOP: {
                read: (val) => {
                    const supportedVals = [
                        '1',
                        '49152',
                        '49153',
                        '49154',
                        '49155',
                        '49156',
                        '36864',
                        '36867',
                        '36868',
                    ];
                    if (supportedVals.indexOf(`${val}`) === -1) {
                        return 'NC';
                    }
                    return `EQUIPMENT_DETAIL_LATEST_MOTOR_STOP_${val}`;
                },
            },
            EQUIPMENT_DETAIL_INSTALLER: {
                read: (val) => {
                    if (
                        isBuffer(val) ||
                        isArray(val) ||
                        isArrayBuffer(val) ||
                        isArrayLikeObject(val) ||
                        isString(val)
                    ) {
                        const decodedVal = Buffer.from(val, 'base64');
                        if (decodedVal.length >= 16) {
                            const valueInstallerDetail = decodedVal.slice(3);
                            // Slice buffer to get only characters from comments value
                            const installerDetail = valueInstallerDetail.slice(
                                0,
                                15,
                            );
                            const valueInfo = installerDetail
                                .toString()
                                .replace(/[^\x20-\xFF]/g, '');
                            if (valueInfo.length === 0) {
                                console.warn(
                                    'EQUIPMENT_DETAIL_INSTALLER weird value: buffer does not have the right size',
                                );
                                return '';
                            }
                            return valueInfo;
                        }
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLER unavailable: buffer does not have the right size',
                        );
                        return '';
                    } else {
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLER unavailable: value is not a string / array / buffer',
                            val,
                        );
                        return '';
                    }
                },
            },
            EQUIPMENT_DETAIL_INSTALLATION_DATE: {
                read: (val) => {
                    if (
                        isBuffer(val) ||
                        isArray(val) ||
                        isArrayBuffer(val) ||
                        isArrayLikeObject(val) ||
                        isString(val)
                    ) {
                        const decodedVal = Buffer.from(val, 'base64');
                        if (decodedVal.length >= 19) {
                            const value = decodedVal.slice(3);
                            // Slice buffer to get only 2 characters from date
                            const dateInfo = value.slice(15, 17);
                            const valueInfo = dateInfo
                                .toString()
                                .replace(/[^\x20-\xFF]/g, '');
                            if (valueInfo.length === 0) {
                                console.warn(
                                    'EQUIPMENT_DETAIL_INSTALLER weird value: buffer does not have the right size',
                                );
                                return '';
                            }
                            const daysToAdd = dateInfo.readUIntBE(0, 2);
                            // Get integer value and add it to 01/01/2006 to get date
                            const computedDateOfInstall = moment(
                                '01/01/2006',
                                'DD/MM/YYYY',
                            ).add(daysToAdd, 'days');

                            if (
                                computedDateOfInstall.valueOf() > moment().valueOf()
                            ) {
                                console.warn(
                                    `EQUIPMENT_DETAIL_INSTALLATION_DATE unavailable: Weird install date. Install date is in the future(${computedDateOfInstall.format(
                                        'DD/MM/YYYY',
                                    )})....looks like the buffer data are wrong OR not set`,
                                );
                                return '';
                            }
                            return computedDateOfInstall.format('L');
                        }
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLATION_DATE unavailable: buffer does not have the right size',
                        );
                        return '';
                    } else {
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLATION_DATE unavailable: value is not a string / array / buffer',
                            val,
                        );
                        return '';
                    }
                },
            },
            EQUIPMENT_DETAIL_FREE_INFORMATION: {
                read: (val) => {
                    if (
                        isBuffer(val) ||
                        isArray(val) ||
                        isArrayBuffer(val) ||
                        isArrayLikeObject(val) ||
                        isString(val)
                    ) {
                        // Convert string in base64
                        const decodedVal = Buffer.from(val, 'base64');
                        if (decodedVal.length >= 63) {
                            const value = decodedVal.slice(3);
                            // Slice buffer to get only characters from comments value
                            const commentInfo = value.slice(17, 64);
                            return commentInfo
                                .toString()
                                .replace(/[^\x20-\xFF]/g, '');
                        }
                        console.warn(
                            'EQUIPMENT_DETAIL_FREE_INFORMATION unavailable: buffer does not have the right size',
                        );
                        return '';
                    } else {
                        console.warn(
                            'EQUIPMENT_DETAIL_FREE_INFORMATION unavailable: value is not a string / array / buffer',
                            val,
                        );
                        return '';
                    }
                },
                write: (oldVal, newVal) => {
                    // Convert old value from base64
                    let oldValueBuffer = Buffer.from(oldVal, 'base64');

                    // Slice buffer to get only characters to write
                    oldValueBuffer = oldValueBuffer.slice(0, 17);

                    // Write new value beginning at chars 20
                    const newValueBuffer = Buffer.allocUnsafe(143);
                    newValueBuffer.write(
                        newVal.substring(0, 143),
                        0,
                        newVal.substring(0, 143).length,
                    );
                    return Buffer.concat([oldValueBuffer, newValueBuffer]).toString(
                        'hex',
                    );
                },
            },
            EQUIPMENT_DETAIL_INSTALLER_SMART: {
                read: (val) => {
                    if (
                        isBuffer(val) ||
                        isArray(val) ||
                        isArrayBuffer(val) ||
                        isArrayLikeObject(val) ||
                        isString(val)
                    ) {
                        const decodedVal = Buffer.from(val, 'base64');
                        if (decodedVal.length >= 16) {
                            const installerDetail = decodedVal.slice(0, 15);
                            const valueInfo = installerDetail
                                .toString()
                                .replace(/[^\x20-\xFF]/g, '');
                            if (valueInfo.length === 0) {
                                console.warn(
                                    'EQUIPMENT_DETAIL_INSTALLER weird value: buffer does not have the right size',
                                );
                                return '';
                            }
                            return valueInfo;
                        }
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLER unavailable: buffer does not have the right size',
                        );
                        return '';
                    } else {
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLER unavailable: value is not a string / array / buffer',
                            val,
                        );
                        return '';
                    }
                },
            },
            EQUIPMENT_DETAIL_INSTALLATION_DATE_SMART: {
                read: (val) => {
                    if (
                        isBuffer(val) ||
                        isArray(val) ||
                        isArrayBuffer(val) ||
                        isArrayLikeObject(val) ||
                        isString(val)
                    ) {
                        const decodedVal = Buffer.from(val, 'base64');
                        if (decodedVal.length >= 19) {
                            const dateInfo = decodedVal.slice(15, 17);
                            const daysToAdd = dateInfo.readUIntBE(0, 2);
                            // Get integer value and add it to 01/01/2006 to get date
                            const computedDateOfInstall = moment(
                                '01/01/2006',
                                'DD/MM/YYYY',
                            ).add(daysToAdd, 'days');

                            if (
                                computedDateOfInstall.valueOf() > moment().valueOf()
                            ) {
                                console.warn(
                                    `EQUIPMENT_DETAIL_INSTALLATION_DATE unavailable: Weird install date. Install date is in the future(${computedDateOfInstall.format(
                                        'DD/MM/YYYY',
                                    )})....looks like the buffer data are wrong OR not set`,
                                );
                                return '';
                            }
                            return computedDateOfInstall.format('L');
                        }
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLATION_DATE unavailable: buffer does not have the right size',
                        );
                        return '';
                    } else {
                        console.warn(
                            'EQUIPMENT_DETAIL_INSTALLATION_DATE unavailable: value is not a string / array / buffer',
                            val,
                        );
                        return '';
                    }
                },
            },
            EQUIPMENT_DETAIL_FREE_INFORMATION_SMART: {
                read: (val) => {
                    if (
                        isBuffer(val) ||
                        isArray(val) ||
                        isArrayBuffer(val) ||
                        isArrayLikeObject(val) ||
                        isString(val)
                    ) {
                        // Convert string in base64
                        const decodedVal = Buffer.from(val, 'base64');
                        if (decodedVal.length >= 63) {
                            const commentInfo = decodedVal.slice(17, 64);
                            return commentInfo
                                .toString()
                                .replace(/[^\x20-\xFF]/g, '');
                        }
                        console.warn(
                            'EQUIPMENT_DETAIL_FREE_INFORMATION unavailable: buffer does not have the right size',
                        );
                        return '';
                    } else {
                        console.warn(
                            'EQUIPMENT_DETAIL_FREE_INFORMATION unavailable: value is not a string / array / buffer',
                            val,
                        );
                        return '';
                    }
                },
                write: (oldVal, newVal) => {
                    // Convert old value from base64
                    let oldValueBuffer = Buffer.from(oldVal, 'base64');

                    // Slice buffer to get only characters to write
                    oldValueBuffer = oldValueBuffer.slice(0, 17);

                    // Write new value beginning at chars 20
                    const newValueBuffer = Buffer.allocUnsafe(143);
                    console.warn('getting temp info');
                    newValueBuffer.write(
                        newVal.substring(0, 143),
                        0,
                        newVal.substring(0, 143).length,
                    );
                    return Buffer.concat([oldValueBuffer, newValueBuffer]).toString(
                        'hex',
                    );
                },
            },
            EQUIPMENT_DETAIL_GENERAL_ELD_LEVEL: {
                read: (val) => {
                    return this.getTranslationKeyFromValue(
                        'EQUIPMENT_DETAIL_GENERAL_ELD_LEVEL',
                        val,
                    );
                },
            },
            LIST_OF_LAST_10_DEFAULTS: {
                read: (val) => {
                    return this.getTranslationKeyArrayFromValue(
                        'LIST_OF_LAST_10_DEFAULTS',
                        val,
                    );
                },
            },
            BOX_UPTODATE: {
                read: (val) => {
                    return val;
                },
            },
            EQUIPMENT_WINDOW_EXPOSURE: {
                read: (val) => {
                    switch (true) {
                        case (val >= 60 && val <= 359) || (val >= 0 && val <= 22):
                            return 'EQUIPMENT_WINDOW_EXPOSURE_0';
                        case val >= 23 && val <= 67:
                            return 'EQUIPMENT_WINDOW_EXPOSURE_45';
                        case val >= 68 && val <= 112:
                            return 'EQUIPMENT_WINDOW_EXPOSURE_90';
                        case val >= 113 && val <= 157:
                            return 'EQUIPMENT_WINDOW_EXPOSURE_135';
                        case val >= 158 && val <= 202:
                            return 'EQUIPMENT_WINDOW_EXPOSURE_180';
                        case val >= 203 && val <= 247:
                            return 'EQUIPMENT_WINDOW_EXPOSURE_225';
                        case val >= 248 && val <= 292:
                            return 'EQUIPMENT_WINDOW_EXPOSURE_270';
                        case val >= 293 && val <= 337:
                            return 'EQUIPMENT_WINDOW_EXPOSURE_315';
                    }
                },
            },
            EQUIPMENT_WINDOW_SENSED_PANEL: {
                read: (val) => {
                    if (val !== 0 && val !== 1) {
                        return this.getTranslationKeyFromValue(
                            'EQUIPMENT_WINDOW_SENSED_PANEL',
                            255,
                        );
                    }
                    return this.getTranslationKeyFromValue(
                        'EQUIPMENT_WINDOW_SENSED_PANEL',
                        val,
                    );
                },
            },
            EQUIPMENT_WINDOW_MODEL_NAME: {
                read: (val) => {
                    const decodedVal = Buffer.from(val, 'base64');
                    const valueInfo = decodedVal
                        .toString()
                        .replace(/[^\x20-\xFF]/g, '');
                    if (valueInfo.length === 0) {
                        return '';
                    }
                    return val.trim();
                },
            },
            EQUIPMENT_WINDOW_FITTING_RANGE: {
                read: (val) => {
                    const decodedVal = Buffer.from(val, 'base64');
                    const valueInfo = decodedVal
                        .toString()
                        .replace(/[^\x20-\xFF]/g, '');
                    if (valueInfo.length === 0) {
                        return '';
                    }
                    return val.trim();
                },
            },
            EQUIPMENT_WINDOW_GLAZING_RANGE: {
                read: (val) => {
                    const decodedVal = Buffer.from(val, 'base64');
                    const valueInfo = decodedVal
                        .toString()
                        .replace(/[^\x20-\xFF]/g, '');
                    if (valueInfo.length === 0) {
                        return '';
                    }
                    return val.trim();
                },
            },
            EQUIPMENT_WINDOW_EXTERIOR_APPEARANCE: {
                read: (val) => {
                    const decodedVal = Buffer.from(val, 'base64');
                    const valueInfo = decodedVal
                        .toString()
                        .replace(/[^\x20-\xFF]/g, '');
                    if (valueInfo.length === 0) {
                        return '';
                    }
                    return val.trim();
                },
            },
            EQUIPMENT_WINDOW_INTERIOR_APPEARANCE: {
                read: (val) => {
                    const decodedVal = Buffer.from(val, 'base64');
                    const valueInfo = decodedVal
                        .toString()
                        .replace(/[^\x20-\xFF]/g, '');
                    if (valueInfo.length === 0) {
                        return '';
                    }
                    return val.trim();
                },
            },
            EQUIPMENT_TOTAL_ACTUATOR_FUNCTIONING_SECONDS: {
                read: (val) => {
                    if (isInteger(val)) {
                        return val;
                    }
                    console.warn(
                        'EQUIPMENT_TOTAL_ACTUATOR_FUNCTIONING_SECONDS unavailable: value is not a an integer',
                        val,
                    );
                    return '';
                },
            },
            NUMBER_OF_INTRUSION_DETECTED_PER_REACHED_THRESHOLD_OF_VIBRATION: {
                read: (val) => {
                    if (isArray(val) || isArrayLikeObject(val)) {
                        return val;
                    }
                    console.warn(
                        'EQUIPMENT_TOTAL_ACTUATOR_FUNCTIONING_SECONDS unavailable: value is not a an integer',
                        val,
                    );
                    return [];
                },
            },
            MAX_ACCEPTABLE_SINK_CURRENT: {
                read: numberToFixed(1),
            },
            EQUIPMENT_DETAIL_POWER_SUPPLY_MIN: {
                read: numberToFixed(2),
            },
            EQUIPMENT_DETAIL_POWER_SUPPLY_MAX: {
                read: numberToFixed(2),
            },
            EQUIPMENT_DETAIL_POWER_SUPPLY_MAX_RMS_VALUE: {
                read: numberToFixed(2),
            },
        },
        generic_sensor_io: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.MAINTENANCE_REQUIRED_VALUE:
                            return Constants.DEFECT.BATTERY_LOW;
                        case Constants.DEFECT.NODEFECT:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        sunis_wirefree_io_2: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.MAINTENANCE_REQUIRED_VALUE:
                            return Constants.DEFECT.BATTERY_LOW;
                        case Constants.DEFECT.NODEFECT:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        sunis_wirefree_io: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.MAINTENANCE_REQUIRED_VALUE:
                            return Constants.DEFECT.BATTERY_LOW;
                        case Constants.DEFECT.NODEFECT:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        thermis_v2: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.MAINTENANCE_REQUIRED_VALUE:
                            return Constants.DEFECT.BATTERY_LOW;
                        case Constants.DEFECT.NODEFECT:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        thermis_v1: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.MAINTENANCE_REQUIRED_VALUE:
                            return Constants.DEFECT.BATTERY_LOW;
                        case Constants.DEFECT.NODEFECT:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        intellitag_tilt: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.MAINTENANCE_REQUIRED_VALUE:
                            return Constants.DEFECT.BATTERY_LOW;
                        case Constants.DEFECT.NODEFECT:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        intellitag_sliding: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.MAINTENANCE_REQUIRED_VALUE:
                            return Constants.DEFECT.BATTERY_LOW;
                        case Constants.DEFECT.NODEFECT:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        rollixo_smart_io: {
            unknownValueAvailable: true,
            SAFETY_EDGE_TECHNOLOGY: {
                read: (val) => {
                    // Temporary fix, as there is a bug in Access Actuator property given a value on 2 octets
                    if (val > 3) {
                        return 'Unknown';
                    }
                    return 'SAFETY_EDGE_TECHNOLOGY_' + val;
                },
            },
        },
        rs100_io: {
            EQUIPMENT_MANUFACTURING_DATE: {
                read: (val) => {
                    // Date is formatted DDDYY number of the day from beginning of year
                    if (!isUndefined(val)) {
                        return moment(
                            `01/01/${parseInt(val.substring(3, 5), 10)}`,
                            'DD/MM/YY',
                        )
                            .add(parseInt(val.substring(0, 3), 10), 'days')
                            .format('DD/MM/YYYY');
                    } else {
                        return val;
                    }
                },
            },
        },
        sunilus_screen_io: {
            DEFECT: {
                unknownValueAvailable: true,
                read: (val) => {
                    switch (val) {
                        case Constants.UNKNOWN_MAJ:
                            return Constants.DEFECT.NONE;
                        case Constants.DEFECT.BATTERY_DEAD:
                            return Constants.DEFECT.DEAD;
                        default:
                            return Constants.DEFECT.VALUE_UNKNOWN;
                    }
                },
            },
        },
        elixo_smart_io: {
            PEDESTRIAN_OPENING_POSITION: {
                read: (val) => {
                    return val * 10;
                },
            },
        },
        sliding_air: {
            EQUIPMENT_DETAIL_FEEDBACK_NAME: {
                read: (val) => {
                    if (!Constants.FEEDBACK_NAME_VALUES.includes(val)) {
                        return this.getTranslationKeyFromValue(
                            'EQUIPMENT_DETAIL_FEEDBACK_NAME',
                            'default',
                        );
                    }
                    return this.getTranslationKeyFromValue(
                        'EQUIPMENT_DETAIL_FEEDBACK_NAME',
                        val,
                    );
                },
            },
        },
        sliding_air_v1: {
            EQUIPMENT_DETAIL_FEEDBACK_NAME: {
                unknownValueAvailable: true,
                read: (val) => {
                    if (this.isUnknown(val)) {
                        return 'EQUIPMENT_DETAIL_FEEDBACK_NAME_NO_DEFAULT';
                    }
                    if (!Constants.FEEDBACK_NAME_VALUES.includes(val)) {
                        return this.getTranslationKeyFromValue(
                            'EQUIPMENT_DETAIL_FEEDBACK_NAME',
                            'default',
                        );
                    }
                    return this.getTranslationKeyFromValue(
                        'EQUIPMENT_DETAIL_FEEDBACK_NAME',
                        val,
                    );
                },
            },
        },
        sunea_40_solar_io: {
            PRODUCTNAME_COMMERCIAL_NAME: {
                read: (val) => val.replace(/\?/g, ''),
            },
        },
    };

    private isUnknown(val) {
        return val === Constants.UNKNOWN || val === Constants.UNKNOWN_MAJ;
    }

    constructor(private translateService: TranslateService) {}

    getPropertiesValue(
        deviceType,
        propertyLabel,
        propertyValue,
        list = false,
    ): string {
        if (
            this.functions?.[deviceType]?.[propertyLabel] &&
            (!this.isUnknown(propertyValue) ||
                this.functions[deviceType][propertyLabel]['unknownValueAvailable'])
        ) {
            return this.functions[deviceType][propertyLabel].read(propertyValue);
        }

        if (
            this.functions['all']?.[propertyLabel] &&
            !this.isUnknown(propertyValue)
        ) {
            return this.functions['all'][propertyLabel].read(propertyValue);
        }

        if (list && !this.isUnknown(propertyValue)) {
            return this.functions['all'].labelChoice(propertyValue, propertyLabel);
        }

        return propertyValue;
    }

    getWriteValue(deviceType, propertyLabel, propertyValue, oldValue): string {
        if (this.functions?.[deviceType]?.[propertyLabel]) {
            return this.functions[deviceType][propertyLabel].write(
                oldValue,
                propertyValue,
            );
        }

        if (
            this.functions['all']?.[propertyLabel] &&
            !this.isUnknown(propertyValue)
        ) {
            return this.functions['all'][propertyLabel].write(
                oldValue,
                propertyValue,
            );
        }

        return propertyValue;
    }

    public toDate(value: string | number): string {
        if (typeof value === 'string' && value.trim().length === 0) {
            return '';
        }

        try {
            return convertTimeStampToDateMomentjs(
                value,
                this.translateService.currentLang,
                momentLLLLWithoutTime(),
            );
        } catch (e) {
            console.warn(e);
            return '';
        }
    }

    toDateFromIsoString(value: string, locale: string): string {
        return moment(value).locale(locale).format('LL');
    }

    public translate(value): Observable<string> {
        if (value && isString(value) && !isUndefined(value)) {
            return this.translateService.stream(value);
        }
        return observableOf('');
    }

    public toUpperCase(value): string {
        return value.toUpperCase();
    }

    public getTranslationKeyFromValue(key, value) {
        if (value) {
            return `${key}_${value}`;
        } else {
            return value;
        }
    }

    public getTranslationKeyArrayFromValue(key, value) {
        const defaults = [];
        const valueBuffer = Buffer.from(value, 'base64');
        if (key === 'LIST_OF_LAST_10_DEFAULTS' && valueBuffer.length > 0) {
            valueBuffer.forEach((item, ix) => {
                const element = item.toString(16);
                const translations =
                    this.translateService.translations[
                        this.translateService.currentLang
                    ];
                if (element !== '0' && element !== 'e1') {
                    const stringToTranslate = `${key}_${element}`;
                    let transl;
                    // if current defaut is unknown (=> we don't have translation for it), replace with "Other default" string
                    // SEG-801
                    if (translations[stringToTranslate]) {
                        transl = this.translateService.instant(stringToTranslate);
                    } else {
                        transl = this.translateService.instant(
                            'LIST_OF_LAST_10_DEFAULTS_OTHER',
                        );
                    }
                    if (ix > 0) {
                        defaults.push(`\n${transl}`);
                    } else {
                        defaults.push(transl);
                    }
                }
            });
            if (!defaults || defaults.length === 0) {
                defaults.push(
                    this.translateService.instant(
                        'LIST_OF_LAST_10_DEFAULTS_NO_DEFAULT',
                    ),
                );
            }
        }
        return defaults.toString();
    }

    convert(conversion, value) {
        switch (conversion) {
            case Constants.STATE_TRANSFORMATIONS.TO_DATE:
                value = this.toDate(value);
                break;
            case Constants.STATE_TRANSFORMATIONS.TO_DATE_FROM_ISO_STRING:
                value = this.toDateFromIsoString(
                    value,
                    this.translateService.currentLang,
                );
                break;
            case Constants.STATE_TRANSFORMATIONS.TRANSLATE:
                this.translate(value).subscribe(
                    (translatedValue) => (value = translatedValue),
                );
                break;
            case Constants.STATE_TRANSFORMATIONS.UPPERCASE:
                value = this.toUpperCase(value);
                break;
        }
        return value;
    }

    transform(context: DeviceMS, property: Readonly<DefUiProperty>, defaultValue) {
        try {
            const { operator, operand } = property.transform;
            const expressionToCompute = computeStateValueExpression(
                context,
                `${property.path.toLowerCase()}${operator}${operand}`,
            );
            // then evaluate the expression with our Evil Eval func
            // eslint-disable-next-line no-eval
            const jsonPathValue = eval(expressionToCompute).toString();
            if (isNaN(jsonPathValue)) {
                return defaultValue;
            }
            return jsonPathValue;
        } catch (e) {
            console.warn(
                'Error while computing "property.transform" for property: %s',
                property.label,
            );
            console.warn(e);
            return defaultValue;
        }
    }

    getValueDef(computedValue, device: DeviceMS, property: DefUiProperty) {
        const NOT_FILLED = this.translateService.instant('NOT_FILLED');
        const NOT_AVAILABLE = this.translateService.instant('NOT_AVAILABLE');

        if (
            isEmpty(computedValue) &&
            !isNumber(computedValue) &&
            !isBoolean(computedValue)
        ) {
            return { value: NOT_FILLED, empty: true };
        }

        let value = this.getPropertiesValue(
            device.uiType,
            property.label,
            computedValue,
            property.listValue != null,
        );

        if (value === '') {
            return { value: NOT_FILLED, empty: true };
        }
        if (this.isUnknown(value)) {
            return { value: NOT_AVAILABLE, unavailable: true };
        }

        if (property.conversion) {
            value = this.convert(property.conversion, value);
        } else if (property.arrayValue) {
            const { index, length } = property.arrayValue;
            // FIXME ? value.length - index < length
            if (value.length < length) {
                return { value: NOT_AVAILABLE, unavailable: true };
            }

            value = value.slice(index, length);
        }
        return { value };
    }

    computeValue(property: Readonly<DefUiProperty>, device: DeviceMS) {
        const computedStateValue = computeStateValueExpression(
            device,
            property.path.toLowerCase(),
        );
        if (!property.transform) {
            return computedStateValue;
        }
        return this.transform(device, property, computedStateValue);
    }
}
