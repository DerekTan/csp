/*******************************************************************************
  Timer/Counter(TC${TC_INDEX}) PLIB

  Company
    Microchip Technology Inc.

  File Name
    plib_tc${TC_INDEX}.h

  Summary
    TC${TC_INDEX} PLIB Header File.

  Description
    This file defines the interface to the TC peripheral library. This
    library provides access to and control of the associated peripheral
    instance.

  Remarks:
    None.

*******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2017 released Microchip Technology Inc. All rights reserved.
Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
*******************************************************************************/
// DOM-IGNORE-END

#ifndef PLIB_TC${TC_INDEX}_H       // Guards against multiple inclusion
#define PLIB_TC${TC_INDEX}_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
/* This section lists the other files that are included in this file.
*/

#include "plib_tc.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus // Provide C Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Data Types
// *****************************************************************************
// *****************************************************************************
/* The following data type definitions are used by the functions in this
    interface and should be considered part it.
*/

#define TC${TC_INDEX}_CompareFrequencyGet()  (uint32_t)(${TC_FREQUENCY}UL)

// *****************************************************************************
// *****************************************************************************
// Section: Interface Routines
// *****************************************************************************
// *****************************************************************************
/* The following functions make up the methods (set of possible operations) of
   this interface.
*/


void TC${TC_INDEX}_CompareInitialize( void );

void TC${TC_INDEX}_CompareStart( void );

void TC${TC_INDEX}_CompareStop( void );

<#if TC_CTRLA_MODE = "COUNT8">

void TC${TC_INDEX}_Compare8bitPeriodSet( uint8_t period );

uint8_t TC${TC_INDEX}_Compare8bitPeriodGet( void );

uint8_t TC${TC_INDEX}_Compare8bitCounterGet( void );

void TC${TC_INDEX}_Compare8bitCounterSet( uint8_t count );

void TC${TC_INDEX}_Compare8bitSet( uint8_t compareValue );
<#elseif TC_CTRLA_MODE = "COUNT16">

void TC${TC_INDEX}_Compare16bitPeriodSet( uint16_t period );

uint16_t TC${TC_INDEX}_Compare16bitPeriodGet( void );

uint16_t TC${TC_INDEX}_Compare16bitCounterGet( void );

void TC${TC_INDEX}_Compare16bitCounterSet( uint16_t count );

void TC${TC_INDEX}_Compare16bitSet( uint16_t compareValue );

<#elseif TC_CTRLA_MODE = "COUNT32">

void TC${TC_INDEX}_Compare32bitPeriodSet( uint32_t period );

uint32_t TC${TC_INDEX}_Compare32bitPeriodGet( void );

uint32_t TC${TC_INDEX}_Compare32bitCounterGet( void );

void TC${TC_INDEX}_Compare32bitCounterSet( uint32_t count );

void TC${TC_INDEX}_Compare32bitSet( uint32_t compareValue );
</#if>

bool TC${TC_INDEX}_CompareStatusGet( void );

<#if TC_COMPARE_INTENSET_OVF = true>

void TC${TC_INDEX}_CompareCallbackRegister( TC_CALLBACK callback, uintptr_t context );

void TC${TC_INDEX}_CompareInterruptHandler( void );
</#if>


// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END

#endif /* PLIB_TC${TC_INDEX}_H */
