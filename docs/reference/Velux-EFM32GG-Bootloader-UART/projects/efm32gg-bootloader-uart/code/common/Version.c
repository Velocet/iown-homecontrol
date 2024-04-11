/*****************************************************************************
*                                                                            *
*                               VELUX A/S                                    *
*                                                                            *
******************************************************************************

$Project: LIBRARY_EFM32_Encrypted_Bootloader$

$Workfile: Version.c$

$Revision: 8$

$Date: 5/17/21 2:28:45 PM CEST$

*****************************************************************************/

//lint -esym(759, stBuildVersion) could be moved to module

/**
* @file version.c
* @brief Product version is to be updated in this file
* @cond IMPLEMENTATION
* @addtogroup prod_setup Product setup
* @{
*   @addtogroup version Version
*   @{
*/

/*----------------------------------------------------------------------------
                  Import object declarations
----------------------------------------------------------------------------*/
#include "version.h"

/*----------------------------------------------------------------------------
                       Type declarations
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
                     Constant declarations
----------------------------------------------------------------------------*/
/** @brief External structure containing the application specific version numbers.\n
*
*@b Initial @b settings:
 *
 * @code
 * const ST_VERSION_INFO stBuildVersion =  { .bCommandVersionNumber    =   0,
 *                                           .bVersionWholeNumber      =   1,
 *                                           .bVersionSubNumber        =   0,
 *                                           .bBranchID                =   0,
 *                                           .bBuildNumber             =   1,
 *                                           .bMicroBuild              =   1
 *                                         };
 * @endcode
 */
 
#pragma location="BUILD_VERSION"
__root const ST_VERSION_INFO stBuildVersion  =  
                                         { .bCommandVersionNumber =   0,
                                           .bVersionWholeNumber   =   2,
                                           .bVersionSubNumber     =   0,
                                           .bBranchID             =   0,
                                           .bBuildNumber          =   0,
                                           .bMicroBuild           =   0
								         };


/*----------------------------------------------------------------------------
                      Variable declarations
----------------------------------------------------------------------------*/


/**
*   @}
* @}
* @endcond IMPLEMENTATION
*/

/*--------------------------------------------------------------
            End module code
--------------------------------------------------------------*/
