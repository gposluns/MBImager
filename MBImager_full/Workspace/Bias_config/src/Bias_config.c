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
int SpiTempSensorPoll(XSpi *SpiInstancePtr, u16 SpiDeviceID);
int SpiPotWrite(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 Address, u8 Data,
		int PotNum);
int SpiPolledExample(XSpi *SpiInstancePtr, u16 SpiDeviceId);
int SpiPotADCRead(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 InputWord);
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

	print("======================Pot writes==========================\n");
//	Vref#1 config
	Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 0, 100, 1);
	if (Status != XST_SUCCESS) {
		print("SpiPot1Write Failed");
		return XST_FAILURE;
	}

	InputWord = 0b10001111;
	Status = SpiPotADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord);
	if (Status != XST_SUCCESS) {
		print("SpiPotADCRead Failed");
		return XST_FAILURE;
	}

//	Vref#2 config
	Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 1, 59, 1);
//	Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 1, 125, 1);
	if (Status != XST_SUCCESS) {
		print("SpiPot1Write Failed");
		return XST_FAILURE;
	}

	InputWord = 0b11001111;
	Status = SpiPotADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord);
	if (Status != XST_SUCCESS) {
		print("SpiPotADCRead Failed");
		return XST_FAILURE;
	}

//	Vref#3 config
	Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 2, 80, 1);
//	Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 2, 150, 1);
	if (Status != XST_SUCCESS) {
		print("SpiPot1Write Failed");
		return XST_FAILURE;
	}

	InputWord = 0b10011111;
	Status = SpiPotADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord);
	if (Status != XST_SUCCESS) {
		print("SpiPotADCRead Failed");
		return XST_FAILURE;
	}

//	Vref#4 config
	Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 3, 75, 1);
//	Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 3, 175, 1);
	if (Status != XST_SUCCESS) {
		print("SpiPot1Write Failed");
		return XST_FAILURE;
	}

	InputWord = 0b11011111;
	Status = SpiPotADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord);
	if (Status != XST_SUCCESS) {
		print("SpiPotADCRead Failed");
		return XST_FAILURE;
	}

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

int SpiPotADCRead(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 InputWord) {
	int Status;

	/* Set SPI Master, Manual Slave Select */
	/* Clock Polarity and Phase = 00 */
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Select Slave Chip */
	Status = XSpi_SetSlaveSelect(SpiInstancePtr, READ_ADC_SS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Start the SPI driver so that the device is enabled. */
	XSpi_Start(SpiInstancePtr);

	/* Disable Global interrupt to use polled mode operation */
	XSpi_IntrGlobalDisable(SpiInstancePtr);

	/* Prepare WriteBuffer Contents */
	/* Input Data Word assigned as follows:
	 * | SGL/DIFF | ODD/SIGN | SELECT 1 | SELECT 0 | UNI | MSBF | WL1 | WL0 |
	 * Details refer to page 11 of 1290FE data sheet
	 */

	WriteBuffer[0] = InputWord;
	WriteBuffer[1] = 0;

	/* Dummy Read and Delay */
	int Wait;
	int _temp;

	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	/* Initialize Buffers to zero */
	ResetReadBuffer();

	/* SPI Read */
	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	/* Concatenate Bytes and remove redundant bits */
	int ret = (ReadBuffer[0] << 8) + ReadBuffer[1];
	ret = ret >> 4;

	/* Output the result */
/*
	int result = ret * 5000 / 4096;
	int result_whole = result / 1000;
	int result_float = result % 1000;
*/

	int result = ret * 5000 / 4096;

//	xil_printf("ADC_READ: %d.%d\n", result_whole, result_float);
	xil_printf("ADC_READ: %d mV\n\n", result);

	return XST_SUCCESS;
}

/* **************************************************************************** */
/* This function writes 10 bits data to POT1 									*/
/* First 2 bits are addresses referencing to one of the 4 RDAC latches 			*/
/* Remainder 8 bits are data used to program the resistance or potential given: */
/*		Rwb(D) = D/256 + Rab + Rw												*/
/*		Vw 	   = D/256 * Vab + Vb												*/
/* **************************************************************************** */
int SpiPotWrite(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 Address, u8 Data,
		int PotNum) {

	if (PotNum != 1 && PotNum != 2) {
		print("Invalid Potentiometer selection\n");
		return XST_FAILURE;
	}

	int Status;

	/* Set SPI Master, Manual Slave Select */
	/* Set Polarity and Phase = 0 */
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Select Slave Chip */
	if (PotNum == 1) {
		Status = XSpi_SetSlaveSelect(SpiInstancePtr, POT1_SS);
	} else {
		Status = XSpi_SetSlaveSelect(SpiInstancePtr, POT2_SS);
	}
	if (Status != XST_SUCCESS) {
		print("Slave Select Failed\n");
		return XST_FAILURE;
	}

	/* Start the SPI driver so that the device is enabled. */
	XSpi_Start(SpiInstancePtr);

	/* Disable Global interrupt to use polled mode operation */
	XSpi_IntrGlobalDisable(SpiInstancePtr);

	/* Setup the WriteBuffer */
	WriteBuffer[0] = Address;
	WriteBuffer[1] = Data;

	/* Initialize Transfer */
	XSpi_Transfer(SpiInstancePtr, WriteBuffer, NULL, BUFFER_SIZE);

	return XST_SUCCESS;

}

/* This function reads a value from the temperature register in AD7314 Mother*/
int SpiTempSensorPoll(XSpi *SpiInstancePtr, u16 SpiDeviceId) {
	int Status;

	/* Set SPI Master, Manual Slave Select */
	/* Clock Polarity and Phase = 01 */
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION
					| XSP_CLK_PHASE_1_OPTION);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Select Slave Chip */
	Status = XSpi_SetSlaveSelect(SpiInstancePtr, TEMP_SEN_MOTHER_SS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Xuint32 slave_selected = XSpi_GetSlaveSelect(SpiInstancePtr);
	if (slave_selected != TEMP_SEN_MOTHER_SS) {
		print("Slave TEMP_SEN_MOTHER_SS Not Selected");
		return XST_FAILURE;
	}

	/* Start the SPI driver so that the device is enabled. */
	XSpi_Start(SpiInstancePtr);

	/* Disable Global interrupt to use polled mode operation */
	XSpi_IntrGlobalDisable(SpiInstancePtr);

	/* Initialize Buffers to zero */
	ResetReadBuffer();
//	WriteBuffer[0] = TEMP_SENSOR_SHUTDOWN;
//	WriteBuffer[1] = 0;
	XSpi_Transfer(SpiInstancePtr, ReadBuffer, ReadBuffer, BUFFER_SIZE);

	/* Concatenate Bytes and remove redundant bits */
	int result = (ReadBuffer[0] << 8) + ReadBuffer[1];
	result = result >> 5;

	/* Convert the temperature value to appropriate Dec. */
	xil_printf("Temperature: %d C\n ", result / 4);

	return XST_SUCCESS;
}
