package com.scenarioLauncher.views.util
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import ioService.datamodel.Actuator;
   import mx.events.PropertyChangeEvent;
   
   public class ActuatorUtil implements IEventDispatcher
   {
      
      public static const ACTUATOR_PROFILE__ON_OFF_SWITCH:String = "actuatorProfileOnOffSwitch";
      
      public static var light_icon:Class = ActuatorUtil_light_icon;
      
      public static const ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL:String = "actuatorProfileCentralHouseControl";
      
      public static var AWNINGControl:Class = ActuatorUtil_AWNINGControl;
      
      public static const ACTUATOR_PROFILE__DOOR_LOCK:String = "actuatorProfileDoorLock";
      
      public static const ACTUATOR_PROFILE__NONE:String = "actuatorProfileNone";
      
      public static const ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:String = "actuatorProfileExteriorVenetianBlind";
      
      public static const ACTUATOR_PROFILE__WINDOW_OPENER:String = "actuatorProfileWindowOpener";
      
      public static const ACTUATOR_PROFILE__VERTICAL_EXTERIOR_AWNING:String = "actuatorProfileVerticalExteriorAwning";
      
      public static var evb_icon:Class = ActuatorUtil_evb_icon;
      
      public static const ACTUATOR_PROFILE__GATE_OPENER:String = "actuatorProfileGateOpener";
      
      public static const EMPTY:String = "empty";
      
      public static var ioGeneric_icon:Class = ActuatorUtil_ioGeneric_icon;
      
      public static const TOOL_SATE_OK:String = "OK";
      
      public static const ACTUATOR_PROFILE__REMOTE_CONTROLLER:String = "actuatorProfileRemoteController";
      
      private static var _563701356IdentifyActuatorWindowOpener:Class = ActuatorUtil_IdentifyActuatorWindowOpener;
      
      public static var DOORLOCKControl:Class = ActuatorUtil_DOORLOCKControl;
      
      public static var IOGENERICControl:Class = ActuatorUtil_IOGENERICControl;
      
      public static var RSOControl:Class = ActuatorUtil_RSOControl;
      
      public static var GOControl:Class = ActuatorUtil_GOControl;
      
      private static var _1586388001IdentifyActuatorOnOffSwitch:Class = ActuatorUtil_IdentifyActuatorOnOffSwitch;
      
      public static var LIGHTBASICControl:Class = ActuatorUtil_LIGHTBASICControl;
      
      public static const ACTUATOR_PROFILE__BEACON:String = "actuatorProfileBeacon";
      
      public static const ACTUATOR_PROFILE__HORIZONTAL_AWNING:String = "actuatorProfileHorizontalAwning";
      
      public static var EVBControl:Class = ActuatorUtil_EVBControl;
      
      public static var gdo_icon:Class = ActuatorUtil_gdo_icon;
      
      public static var windowVelux_icon:Class = ActuatorUtil_windowVelux_icon;
      
      public static var GO_icon:Class = ActuatorUtil_GO_icon;
      
      public static const TOOL_SATE_NOK:String = "NOK";
      
      public static const ACTUATOR_PROFILE__LIGHT:String = "actuatorProfileLight";
      
      public static var VELUXControl:Class = ActuatorUtil_VELUXControl;
      
      public static const ACTUATOR_PROFILE__LOUVRE_BLIND:String = "actuatorProfileLouvreBlind";
      
      private static var _2000073615IdentifyActuatorAwning:Class = ActuatorUtil_IdentifyActuatorAwning;
      
      public static var screen_icon:Class = ActuatorUtil_screen_icon;
      
      private static var _1797924335IdentifyActuatorScreen:Class = ActuatorUtil_IdentifyActuatorScreen;
      
      private static var _384703070IdentifyActuatorDoorLock:Class = ActuatorUtil_IdentifyActuatorDoorLock;
      
      private static var _341388591IdentifyActuatorLight:Class = ActuatorUtil_IdentifyActuatorLight;
      
      public static var LIGHTControl:Class = ActuatorUtil_LIGHTControl;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public static var plug_icon:Class = ActuatorUtil_plug_icon;
      
      public static const ACTUATOR_PROFILE__CURTAIN_TRACK:String = "actuatorProfileCurtainTrack";
      
      public static var lightBasic_icon:Class = ActuatorUtil_lightBasic_icon;
      
      private static var _910624954IdentifyActuatorExteriorVenitianBlind:Class = ActuatorUtil_IdentifyActuatorExteriorVenitianBlind;
      
      public static var awning_icon:Class = ActuatorUtil_awning_icon;
      
      public static const ACTUATOR_PROFILE__SCD:String = "actuatorProfileScd";
      
      public static const ACTUATOR_PROFILE__GARAGE_DOOR_OPENER:String = "actuatorProfileGarageDoorOpener";
      
      public static const ACTUATOR_PROFILE__EXTERIOR_HEATING:String = "actuatorProfileExteriorHeating";
      
      private static var _406626225IdentifyActuatorGarageDoorOpener:Class = ActuatorUtil_IdentifyActuatorGarageDoorOpener;
      
      public static var rs_icon:Class = ActuatorUtil_rs_icon;
      
      private static var _1161297267IdentifyActuatorRollingShutter:Class = ActuatorUtil_IdentifyActuatorRollingShutter;
      
      public static const GATE:String = "gate";
      
      public static var dl_icon:Class = ActuatorUtil_dl_icon;
      
      public static var rso_icon:Class = ActuatorUtil_rso_icon;
      
      public static const ACTUATOR_PROFILE__ROLLING_DOOR_OPENER:String = "actuatorProfileRollingDoorOpener";
      
      public static const ACTUATOR_PROFILE__DUAL_ROLLING_SHUTTER:String = "actuatorProfileDualRollingShutter";
      
      public static const ACTUATOR_PROFILE__TEST_AND_EVALUATION:String = "actuatorProfileTestAndEvaluation";
      
      public static const ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:String = "actuatorProfileInteriorVerticalBlind";
      
      public static var RSControl:Class = ActuatorUtil_RSControl;
      
      public static const CONNECTION:String = "connection";
      
      private static var _835828807IdentifyActuatorGateOpener:Class = ActuatorUtil_IdentifyActuatorGateOpener;
      
      public static var SCREENDetail:Class = ActuatorUtil_SCREENDetail;
      
      public static const ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE:String = "actuatorProfileTemperatureControlInterface";
      
      public static const ACTUATOR_PROFILE__INTERIOR_VENETIAN_BLIND:String = "actuatorProfileInteriorVenetianBlind";
      
      public static const ACTUATOR_PROFILE__VENTILATION_POINT:String = "actuatorProfileVentilationPoint";
      
      public static const ACTUATOR_PROFILE__ROLLING_SHUTTER:String = "actuatorProfileRollingShutter";
      
      public static var GDOControl:Class = ActuatorUtil_GDOControl;
      
      public static var PLUGControl:Class = ActuatorUtil_PLUGControl;
      
      private static var _1407051276IdentifyActuatorIoGeneric:Class = ActuatorUtil_IdentifyActuatorIoGeneric;
       
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function ActuatorUtil()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public static function set IdentifyActuatorWindowOpener(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._563701356IdentifyActuatorWindowOpener;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._563701356IdentifyActuatorWindowOpener = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorWindowOpener",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorLight() : Class
      {
         return ActuatorUtil._341388591IdentifyActuatorLight;
      }
      
      public static function set IdentifyActuatorIoGeneric(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._1407051276IdentifyActuatorIoGeneric;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._1407051276IdentifyActuatorIoGeneric = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorIoGeneric",_loc2_,param1));
            }
         }
      }
      
      public static function set IdentifyActuatorRollingShutter(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._1161297267IdentifyActuatorRollingShutter;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._1161297267IdentifyActuatorRollingShutter = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorRollingShutter",_loc2_,param1));
            }
         }
      }
      
      public static function set IdentifyActuatorAwning(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._2000073615IdentifyActuatorAwning;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._2000073615IdentifyActuatorAwning = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorAwning",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorScreen() : Class
      {
         return ActuatorUtil._1797924335IdentifyActuatorScreen;
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorIoGeneric() : Class
      {
         return ActuatorUtil._1407051276IdentifyActuatorIoGeneric;
      }
      
      public static function set IdentifyActuatorScreen(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._1797924335IdentifyActuatorScreen;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._1797924335IdentifyActuatorScreen = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorScreen",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorGateOpener() : Class
      {
         return ActuatorUtil._835828807IdentifyActuatorGateOpener;
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorExteriorVenitianBlind() : Class
      {
         return ActuatorUtil._910624954IdentifyActuatorExteriorVenitianBlind;
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorDoorLock() : Class
      {
         return ActuatorUtil._384703070IdentifyActuatorDoorLock;
      }
      
      public static function getImageButtonStyleName(param1:Actuator) : String
      {
         var _loc2_:String = "";
         if(param1)
         {
            switch(param1.profile)
            {
               case Actuator.ACTUATOR_PROFILE__BEACON:
                  _loc2_ = ACTUATOR_PROFILE__BEACON;
                  break;
               case Actuator.ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL:
                  _loc2_ = ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL;
                  break;
               case Actuator.ACTUATOR_PROFILE__CURTAIN_TRACK:
                  _loc2_ = ACTUATOR_PROFILE__CURTAIN_TRACK;
                  break;
               case Actuator.ACTUATOR_PROFILE__DOOR_LOCK:
                  _loc2_ = ACTUATOR_PROFILE__DOOR_LOCK;
                  break;
               case Actuator.ACTUATOR_PROFILE__DUAL_ROLLING_SHUTTER:
                  _loc2_ = ACTUATOR_PROFILE__DUAL_ROLLING_SHUTTER;
                  break;
               case Actuator.ACTUATOR_PROFILE__EXTERIOR_HEATING:
                  _loc2_ = ACTUATOR_PROFILE__EXTERIOR_HEATING;
                  break;
               case Actuator.ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:
                  _loc2_ = ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND;
                  break;
               case Actuator.ACTUATOR_PROFILE__GARAGE_DOOR_OPENER:
                  _loc2_ = ACTUATOR_PROFILE__GARAGE_DOOR_OPENER;
                  break;
               case Actuator.ACTUATOR_PROFILE__GATE_OPENER:
                  _loc2_ = ACTUATOR_PROFILE__GATE_OPENER;
                  break;
               case Actuator.ACTUATOR_PROFILE__HORIZONTAL_AWNING:
                  _loc2_ = ACTUATOR_PROFILE__HORIZONTAL_AWNING;
                  break;
               case Actuator.ACTUATOR_PROFILE__INTERIOR_VENETIAN_BLIND:
                  _loc2_ = ACTUATOR_PROFILE__INTERIOR_VENETIAN_BLIND;
                  break;
               case Actuator.ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:
                  _loc2_ = ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND;
                  break;
               case Actuator.ACTUATOR_PROFILE__LIGHT:
                  _loc2_ = ACTUATOR_PROFILE__LIGHT;
                  break;
               case Actuator.ACTUATOR_PROFILE__LOUVRE_BLIND:
                  _loc2_ = ACTUATOR_PROFILE__LOUVRE_BLIND;
                  break;
               case Actuator.ACTUATOR_PROFILE__NONE:
                  _loc2_ = ACTUATOR_PROFILE__NONE;
                  break;
               case Actuator.ACTUATOR_PROFILE__ON_OFF_SWITCH:
                  _loc2_ = ACTUATOR_PROFILE__ON_OFF_SWITCH;
                  break;
               case Actuator.ACTUATOR_PROFILE__REMOTE_CONTROLLER:
                  _loc2_ = ACTUATOR_PROFILE__REMOTE_CONTROLLER;
                  break;
               case Actuator.ACTUATOR_PROFILE__ROLLING_DOOR_OPENER:
                  _loc2_ = ACTUATOR_PROFILE__ROLLING_DOOR_OPENER;
                  break;
               case Actuator.ACTUATOR_PROFILE__ROLLING_SHUTTER:
                  _loc2_ = ACTUATOR_PROFILE__ROLLING_SHUTTER;
                  break;
               case Actuator.ACTUATOR_PROFILE__SCD:
                  _loc2_ = ACTUATOR_PROFILE__SCD;
                  break;
               case Actuator.ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE:
                  _loc2_ = ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE;
                  break;
               case Actuator.ACTUATOR_PROFILE__TEST_AND_EVALUATION:
                  _loc2_ = ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE;
                  break;
               case Actuator.ACTUATOR_PROFILE__VENTILATION_POINT:
                  _loc2_ = ACTUATOR_PROFILE__VENTILATION_POINT;
                  break;
               case Actuator.ACTUATOR_PROFILE__VERTICAL_EXTERIOR_AWNING:
                  _loc2_ = ACTUATOR_PROFILE__VERTICAL_EXTERIOR_AWNING;
                  break;
               case Actuator.ACTUATOR_PROFILE__WINDOW_OPENER:
                  _loc2_ = ACTUATOR_PROFILE__WINDOW_OPENER;
            }
         }
         return _loc2_;
      }
      
      public static function set IdentifyActuatorGarageDoorOpener(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._406626225IdentifyActuatorGarageDoorOpener;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._406626225IdentifyActuatorGarageDoorOpener = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorGarageDoorOpener",_loc2_,param1));
            }
         }
      }
      
      public static function set IdentifyActuatorExteriorVenitianBlind(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._910624954IdentifyActuatorExteriorVenitianBlind;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._910624954IdentifyActuatorExteriorVenitianBlind = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorExteriorVenitianBlind",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorRollingShutter() : Class
      {
         return ActuatorUtil._1161297267IdentifyActuatorRollingShutter;
      }
      
      public static function set IdentifyActuatorGateOpener(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._835828807IdentifyActuatorGateOpener;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._835828807IdentifyActuatorGateOpener = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorGateOpener",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorAwning() : Class
      {
         return ActuatorUtil._2000073615IdentifyActuatorAwning;
      }
      
      public static function getControlClass(param1:Actuator) : Object
      {
         var _loc2_:Object = null;
         switch(param1.profile)
         {
            case Actuator.ACTUATOR_PROFILE__BEACON:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__CURTAIN_TRACK:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__DOOR_LOCK:
               _loc2_ = new DOORLOCKControl();
               break;
            case Actuator.ACTUATOR_PROFILE__DUAL_ROLLING_SHUTTER:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__EXTERIOR_HEATING:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:
               _loc2_ = new EVBControl();
               break;
            case Actuator.ACTUATOR_PROFILE__GARAGE_DOOR_OPENER:
               _loc2_ = new GDOControl();
               break;
            case Actuator.ACTUATOR_PROFILE__GATE_OPENER:
               _loc2_ = new GOControl();
               break;
            case Actuator.ACTUATOR_PROFILE__HORIZONTAL_AWNING:
               _loc2_ = new AWNINGControl();
               break;
            case Actuator.ACTUATOR_PROFILE__INTERIOR_VENETIAN_BLIND:
               _loc2_ = new EVBControl();
               break;
            case Actuator.ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:
               _loc2_ = new SCREENDetail();
               break;
            case Actuator.ACTUATOR_PROFILE__LIGHT:
               switch(param1.subProfile)
               {
                  case Actuator.ACTUATOR_SUB_PROFILE__LIGHT_ON_OFF:
                     _loc2_ = new LIGHTBASICControl();
                     break;
                  case Actuator.ACTUATOR_SUB_PROFILE__LIGHT_WITH_COLOUR_HANDLING:
                  default:
                     _loc2_ = new LIGHTControl();
               }
               break;
            case Actuator.ACTUATOR_PROFILE__LOUVRE_BLIND:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__NONE:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__ON_OFF_SWITCH:
               _loc2_ = new PLUGControl();
               break;
            case Actuator.ACTUATOR_PROFILE__REMOTE_CONTROLLER:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__ROLLING_DOOR_OPENER:
               _loc2_ = new GDOControl();
               break;
            case Actuator.ACTUATOR_PROFILE__ROLLING_SHUTTER:
               switch(param1.subProfile)
               {
                  case Actuator.ACTUATOR_SUB_PROFILE__ADJUSTABLE_SLATS_ROLLING_SHUTTER:
                     _loc2_ = new RSOControl();
                     break;
                  default:
                     _loc2_ = new RSControl();
               }
               break;
            case Actuator.ACTUATOR_PROFILE__SCD:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__TEST_AND_EVALUATION:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__VENTILATION_POINT:
               _loc2_ = new IOGENERICControl();
               break;
            case Actuator.ACTUATOR_PROFILE__VERTICAL_EXTERIOR_AWNING:
               _loc2_ = new SCREENDetail();
               break;
            case Actuator.ACTUATOR_PROFILE__WINDOW_OPENER:
               _loc2_ = new VELUXControl();
               break;
            default:
               _loc2_ = new IOGENERICControl();
         }
         return _loc2_;
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorWindowOpener() : Class
      {
         return ActuatorUtil._563701356IdentifyActuatorWindowOpener;
      }
      
      public static function set IdentifyActuatorLight(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._341388591IdentifyActuatorLight;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._341388591IdentifyActuatorLight = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorLight",_loc2_,param1));
            }
         }
      }
      
      public static function getIconControlClass(param1:Actuator) : Object
      {
         var _loc2_:Object = null;
         switch(param1.profile)
         {
            case Actuator.ACTUATOR_PROFILE__BEACON:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__CURTAIN_TRACK:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__DOOR_LOCK:
               _loc2_ = new dl_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__DUAL_ROLLING_SHUTTER:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__EXTERIOR_HEATING:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:
               _loc2_ = new evb_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__GARAGE_DOOR_OPENER:
               _loc2_ = new gdo_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__GATE_OPENER:
               _loc2_ = new GO_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__HORIZONTAL_AWNING:
               _loc2_ = new awning_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__INTERIOR_VENETIAN_BLIND:
               _loc2_ = new evb_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:
               _loc2_ = new screen_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__LIGHT:
               switch(param1.subProfile)
               {
                  case Actuator.ACTUATOR_SUB_PROFILE__LIGHT_ON_OFF:
                     _loc2_ = new lightBasic_icon();
                     break;
                  case Actuator.ACTUATOR_SUB_PROFILE__LIGHT_WITH_COLOUR_HANDLING:
                  default:
                     _loc2_ = new light_icon();
               }
               break;
            case Actuator.ACTUATOR_PROFILE__LOUVRE_BLIND:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__NONE:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__ON_OFF_SWITCH:
               _loc2_ = new plug_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__REMOTE_CONTROLLER:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__ROLLING_DOOR_OPENER:
               _loc2_ = new gdo_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__ROLLING_SHUTTER:
               switch(param1.subProfile)
               {
                  case Actuator.ACTUATOR_SUB_PROFILE__ADJUSTABLE_SLATS_ROLLING_SHUTTER:
                     _loc2_ = new rso_icon();
                     break;
                  default:
                     _loc2_ = new rs_icon();
               }
               break;
            case Actuator.ACTUATOR_PROFILE__SCD:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__TEST_AND_EVALUATION:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__VENTILATION_POINT:
               _loc2_ = new ioGeneric_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__VERTICAL_EXTERIOR_AWNING:
               _loc2_ = new screen_icon();
               break;
            case Actuator.ACTUATOR_PROFILE__WINDOW_OPENER:
               _loc2_ = new windowVelux_icon();
               break;
            default:
               _loc2_ = new ioGeneric_icon();
         }
         return _loc2_;
      }
      
      public static function set IdentifyActuatorOnOffSwitch(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._1586388001IdentifyActuatorOnOffSwitch;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._1586388001IdentifyActuatorOnOffSwitch = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorOnOffSwitch",_loc2_,param1));
            }
         }
      }
      
      public static function set IdentifyActuatorDoorLock(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorUtil._384703070IdentifyActuatorDoorLock;
         if(_loc2_ !== param1)
         {
            ActuatorUtil._384703070IdentifyActuatorDoorLock = param1;
            _loc3_ = ActuatorUtil.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorUtil,"IdentifyActuatorDoorLock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorOnOffSwitch() : Class
      {
         return ActuatorUtil._1586388001IdentifyActuatorOnOffSwitch;
      }
      
      public static function getActuatorImageIdentification(param1:Actuator) : Class
      {
         var _loc2_:Class = null;
         if(param1)
         {
            switch(param1.profile)
            {
               case Actuator.ACTUATOR_PROFILE__BEACON:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__CURTAIN_TRACK:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__DOOR_LOCK:
                  _loc2_ = IdentifyActuatorDoorLock;
                  break;
               case Actuator.ACTUATOR_PROFILE__DUAL_ROLLING_SHUTTER:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__EXTERIOR_HEATING:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:
                  _loc2_ = IdentifyActuatorExteriorVenitianBlind;
                  break;
               case Actuator.ACTUATOR_PROFILE__GARAGE_DOOR_OPENER:
                  _loc2_ = IdentifyActuatorGarageDoorOpener;
                  break;
               case Actuator.ACTUATOR_PROFILE__GATE_OPENER:
                  _loc2_ = IdentifyActuatorGateOpener;
                  break;
               case Actuator.ACTUATOR_PROFILE__HORIZONTAL_AWNING:
                  _loc2_ = IdentifyActuatorAwning;
                  break;
               case Actuator.ACTUATOR_PROFILE__INTERIOR_VENETIAN_BLIND:
                  _loc2_ = IdentifyActuatorExteriorVenitianBlind;
                  break;
               case Actuator.ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:
                  _loc2_ = IdentifyActuatorScreen;
                  break;
               case Actuator.ACTUATOR_PROFILE__LIGHT:
                  _loc2_ = IdentifyActuatorLight;
                  break;
               case Actuator.ACTUATOR_PROFILE__LOUVRE_BLIND:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__NONE:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__ON_OFF_SWITCH:
                  _loc2_ = IdentifyActuatorOnOffSwitch;
                  break;
               case Actuator.ACTUATOR_PROFILE__REMOTE_CONTROLLER:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__ROLLING_DOOR_OPENER:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__ROLLING_SHUTTER:
                  _loc2_ = IdentifyActuatorRollingShutter;
                  break;
               case Actuator.ACTUATOR_PROFILE__SCD:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__TEST_AND_EVALUATION:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__VENTILATION_POINT:
                  _loc2_ = IdentifyActuatorIoGeneric;
                  break;
               case Actuator.ACTUATOR_PROFILE__VERTICAL_EXTERIOR_AWNING:
                  _loc2_ = IdentifyActuatorScreen;
                  break;
               case Actuator.ACTUATOR_PROFILE__WINDOW_OPENER:
                  _loc2_ = IdentifyActuatorWindowOpener;
            }
         }
         return _loc2_;
      }
      
      [Bindable(event="propertyChange")]
      public static function get IdentifyActuatorGarageDoorOpener() : Class
      {
         return ActuatorUtil._406626225IdentifyActuatorGarageDoorOpener;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
   }
}
