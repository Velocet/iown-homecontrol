/*****************************************************************************
*                                                                            *
*                               VELUX A/S                                    *
*                                                                            *
******************************************************************************

$Project: LIBRARY_EFM32_Encrypted_Bootloader$

$Workfile: version.h$

$Revision: 4$

$Date: 11/19/18 10:12:11 AM CET$

*****************************************************************************/

#ifndef VERSION_H
#define VERSION_H 1

/**
* @file version.h
* @brief Product version is to be updated in this file
* @addtogroup prod_setup Product setup
* @{
*   @addtogroup version Version
*   @{
*/

/*----------------------------------------------------------------------------
                      Import object declarations
----------------------------------------------------------------------------*/
#include "DataTypes.h"

/// Command version number - always 0 in actuators
#define COMMAND_VERSION_NUMBER     0
/// Version whole number - always 0 in actuators
#define VERSION_WHOLE_NUMBER       1
/// Version sub number - always 0 in actuators
#define VERSION_SUB_NUMBER         2
///  Branch number number - 0 if main branch
#define BRANCH_ID                  3
/// Build number - initially 1 and incremented for each new build
#define BUILD_NUMBER               4
/// Micro build number - 0 used for builds to SAP. Micro build number > 0 will result in error when checkin to SAP
#define MICRO_BUILD                5


/*----------------------------------------------------------------------------
                               Defines
----------------------------------------------------------------------------*/
#define BOOTLOADER_BUILD_INFORMATION_LENGTH  6


/*----------------------------------------------------------------------------
                       Type declarations
----------------------------------------------------------------------------*/

/** Structure typedef for version information */
typedef struct
{
    /// Command version number - always 0 in actuators
	BYTE bCommandVersionNumber;
  	/// Version whole number - always 0 in actuators
    BYTE bVersionWholeNumber;
	/// Version sub number - always 0 in actuators
    BYTE bVersionSubNumber;
	///  Branch number number - 0 if main branch
    BYTE bBranchID;
	/// Build number - initially 1 and incremented for each new build
    BYTE bBuildNumber;
	/// Micro build number - 0 used for builds to SAP. Micro build number > 0 will result in error when checkin to SAP
    BYTE bMicroBuild;
} ST_VERSION_INFO;	

/*----------------------------------------------------------------------------
                      Constant declarations
----------------------------------------------------------------------------*/

extern const ST_VERSION_INFO stBuildVersion;

/*----------------------------------------------------------------------------
                      Variable declarations
----------------------------------------------------------------------------*/

/**
*   @}
* @}
*/

#endif
/*----------------------------------------------------------------------------
                          End definition file
----------------------------------------------------------------------------*/

