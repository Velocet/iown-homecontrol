/**
  * @file    iown_node_types.h
  * @author  iown-homecontrol
  * @brief   MAC layer definitions and functions
  *
  * #include <LibraryFile.h>
  * #include "LocalFile.h"
  *
  */

#pragma once
/* Define to prevent recursive inclusion */
#ifdef __cplusplus
  extern "C" {
#endif

  enum class iown_node_actuator_types {
    Unknown = 0,
    VenetianBlind = 1,
    RollingShutter = 2,
    VerticalAwning = 3,
    WindowOpener = 4,
    GarageDoorOpener = 5,
    Light = 6,
    GateOpener = 7,
    RollingDoorOpener = 8,
    MotorizedBolt = 9,
    InteriorBlind = 10,
    SCD = 11,
    Beacon = 12,
    DualShutter = 13,
    TemperatureControlInterface = 14,
    OnOffSwitch = 15,
    HorizontalAwning = 16,
    ExternalVenetianBlind = 17,
    LouvreBlind = 18,
    CurtainTrack = 19,
    VentilationPoint = 20,
    ExteriorHeating = 21,
    HeatPump = 22,
    IntrusionAlarm = 23,
    SwingingShutter = 24,
  };

  // enum class iown_node_actuator_types_subtypes {
  //   Blind = 1.1,
  //   Slats = 1.2,
  //   RollerShutter = 2-1,
  //   Blind = 2-1.1,
  //   Slats = 2-1.2,
  //   RollerShutter = 2-2,
  //   WindowOperator = 4-1,
  //   GarageOpener = 5-58,
  //   Light = 6-58,
  //   GateOpener = 7-58,
  //   Lock = 9-1,
  //   BothCurtains = 13.1,
  //   UpperCurtain = 13.2,
  //   LowerCurtain = 13.3,
  //   Blind = 17.1,
  //   Slats = 17.2,
  //   Curtain = 18.1,
  //   Hangers = 18.2,
  //   VentilationPoint = 20-1,
  //   VentilationPoint = 20-2,
  //   VentilationPoint = 20-3,
  //   OutdoorHeating = 21-58,
  //   SwingingShutter = 24-1,
  // }


#ifdef __cplusplus
}
#endif
