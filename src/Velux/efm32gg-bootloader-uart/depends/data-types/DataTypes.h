/*****************************************************************************
*                                                                            *
*                               VELUX A/S                                    *
*                                                                            *
******************************************************************************

$Project: RESOURCE_Software$

$Workfile: DataTypes.h$

$Revision: 10$

$Date: 17-02-11 15:13:43 CET$

*****************************************************************************/

#ifndef DATATYPES_H
#define DATATYPES_H  1

// Doxygen comments for group/subgroup begin
/**
* @file DataTypes.h
* @brief Defines the data types used in VELUX software.
* @addtogroup Resources
* @{
*   @addtogroup DataTypes
*   @{
*/

/*----------------------------------------------------------------------------
                         Import object declarations
----------------------------------------------------------------------------*/
#include <stdbool.h>

/*----------------------------------------------------------------------------
                           Constant declarations
----------------------------------------------------------------------------*/
#ifndef ON
  #define ON                 1                   ///< Define to make code more readable
#endif

#ifndef OFF
  #define OFF                0                   ///< Define to make code more readable
#endif

#ifndef ENABLE
  #define ENABLE             1                   ///< Define to make code more readable
#endif

#ifndef DISABLE
  #define DISABLE            0                   ///< Define to make code more readable
#endif

#ifndef PULLUP
  #define PULLUP		         1                   ///< Define to make code more readable
#endif

#ifndef PULLDOWN
  #define PULLDOWN	         0                   ///< Define to make code more readable
#endif

#ifndef HIGH
  #define HIGH               1                   ///< Define to make code more readable
#endif

#ifndef LOW
  #define LOW                0                   ///< Define to make code more readable
#endif

#ifndef FOREVER
  #define FOREVER	           1                   ///< Used in eternal while loops.
#endif

#ifndef NULL
  #define NULL               ((void*)0)          ///< Used to initialize pointers.
#endif

#ifndef BIT
  #define BIT                bool                ///< 1 bit variable (Note! Memory size = 1 byte)
#endif

#ifndef BYTE
  #define BYTE               unsigned char       ///< 8 bit variable unsigned
#endif

#ifndef SBYTE
  #define SBYTE              signed char         ///< 8 bit variable signed
#endif

#ifndef WORD
  #define WORD               unsigned short      ///< 16 bit variable unsigned
#endif

#ifndef SWORD
#define SWORD                signed short        ///< 16 bit variable signed
#endif

#ifndef LONG
  #define LONG               unsigned long       ///< 32 bit variable unsigned
#endif

#ifndef SLONG
  #define SLONG              signed long         ///< 32 bit variable signed
#endif

#ifndef LONGLONG
  #define LONGLONG           unsigned long long  ///< 64 bit variable unsigned
#endif

#ifndef SLONGLONG
  #define SLONGLONG          signed long long    ///< 64 bit variable signed
#endif

#ifndef FLOAT
  #define FLOAT              float               ///< 32 bit floating point unsigned
#endif

#ifdef DOUBLE
  #define DOUBLE             double              ///< 64 bit floating point unsigned
#endif

/**
*   @}
* @}
*/

#endif
/*----------------------------------------------------------------------------
                          End definition file
----------------------------------------------------------------------------*/
