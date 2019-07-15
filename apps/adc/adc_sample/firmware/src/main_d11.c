/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "string.h"


#define ADC_VREF                (1650)   //1650 mV (1.65V)
#define DAC_COUNT_INCREMENT     (31U)    // equivalent to 0.1V (0.1 / (3.3 / ((2^10) - 1))) 
#define DAC_COUNT_MAX           (511)

uint16_t adc_count;
uint32_t input_voltage;
/* Initial value of dac count which is midpoint = 1.65 V*/
uint16_t dac_count = 0x100;   

void switch_handler(uintptr_t context )
{
    /* Write next data sample */
    dac_count = dac_count + DAC_COUNT_INCREMENT;
    
    if (dac_count > DAC_COUNT_MAX)
            dac_count=0;    
    
    DAC_DataWrite(dac_count);
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int main ( void )
{
char buff[512];

    setvbuf(stdout, buff, _IONBF, 512);
    
    /* Initialize all modules */
    SYS_Initialize ( NULL );
  
    puts("\n\r---------------------------------------------------------");
    puts("\n\r                    ADC Sample Demo                 ");
    puts("\n\r---------------------------------------------------------\n\r");
    
    ADC_Enable();
    SYSTICK_TimerStart();
    EIC_NMICallbackRegister(switch_handler, (uintptr_t) NULL);
    DAC_DataWrite(dac_count);
    while (1)
    {
        /* Start ADC conversion */
        ADC_ConversionStart();

        /* Wait till ADC conversion result is available */
        while(!ADC_ConversionStatusGet())
        {

        };

        /* Read the ADC result */
        adc_count = ADC_ConversionResultGet();
        input_voltage = adc_count * ADC_VREF / 4095U;

        printf("ADC Count = 0x%x, ADC Input Voltage = %d.%03d V \r", adc_count, (int)(input_voltage/1000), (int)(input_voltage%1000));
        fflush(stdout);
        SYSTICK_DelayMs(500);
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/
