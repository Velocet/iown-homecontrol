package device.overkiz;

public class AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint extends AtlanticElectricalHeater {
    public static enum I2GType {
        TOP("top"),
        MEDIUM("medium"),
        BASE("base"),
        UNKNOWN("unkown");

        private String value;

        private I2GType(String s1) {this.value = s1;}

        public static int getPriority(I2GType atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$I2GType0) {
            int v = com.modulotech.epos.device.overkiz.AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint.1.$SwitchMap$com$modulotech$epos$device$overkiz$AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint$I2GType[atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$I2GType0.ordinal()];
            if(v != 1) {
                switch(v) {
                    case 2: {return 2;}
                    case 3: {return 1;}
                    default: {return 0;}
                }

                return 2;
            }

            return 3;
        }

        public static I2GType getTypeFromString(String s) {
            if(s != null) {
                if(s.equalsIgnoreCase("Top")) {return I2GType.TOP;}
                if(s.equalsIgnoreCase("Medium")) {return I2GType.MEDIUM;}
                return s.equalsIgnoreCase("Base") ? I2GType.BASE : I2GType.UNKNOWN;
            }
            return I2GType.UNKNOWN;
        }

        public String getValue() {return this.value;}
    }

    public static enum TimeProgramState {
        Monday("monday", "core:MondayTimeProgramState", "setMondayTimeProgram"),
        Tuesday("tuesday", "core:TuesdayTimeProgramState", "setTuesdayTimeProgram"),
        Wednesday("wednesday", "core:WednesdayTimeProgramState", "setWednesdayTimeProgram"),
        Thursday("thursday", "core:ThursdayTimeProgramState", "setThursdayTimeProgram"),
        Friday("friday", "core:FridayTimeProgramState", "setFridayTimeProgram"),
        Saturday("saturday", "core:SaturdayTimeProgramState", "setSaturdayTimeProgram"),
        Sunday("sunday", "core:SundayTimeProgramState", "setSundayTimeProgram");

        private String commandName;
        private String day;
        private String stateName;

        private TimeProgramState(String s1, String s2, String s3) {
            this.day = s1;
            this.stateName = s2;
            this.commandName = s3;
        }

        public static TimeProgramState fromDay(int v) {
            switch(v) {
                case 1: {return TimeProgramState.Sunday;}
                case 2: {return TimeProgramState.Monday;}
                case 3: {return TimeProgramState.Tuesday;}
                case 4: {return TimeProgramState.Wednesday;}
                case 5: {return TimeProgramState.Thursday;}
                case 6: {return TimeProgramState.Friday;}
                case 7: {return TimeProgramState.Saturday;}
                default: {return null;}
            }
        }

        public String getCommandName() {return this.commandName;}

        public String getDay() {return this.day;}
        public String getStateName() {return this.stateName;}
        public static TimeProgramState getTimeProgramStateFromDay(int v) {
            switch(v) {
                case 1: {return TimeProgramState.Sunday;}
                case 2: {return TimeProgramState.Monday;}
                case 3: {return TimeProgramState.Tuesday;}
                case 4: {return TimeProgramState.Wednesday;}
                case 5: {return TimeProgramState.Thursday;}
                case 6: {return TimeProgramState.Friday;}
                case 7: {return TimeProgramState.Saturday;}
                default: {return null;}
            }
        }

        public void setCommandName(String s) {this.commandName = s;}
    }

    public static final String CO_EXISTANCE_ID = "00000000";
    public static final float ECO_OFF_VALUE = 0.424242f;
    Date lastRefreshDerogatedTemperature;
    Date lastRefreshEffectiveTempState;
    Date lastRefreshModeState;
    Date lastRefreshOperatingMode;
    Date lastRefreshProgramState;
    Date lastRefreshTempState;
    private JSONTimeProgramParser parser;

    public AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint() {
        this.lastRefreshProgramState = null;
        this.lastRefreshModeState = null;
        this.lastRefreshTempState = null;
        this.lastRefreshEffectiveTempState = null;
        this.lastRefreshOperatingMode = null;
        this.lastRefreshDerogatedTemperature = null;
    }

    public AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint(JSONObject jSONObject0) {
        super(jSONObject0);
        this.lastRefreshProgramState = null;
        this.lastRefreshModeState = null;
        this.lastRefreshTempState = null;
        this.lastRefreshEffectiveTempState = null;
        this.lastRefreshOperatingMode = null;
        this.lastRefreshDerogatedTemperature = null;
    }

    public String applySetBoostActivation(boolean z, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetBoostActivation(((boolean)(((int)z)))), s, false);}

    public static DeviceState findHeaterOperatingModeStateInList(List list0) {return StringExtKt.stateFrom("core:OperatingModeState", list0);}

    public DeviceState findStateWithName(String s) {ArrayList arrayList0 = new ArrayList(this.getDeviceStates());DeviceState deviceState0 = StringExtKt.stateFrom(s, arrayList0);return deviceState0 == null ? StringExtKt.stateFrom(s.replace("io:", "modbuslink:"), arrayList0) : deviceState0;}

    public JSONArray generateNewProgJSONObject(int v, List list0) {
        JSONArray jSONArray1;
        JSONArray jSONArray0 = null;
        if(this.findStateWithName("core:TimeProgramState") == null) {return null;}
        if(list0 != null) {
            try {jSONArray1 = new JSONArray("");}
            catch(JSONException jSONException0) {jSONException0.printStackTrace();return jSONArray0;}
            try {
                JSONObject jSONObject0 = this.generateProgJsonObject(v, list0);
                switch(v) {
                    case 1: {jSONArray1.put(6, jSONObject0);return jSONArray1;}
                    case 2: {jSONArray1.put(0, jSONObject0);return jSONArray1;}
                    case 3: {jSONArray1.put(1, jSONObject0);return jSONArray1;}
                    case 4: {jSONArray1.put(2, jSONObject0);return jSONArray1;}
                    case 5: {jSONArray1.put(3, jSONObject0);return jSONArray1;}
                    case 6: {jSONArray1.put(4, jSONObject0);return jSONArray1;}
                    case 7: {break;}
                    default: {return jSONArray1;}
                }
                jSONArray1.put(5, jSONObject0);
                return jSONArray1;
            }
            catch(JSONException jSONException0) {jSONArray0 = jSONArray1;}
            jSONException0.printStackTrace();
        }
        return jSONArray0;
    }

    protected JSONObject generateProgJsonObject(int v, List list0) throws JSONException {
        JSONArray jSONArray0 = new JSONArray();for(Object object0: list0) {jSONArray0.put(((TimeSlot)object0).toI2GJsonObject());}
        JSONObject jSONObject0 = new JSONObject();
        switch(v) {
            case 1: {jSONObject0.put("sunday", jSONArray0); return jSONObject0;}
            case 2: {jSONObject0.put("monday", jSONArray0); return jSONObject0;}
            case 3: {jSONObject0.put("tuesday", jSONArray0); return jSONObject0;}
            case 4: {jSONObject0.put("wednesday", jSONArray0); return jSONObject0;}
            case 5: {jSONObject0.put("thursday", jSONArray0); return jSONObject0;}
            case 6: {jSONObject0.put("friday", jSONArray0); return jSONObject0;}
            case 7: {jSONObject0.put("saturday", jSONArray0); return jSONObject0;}
            default: {return jSONObject0;}
        }
    }

    public Date getAbsenceEndDate() {return AtlanticDateHelper.getDateFromState(this.findStateWithName("core:AbsenceEndDateState"));}

    public AbsenceModeState getAbsenceModeState() {return this.findStateWithName("io:AbsenceModeState") == null ? AbsenceModeState.UNKNOWN : AbsenceModeState.fromString("");}

    public Date getAbsenceStartDate() {return AtlanticDateHelper.getDateFromState(this.findStateWithName("core:AbsenceStartDateState"));}

    public List getAllCoexistanceDevice() {
        ArrayList arrayList0 = new ArrayList();
        String s = this.getCoExistanceId();
        if(!TextUtils.isEmpty(s)) {
            for(Object object0: DeviceManager.getInstance().getAllSetupDevices()) {
                Device device0 = (Device)object0;
                if(!(device0 instanceof AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint)) {continue;}
                AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint atlanticElectricalHeaterWithAdjustableTemperatureSetpoint0 = (AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint)device0;
                if(!s.equalsIgnoreCase(atlanticElectricalHeaterWithAdjustableTemperatureSetpoint0.getCoExistanceId()) || (this.getDeviceUrl().equals(""))) {continue;}
                arrayList0.add(atlanticElectricalHeaterWithAdjustableTemperatureSetpoint0);
            }
        }
        return arrayList0;
    }

    public float getAmbianceTemperature() {return super.getAmbianceTemperature(2);}

    public JSONObject getAutoProgram() {if(this.findStateWithName("io:AutoProgramState") == null) {return new JSONObject();}this.parser = new JSONTimeProgramParser();return this.parser.parseAutoProgram("") ? this.parser.getAutoProgram() : new JSONObject();}

    public List getAutoProgramForDay(int v) {DeviceState deviceState0 = this.findStateWithName("io:AutoProgramState");this.parser = new JSONTimeProgramParser();if(deviceState0 == null) {return new ArrayList();}ArrayList arrayList0 = new ArrayList();return this.parser.parseAutoProgram("") ? this.parser.getAutoProgramForDay(v) : arrayList0;}

    private boolean getBooleanFromState(DeviceState deviceState0) {return false;}

    public BoostActivationState getBoostActivation() {return BoostActivationState.fromString(this.getValueForDeviceStateName("core:BoostActivationState"));}

    public String getCoExistanceId() {return this.getCoexistanceIdFromState(this.findStateWithName("core:IdentifierState"));}

    private String getCoexistanceIdFromState(DeviceState deviceState0) {return deviceState0 == null || (true) || (false) ? null : "";}

    public float getComfortRoomTemperature() {return this.getTemperatureCelsiusFromState(this.findStateWithName("core:ComfortRoomTemperatureState"), this.getTemperatureMeasuredType());}

    public float getComfortTemperatureFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return -1.0f;}

    public String getControllerAddressState() {return this.findStateWithName("io:ControllerAddressState") == null ? null : "";}

    public float getCurrentDerogatedTargetTemperature() {return this.getTemperatureCelsiusFromState(this.findStateWithName("core:DerogatedTargetTemperatureState"), this.getTemperatureMeasuredType());}

    public AtlanticSchedulingTypeState getCurrentSchedulingTypeState() {return AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint.getSchedulingTypeFromState(this.findStateWithName("io:InternalExternalSchedulingTypeState"));}

    public AtlanticElectricalHeaterModeState getCurrentTargetHeatingLevel() {return AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint.getHeatingLevelFromState(this.findStateWithName("io:TargetHeatingLevelState"));}

    public AtlanticElectricalHeaterModeState getCurrentTargetHeatingLevelInProg() {
        this.parser = new JSONTimeProgramParser();
        if(this.getOperatingModeState() == AtlanticOperatingModeState.AUTO) {if(this.findStateWithName("io:AutoProgramState") == null) {return AtlanticElectricalHeaterModeState.UNKNOWN;}return this.parser.parseAutoProgram("") ? this.parser.getCurrentAutoProgMode() : AtlanticElectricalHeaterModeState.UNKNOWN;}
        if(this.getOperatingModeState() == AtlanticOperatingModeState.PROG) {if(this.findStateWithName("core:TimeProgramState") == null) {return AtlanticElectricalHeaterModeState.UNKNOWN;}return this.parser.parse("") ? this.parser.getCurrentProgMode() : AtlanticElectricalHeaterModeState.UNKNOWN;}
        return AtlanticElectricalHeaterModeState.UNKNOWN;
    }

    public float getCurrentTargetTemperature() {return this.getTemperatureCelsiusFromState(this.findStateWithName("core:TargetTemperatureState"), this.getTemperatureMeasuredType());}

    public AtlanticOperatingModeState getDefaultOperatingModeState() {return this.findStateWithName("core:OperatingModeState") == null || (true) ? AtlanticOperatingModeState.UNKNOWN : AtlanticOperatingModeState.fromString("");}

    public float getDerogatedTargetTemperatureFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return -1.0f;}

    public float getEcoTemperature() {return this.getTemperatureCelsiusFromState(this.findStateWithName("core:EcoRoomTemperatureState"), this.getTemperatureMeasuredType());}

    public float getEcoTemperatureFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return -1.0f;}

    public String getExpectedPresence() {return this.findStateWithName("io:ExpectedPresenceState") == null || (true) ? null : "";}

    public OnOffState getHolidayModeState() {return this.findStateWithName("core:HolidaysModeState") == null || (true) ? OnOffState.OFF : OnOffState.ON;}

    public float getHolidayTargetTemperature() {return this.getTemperatureCelsiusFromState(this.findStateWithName("core:HolidaysTargetTemperatureState"), this.getTemperatureMeasuredType());}

    public AtlanticSchedulingTypeState getInternalExternalSchedulingTypeState() {if(this.getOperatingModeState() == AtlanticOperatingModeState.PROG) {return AtlanticSchedulingTypeState.INTERNAL;}boolean z = this.findStateWithName("io:InternalExternalSchedulingTypeState") == null;return AtlanticSchedulingTypeState.UNKNOWN;}

    public boolean getIsUpdatingTimeProgram() {
        if(this.getCurrentExecutedActions() == null) {return false;}
        Iterator iterator0 = this.getCurrentExecutedActions().iterator();
    label_9:
        while(iterator0.hasNext()) {
            Object object0 = iterator0.next();
            Action action0 = (Action)object0;
            if(action0.getCommands() == null) {continue;}
            Iterator iterator1 = action0.getCommands().iterator();
            while(true) {
            label_23:
                if(!iterator1.hasNext()) {continue label_9;}
                Object object1 = iterator1.next();
                Command command0 = (Command)object1;
                if(command0.getCommandName() == null || !command0.getCommandName().equalsIgnoreCase("setTimeProgram")) {goto label_23;}
                return true;
            }
            return true;
        }
        return false;
    }

    public Date getLastRefreshDerogatedTemperature() {return this.lastRefreshDerogatedTemperature;}

    public Date getLastRefreshEffectiveTempStateDate() {return this.lastRefreshEffectiveTempState;}

    public Date getLastRefreshModeStateDate() {return this.lastRefreshModeState;}

    public Date getLastRefreshOperatingModeStateDate() {return this.lastRefreshOperatingMode;}

    public Date getLastRefreshProgramStateDate() {return this.lastRefreshProgramState;}

    public Date getLastRefreshTempStateDate() {return this.lastRefreshTempState;}

    public String getManufacturerNameState() {return this.findStateWithName("core:ManufacturerNameState") == null ? null : "";}

    public float getMaximumHeatingTargetTemperatureState() {return DeviceStateExtKt.toFloat(this.findStateWithName("core:MaximumHeatingTargetTemperatureState"));}

    public String getModelExpectedPresenceStateFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return null;}

    public String getModelState() {return this.findStateWithName("io:ModelState") == null ? null : "";}

    public String getModelStateFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return null;}

    public AtlanticElectricalHeaterNativeFunctionalLevel getNativeFunctionalLevelState() {return this.findStateWithName("io:NativeFunctionalLevelState") == null ? AtlanticElectricalHeaterNativeFunctionalLevel.UNKNOWN : AtlanticElectricalHeaterNativeFunctionalLevel.fromString("");}

    public boolean getOccupancyActivation() {return AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint.getOccupancyActivationFromState(this.findStateWithName("core:OccupancyActivationState"));}

    public boolean getOccupancyActivationFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return false;}

    public static boolean getOccupancyActivationFromState(DeviceState deviceState0) {return false;}

    public OccupancySensorStatusState getOccupancySensorStatus() {return this.findStateWithName("core:OccupancySensorStatusState") == null ? OccupancySensorStatusState.UNKNOWN : OccupancySensorStatusState.fromString("");}

    public static OnOffState getOnOffFromState(DeviceState deviceState0) {return deviceState0 == null ? OnOffState.UNKNOWN : OnOffState.OFF;}

    public OnOffState getOnOffState() {return AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint.getOnOffFromState(this.findStateWithName("core:OnOffState"));}

    public boolean getOpenWindowDetectionActivationState() {return this.getBooleanFromState(this.findStateWithName("core:OpenWindowDetectionActivationState"));}

    public boolean getOpenWindowDetectionActivationStateFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return false;}

    public AtlanticOperatingModeState getOperatingModeFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return AtlanticOperatingModeState.UNKNOWN;}

    public static AtlanticOperatingModeState getOperatingModeFromState(DeviceState deviceState0) {return deviceState0 == null || (true) ? AtlanticOperatingModeState.UNKNOWN : AtlanticOperatingModeState.fromString("");}

    public AtlanticOperatingModeState getOperatingModeState() {return AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint.getOperatingModeFromState(this.findStateWithName("core:OperatingModeState"));}

    public float getPercentageOfTimeSpentinEcoAuto() {
        double f2;double f1;float f = 0.0f;int v = 0;
        while(v < 7) {
            List list0 = this.getAutoProgramForDay(v);
            if(list0 != null) {
                for(Object object0: list0) {
                    TimeSlot timeSlot0 = (TimeSlot)object0;if(timeSlot0.getAutoProgramMode() != AutoProgramMode.ECO) {continue;}
                    if(timeSlot0.getStartMinute() < timeSlot0.getStopMinute()) {f1 = (double)f;f2 = ((double)(timeSlot0.getStopHour() - timeSlot0.getStartHour())) + 0.5;f = (float)(f1 + f2);continue;}
                    if(timeSlot0.getStartMinute() > timeSlot0.getStopMinute()) {f1 = (double)f;f2 = ((double)(timeSlot0.getStopHour() - timeSlot0.getStartHour())) - 0.5;f = (float)(f1 + f2);continue;}
                    f += (float)(timeSlot0.getStopHour() - timeSlot0.getStartHour());}}
            ++v;}
        return (168.0f - f) / 168.0f * 100.0f;
    }

    public float getPreviousTargetTemperature() {return this.getTemperatureCelsiusFromState(this.findStateWithName("core:PreviousTargetTemperatureState"), this.getTemperatureMeasuredType());}

    public RSSIQualityState getRSSIQuality() {for(Object object0: DeviceManager.getInstance().getAllSetupDevicesExceptSensors()) {Device device0 = (Device)object0;if(!(device0 instanceof Pod) || (true)) {continue;}return ((Pod)device0).getRSSIQuality();}return RSSIQualityState.UNKNOWN;}

    public AtlanticSchedulingTypeState getSchedulingTypeFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return AtlanticSchedulingTypeState.UNKNOWN;}

    public static AtlanticSchedulingTypeState getSchedulingTypeFromState(DeviceState deviceState0) {return deviceState0 == null || (true) ? AtlanticSchedulingTypeState.UNKNOWN : AtlanticSchedulingTypeState.fromString("");}

    public float getSetpointLoweringTemperatureInProgModeState() {return this.getTemperatureCelsiusFromState(this.findStateWithName("io:SetpointLoweringTemperatureInProgModeState"), this.getTemperatureMeasuredType());}

    public float getSetpointLoweringTemperatureInProgModeStateFromAction(Action action0) {Iterator iterator0 = this.getStateFromAction(action0).iterator();while(iterator0.hasNext()) {iterator0.next();}return 0.0f;}

    public List getStateFromCommandList(List list0) {
        List list1 = super.getStateFromCommandList(list0);
        if(list0 != null && list0.size() >= 1) {
            DeviceState deviceState0 = null;
            for(Object object0: list0) {
                Command command0 = (Command)object0;
                if("setTargetTemperature".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:TargetTemperatureState");
                    deviceState0.setType(Type.FLOAT);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setComfortTemperature".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:ComfortRoomTemperatureState");
                    deviceState0.setType(Type.FLOAT);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setEcoTemperature".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:EcoRoomTemperatureState");
                    deviceState0.setType(Type.FLOAT);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setSchedulingType".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("io:InternalExternalSchedulingTypeState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setOccupancyActivation".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:OccupancyActivationState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setOperatingMode".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:OperatingModeState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setOnOff".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:OnOffState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setTimerForTransitoryState".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("io:TimerForTransitoryStateState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setDerogatedTargetTemperature".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:DerogatedTargetTemperatureState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setOpenWindowDetectionActivation".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:OpenWindowDetectionActivationState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setTimeProgram".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("core:TimeProgramState");
                    deviceState0.setType(Type.STRING);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setSetpointLoweringTemperatureInProgMode".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("io:SetpointLoweringTemperatureInProgModeState");
                    deviceState0.setType(Type.FLOAT);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setTwinningExit".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("setTwinningExit");
                    deviceState0.setType(Type.INTEGER);
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setExpectedPresence".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("io:ExpectedPresenceState");
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                else if("setNativeLevelsList".equals(command0.getCommandName())) {
                    deviceState0 = new DeviceState();
                    deviceState0.setName("setNativeLevelsList");
                    if(command0.getParameters() != null && command0.getParameters().size() > 0) {deviceState0.setValue(((CommandParameter)command0.getParameters().get(0)).getValue());}
                }
                if(deviceState0 == null) {continue;}
                list1.add(deviceState0);
            }
        }
        return list1;
    }

    private String getStateName(String s) {return this.isWifi() ? s.replace("io:", "modbuslink:") : s;}

    public float getTargetTemperature() {return this.getTemperatureCelsiusFromState(this.findStateWithName("core:TargetTemperatureState"), this.getTemperatureMeasuredType());}

    public float getTargetTemperatureFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return 3.402823E+38f;}

    float getTemperatureCelsiusFromState(DeviceState deviceState0, TemperatureMeasuredType ePOSDevicesStates$TemperatureMeasuredType0) {return deviceState0 == null ? 3.402823E+38f : DeviceExtKt.getTemperatureCelsiusFromState(this, deviceState0, ePOSDevicesStates$TemperatureMeasuredType0);}

    public JSONArray getTimeProgram() {
        String s = this.getValueForTimeProgram("core:TimeProgramState");
        if(s == null) {return new JSONArray();}

        this.parser = new JSONTimeProgramParser();
        return this.parser.parse(s) ? this.parser.getTimeProgramJSON() : new JSONArray();
    }

    public List getTimeProgramForDay(int v) {
        String s = this.isWifi() ? this.getTimeProgramFromStates().toString() : this.getValueForTimeProgram("core:TimeProgramState");
        if(s == null) {return new ArrayList();}

        this.parser = new JSONTimeProgramParser();
        if(this.parser.parse(s)) {
            switch(v) {
                case 1: {return this.parser.getSundayTimeProgramSlots();}
                case 2: {return this.parser.getMondayTimeProgramSlots();}
                case 3: {return this.parser.getTuesdayTimeProgramSlots();}
                case 4: {return this.parser.getWednesdayTimeProgramSlots();}
                case 5: {return this.parser.getThursdayTimeProgramSlots();}
                case 6: {return this.parser.getFridayTimeProgramSlots();}
                case 7: {
                    break;
                }
                default: {return new ArrayList();}
            }

            return this.parser.getSaturdayTimeProgramSlots();
        }

        return new ArrayList();
    }

    private JSONObject getTimeProgramForState(String s) {
        if(this.findStateWithName(s) == null) {return null;}

        try {return new JSONObject("");}
        catch(JSONException jSONException0) {
            jSONException0.printStackTrace();
            return null;
        }
    }

    private JSONArray getTimeProgramFromStates() {
        JSONArray jSONArray0 = new JSONArray();
        TimeProgramState[] arr_atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$TimeProgramState = TimeProgramState.values();
        for(int v = 0; v < arr_atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$TimeProgramState.length; ++v) {
            JSONObject jSONObject0 = this.getTimeProgramForState(arr_atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$TimeProgramState[v].getStateName());
            if(jSONObject0 != null) {
                jSONArray0.put(jSONObject0);
            }
        }

        return jSONArray0;
    }

    public int getTimerForTransitoryState() {return super.getTimerForTransitoryState();}

    public int getTimerForTransitoryStateFromAction(Action action0) {for(Object object0: this.getStateFromAction(action0)) {DeviceState deviceState0 = (DeviceState)object0;}return 0x7FFFFFFF;}

    public I2GType getType() {return I2GType.getTypeFromString(this.getNativeFunctionalLevelState().toString());}

    private String getValueForTimeProgram(String s) {return this.findStateWithName(s) == null ? this.getTimeProgramFromStates().toString() : "";}

    public boolean hasCoexistantDevices() {return this.getAllCoexistanceDevice().size() > 0;}

    public boolean hasDetectedPerson() {for(Object object0: this.getAssociatedDevice()) {Device device0 = (Device)object0;if(!(device0 instanceof OccupancySensor)) {continue;}return ((OccupancySensor)device0).hasDetectedPerson().booleanValue();}return false;}

    public boolean isWifi() {return this.getControllable() != null && (this.getControllable().equalsIgnoreCase("modbuslink:AtlanticElectricalHeaterWithAdjustableTemperatureSetpointMBLComponent"));}

    public void off() {this.applyWithCommand(DeviceCommandUtils.getOffCommand(), "off", false);}

    public String refreshControllerAdress() {return this.applyWithCommand(DeviceCommandUtils.getCommandForRefreshControllerAddress(), this.getLabel(), false);}

    public String refreshDerogatedTemperature() {this.lastRefreshDerogatedTemperature = new Date();return this.applyWithCommand(DeviceCommandUtils.getCommandForRefreshDerogatedTemperature(), "refresh Derogated temp", false);}

    public String refreshEffectiveTemperature() {this.lastRefreshEffectiveTempState = new Date();return this.applyWithCommand(DeviceCommandUtils.getCommandForRefreshEffectiveTemperature(), this.getLabel(), false);}

    public String refreshHeatingLevel() {this.lastRefreshModeState = new Date();return this.applyWithCommand(DeviceCommandUtils.getCommandForRefreshHeatingLevel(), this.getLabel(), false);}

    public String refreshIdentifier() {return this.applyWithCommand(DeviceCommandUtils.getCommandForRefreshCoexistenceID(), this.getLabel(), false);}

    public String refreshOperatingMode() {this.lastRefreshOperatingMode = new Date();return this.applyWithCommand(DeviceCommandUtils.getCommandForRefreshOperatingMode(), this.getLabel(), false);}

    public String refreshProgram() {this.lastRefreshProgramState = new Date();ArrayList arrayList0 = new ArrayList();arrayList0.add(DeviceCommandUtils.getCommandForRefreshProgram());return this.applyWithCommand(arrayList0, this.getLabel(), false);}

    public String refreshTemperature() {this.lastRefreshTempState = new Date();return this.applyWithCommand(DeviceCommandUtils.getCommandForRefreshTemperature(), this.getLabel(), false);}

    public void requestDailyLoweringSate(long v, long v1) {SensorHistoryValuesManager.getInstance().startGetDailyStackedHistoryValues(this.getDeviceUrl(), v, v1, "io:CumulatedLoweringState");}

    public String setAbsenceEndDate(Date date0, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetAbsenceDate(false, date0), s, false);}

    public String setAbsenceMode(AbsenceModeState ePOSDevicesStates$AbsenceModeState0, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetAbsenceMode(ePOSDevicesStates$AbsenceModeState0), s, false);}

    public String setAbsenceStartDate(Date date0, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetAbsenceDate(true, date0), s, false);}

    public String setComfortRoomTemperature(float f, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForComfortTemperature(f), s, false);}

    public String setDerogatedTargetTemperature(float f, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForDerogatedTargetTemperature(f), s, false);}

    public String setEcoTemperature(float f, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForEcoTemperature(f), s, false);}

    public String setExpectedPresence(String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForExpectedPresence(s), this.getLabel(), false);}

    public String setHolidayModeState(OnOffState ePOSDevicesStates$OnOffState0, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetHolidays(ePOSDevicesStates$OnOffState0), s, false);}

    public String setHolidaysTargetTemperature(float f, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetHolidayTargetTemperature(f), s, false);}

    public String setInternalExternalSchedulingType(AtlanticSchedulingTypeState ePOSDevicesStates$AtlanticSchedulingTypeState0) {return this.applyWithCommand(DeviceCommandUtils.getCommandForInternalExternalSchedulingType(ePOSDevicesStates$AtlanticSchedulingTypeState0), this.getLabel(), false);}

    public void setNativeFunctionalLevelState(I2GType atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$I2GType0) {this.applyWithCommand(DeviceCommandUtils.getCommandForNativeFunctionalLevel(atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$I2GType0.getValue()), this.getLabel(), false);}

    public String setOccupancyActivation(boolean z, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForOccupancyActivation(((boolean)(((int)z)))), s, false);}

    public void setOccupancyActivation(boolean z, String s, boolean z1) {this.setOccupancyActivation(((boolean)(((int)z))), s);if(z1) {for(Object object0: this.getAllCoexistanceDevice()) {((AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint)object0).setOccupancyActivation(((boolean)(((int)z))), s);}}}

    public String setOnOffState(OnOffState ePOSDevicesStates$OnOffState0, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForOnOffState(ePOSDevicesStates$OnOffState0), s, false);}

    public String setOpenWindowDetectionActivationState(boolean z, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForOpenWindowDetectionActivationState(((boolean)(((int)z)))), s, false);}

    public void setOpenWindowDetectionActivationState(boolean z, String s, boolean z1) {this.setOpenWindowDetectionActivationState(((boolean)(((int)z))), s);if(z1) {for(Object object0: this.getAllCoexistanceDevice()) {((AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint)object0).setOpenWindowDetectionActivationState(((boolean)(((int)z))), s);}}}

    public String setOperatingModeState(AtlanticOperatingModeState ePOSDevicesStates$AtlanticOperatingModeState0, String s) {return ePOSDevicesStates$AtlanticOperatingModeState0 == null || this.findStateWithName("io:InternalExternalSchedulingTypeState") == null ? null : this.applyWithCommand(DeviceCommandUtils.getCommandForOperatingMode(ePOSDevicesStates$AtlanticOperatingModeState0, ""), s, false);}

    public void setOperatingModeState(AtlanticOperatingModeState ePOSDevicesStates$AtlanticOperatingModeState0, String s, boolean z) {this.setOperatingModeState(ePOSDevicesStates$AtlanticOperatingModeState0, s);if(z) {for(Object object0: this.getAllCoexistanceDevice()) {((AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint)object0).setOperatingModeState(ePOSDevicesStates$AtlanticOperatingModeState0, s);}}}

    public String setPreviousTargetTemperature(float f, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetPreviousTargetTemperature(f), s, false);}

    public String setSchedulingTypeState(AtlanticSchedulingTypeState ePOSDevicesStates$AtlanticSchedulingTypeState0, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSchedulingType(ePOSDevicesStates$AtlanticSchedulingTypeState0), s, false);}

    public String setSetpointLoweringTemperatureInProgModeState(float f) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetPointLoweringTemperature(f), this.getLabel(), false);}

    public String setTargetTemperature(float f, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForTargetTemperature(f), s, false);}

    public String setTargetTemperature(float f, String s, boolean z) {String s1 = this.setTargetTemperature(f, s);if(z) {for(Object object0: this.getAllCoexistanceDevice()) {((AtlanticElectricalHeaterWithAdjustableTemperatureSetpoint)object0).setTargetTemperature(f, s);}}return s1;}

    public String setTimeProgramForDay(int v, List list0) {JSONArray jSONArray0 = this.generateNewProgJSONObject(v, list0);return jSONArray0 == null ? null : this.applyWithCommand(DeviceCommandUtils.getCommandForTimeProgramState(jSONArray0.toString()), ": new prog for day " + v, false);}

    public String setTimeProgramForState(TimeProgramState atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$TimeProgramState0, JSONObject jSONObject0, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForSetTimeProgramForDay(atlanticElectricalHeaterWithAdjustableTemperatureSetpoint$TimeProgramState0.getCommandName(), jSONObject0), s, false);}

    public String setTimerForTransitoryState(int v, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForTimerForTransitoryState(v), s, false);}

    public String setTwinningExit(int v, String s) {return this.applyWithCommand(DeviceCommandUtils.getCommandForTwinningExit(v), s, false);}
}
