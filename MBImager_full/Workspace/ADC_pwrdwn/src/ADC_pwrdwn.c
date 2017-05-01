/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */


#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xbasic_types.h"
#include "xspi.h"
#include "spi_header.h"
#include "xstatus.h"
#include "xuartlite.h"

/************************** Constant Definitions *****************************/

#define SPI_DEVICE_ID			XPAR_SPI_0_DEVICE_ID
#define BUFFER_SIZE				2
#define BUFFER_SIZE_1BYTE		1
#define READ					0b10000000

/************************** Slave Select Commands ****************************/
#define POT1_SS					0b0000000010
#define POT2_SS					0b0000000100
#define READ_ADC_SS				0b0000001000
#define TEMP_SEN_DAUGHT_SS		0b0000100000
#define TEMP_SEN_MOTHER_SS 		0b0001000000
#define READ_TI_ADC1_SS			0b0010000000
#define READ_TI_ADC2_SS			0b0100000000
#define READ_TI_ADC3_SS			0b1000000000

/************************** Command Definitions ******************************/
#define TEMP_SENSOR_SHUTDOWN 	0b00100000
#define ALL_ZEROS				0b00000000
#define N						10

#define PwrDwn_Cmnd = 0b00000001;
#define	PwrDwn_Data = 0b01000001;
#define LVDS_h2A_Cmnd = 0b00000110;
#define	LVDS_h2A_Data = 0b00100000;

/**************************** Type Definitions *******************************/
/*
 * The following data type is used to send and receive data on the SPI
 * interface.
 */
typedef u8 DataBuffer[BUFFER_SIZE];

/************************** Function Prototypes ******************************/

void ResetReadBuffer();
int SpiInitialize(XSpi *SpiInstancePtr, u16 SpiDeviceId);
int SpiTIADCWrite(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 InputWord, u8 Data);
int SpiTIADCRead(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 Address);
/************************** Variable Definitions *****************************/

/*
 * The instances to support the device drivers are global such that the
 * are initialized to zero each time the program runs.
 */
static XSpi SpiInstance; /* The instance of the SPI device */

/*
 * The following variables are used to read and write to the  Spi device, they
 * are global to avoid having large buffers on the stack.
 */
u8 ReadBuffer[BUFFER_SIZE];
u8 WriteBuffer[BUFFER_SIZE];

/*****************************************************************************/


int main(void)
{


   print("---Entering main---\n\r");
   int Status;
   u8 InputWord;
   u8 Data;

	Status = SpiInitialize(&SpiInstance, SPI_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		print("SPI Initialization Failed");
		return XST_FAILURE;
	}

	{
      XStatus status;
      
      print("\r\n Runnning SpiSelfTestExample() for axi_spi_0...\r\n");
      
      status = SpiSelfTestExample(XPAR_GENERIC_SPI_DEVICE_ID);
      
      if (status == 0) {
         print("SpiSelfTestExample PASSED\r\n");
      }
      else {
         print("SpiSelfTestExample FAILED\r\n");
      }
   }


   /*
    * Peripheral SelfTest will not be run for rs232
    * because it has been selected as the STDOUT device
    */


	print("====================Shut-down TI-ADC=========================\n");
//	InputWord = 0b00000000;
//	Data = 0b00100000;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord);
//
//	InputWord = 0b00000001;
//	Data = 0b01000111;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data);
//
	InputWord = 0b00000001;
	Data = 0b010000001;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord);

	print("---Exiting main---\n\r");

   return 0;
}


/* This function initializes the SPI component. */
int SpiInitialize(XSpi *SpiInstancePtr, u16 SpiDeviceId) {
	int Status;
	XSpi_Config *ConfigPtr; /* Pointer to Configuration data */

	ConfigPtr = XSpi_LookupConfig(SpiDeviceId);
	if (ConfigPtr == NULL) {
		print("Device Not Found");
		return XST_DEVICE_NOT_FOUND;
	}

	Status = XSpi_CfgInitialize(SpiInstancePtr, ConfigPtr,
			ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		print("CfgInitialize Failed\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


/* This function sets the content of the ReadBuffer to 0 */
void ResetReadBuffer() {
	u32 Count;
	for (Count = 0; Count < BUFFER_SIZE; Count++) {
		ReadBuffer[Count] = 0;
	}
}


/* This function writes a value to the TI ADC*/
int SpiTIADCWrite(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 InputWord, u8 Data){
	int Status;

	/* Set SPI Master, Manual Slave Select */
	/* Clock Polarity and Phase = 00 */
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Select Slave Chip */
	Status = XSpi_SetSlaveSelect(SpiInstancePtr, READ_TI_ADC3_SS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Start the SPI driver so that the device is enabled. */
	XSpi_Start(SpiInstancePtr);

	/* Disable Global interrupt to use polled mode operation */
	XSpi_IntrGlobalDisable(SpiInstancePtr);

	/* Prepare WriteBuffer Contents */
	/* Input Data Word assigned as follows:
	 * | Write(0)/Read(1) | CE[1] | CE[0] | A[4] | A[3] | A[2] | A[1] | A[0] |
	 * |	DI[7:0]		|
	 * Details refer to page 89 of LM98722 data sheet
	 */
	WriteBuffer[0] = InputWord;
	WriteBuffer[1] = Data;

	/* Dummy Read and Delay */
	int Wait;
	int _temp;

	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	xil_printf("Writing %X into Address %X\n ", WriteBuffer[1], WriteBuffer[0]);

}


/*This function reads a value from the TI-ADC. This function doesn't change the page!*/
int SpiTIADCRead(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 Address){
	int Status;

	/* Set SPI Master, Manual Slave Select */
	/* Clock Polarity and Phase = 00 */
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Select Slave Chip */
	Status = XSpi_SetSlaveSelect(SpiInstancePtr, READ_TI_ADC3_SS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Start the SPI driver so that the device is enabled. */
	XSpi_Start(SpiInstancePtr);

	/* Disable Global interrupt to use polled mode operation */
	XSpi_IntrGlobalDisable(SpiInstancePtr);

	/* Prepare WriteBuffer Contents */
	/* Input Data Word assigned as follows:
	 * | Write(0)/Read(1) | CE[1] | CE[0] | A[4] | A[3] | A[2] | A[1] | A[0] |
	 * |	DI[7:0]		|
	 * Details refer to page 89 of LM98722 data sheet
	 */
	WriteBuffer[0] = Address | 0b10000000;
	WriteBuffer[1] = 0b00000000;

	/* Dummy Read and Delay */
	int Wait;
	int _temp;

	/* Initialize Buffers to zero */
	ResetReadBuffer();

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	/*Determine the address we want to read back in the ADC*/
	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	/*FPGA sends clk and data at clk negedge, ADC reads at posedge. ADC sends
	back data at clk posedge, and FPGA reads it at posedge as well! There is
	a data shift in the read-back value, and it needs to be fixed as follows:*/
	int RegOut = (ReadBuffer [0] << 1) + (ReadBuffer [1] & 0b00000001);

	xil_printf("Reading %X from Address %X\n ", RegOut, Address);

}
