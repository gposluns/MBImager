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
#include "xspi.h"
#include "spi_header.h"


/************************** Constant Definitions *****************************/

#define SPI_DEVICE_ID			XPAR_SPI_0_DEVICE_ID
#define BUFFER_SIZE				2
#define BUFFER_SIZE_1BYTE		1
#define READ					0b10000000

/************************** Slave Select Commands ****************************/
#define POT1_SS					0b0000000000000010
#define POT2_SS					0b0000000000000100
#define READ_ADC_SS				0b0000000000001000
#define TEMP_SEN_DAUGHT_SS		0b0000000000100000
#define TEMP_SEN_MOTHER_SS 		0b0000000001000000
#define READ_TI_ADC1_SS			0b0000000010000000
#define READ_TI_ADC2_SS			0b0000000100000000
#define READ_TI_ADC3_SS			0b0000001000000000

/************************** Command Definitions ******************************/
#define TEMP_SENSOR_SHUTDOWN 	0b00100000
#define ALL_ZEROS				0b00000000
#define N						10

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
int SpiTIADCWrite(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 InputWord, u8 Data, u16 SSMask);
int SpiTIADCRead(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 Address, u16 SSMask);
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

	print("======================= Pot writes ===========================\n");
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
		Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 2, 120, 1);
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
		Status = SpiPotWrite(&SpiInstance, SPI_DEVICE_ID, 3, 68, 1);
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


	print("====================Configure TI-ADC=========================\n");

	// Change to Page 0
	InputWord = 0b00011111;
	Data = 0b00000000;				// Change to Page 0 registers
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00000000;
	Data = 0b00100010;				// Master mode selection; Unlock registers
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

//	InputWord = 0b00000001;
//	Data = 0b01010000;				// Software reset - FSM
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00000010;
	Data = 0b11000100;				// Pixel rate clk and SH mode (not CDS)
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00000011;
	Data = 0b00000010;				// SF disable -- default word
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00000100;
	Data = 0b01000010;				// Use buffered res divider; auto CLPIN disabled; CLPIN gating disabled; VCLP 0.95VA
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00000101;
	Data = 0b11000000;				// CMOS output; Enable output;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

//	InputWord = 0b00000110;
//	Data = 0b00000001;				// Up-count test pattern at the output;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00000110;
	Data = 0b00000000;				// ADC outputs;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001000;			// R CLAMP start adjust to SAMPLE start = 10
	Data = 0b00001010;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001010;			// G CLAMP start adjust to SAMPLE start = 10
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001100;			// B CLAMP start adjust to SAMPLE start = 10
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001001;			// R CLAMP stop adjust to SAMPLE stop = 38
	Data = 0b00100110;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001011;			// G CLAMP stop adjust to SAMPLE stop = 38
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001101;			// B CLAMP stop adjust to SAMPLE stop = 38
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001110;			// R SAMPLE start adjust to CLAMP start = 10
	Data = 0b00001010;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00010000;			// G SAMPLE start adjust to CLAMP start = 10
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00010010;			// B SAMPLE start adjust to CLAMP start = 10
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00001111;			// R SAMPLE stop adjust to CLAMP stop = 38
	Data = 0b00100110;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00010001;			// G SAMPLE stop adjust to CLAMP stop = 38
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00010011;			// B SAMPLE stop adjust to CLAMP stop = 38
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

//// Change to Page 2
//	InputWord = 0b00011111;
//	Data = 0b00000010;				// Change to Page 2 registers
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00000000;
//	Data = 0b00000100;				// No DDAC correction
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00000110;
//	Data = 0b00000010;				// Start of black pix clamping
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00000111;
//	Data = 0b00000011;				// End of black loop pixel
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00001000;
//	Data = 0b00000110;				// Start of black loop pixel
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00001010;
//	Data = 0b00001001;				// Start of Active pixels (LSB)
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00001011;
//	Data = 0b11111111;				// End of Active pixels (MSB)
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00001101;
//	Data = 0b00000000;				// Length of the line time in pixel periods (MSB)
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00001110;
//	Data = 0b00001100;				// Length of the line time in pixel periods (MSB)
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//
//// Change to Page 3
//	InputWord = 0b00011111;
//	Data = 0b00000011;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00000000;
//	Data = 0b00001001;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00000001;
//	Data = 0b00000000;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//
//// Change to Page 4
//	InputWord = 0b00011111;
//	Data = 0b00000100;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00000000;
//	Data = 0b00001001;				// Sets random outputs at the SH interval! They are not connected anywhere
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//// Change to Page 8
//	InputWord = 0b00011111;
//	Data = 0b00001000;
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);
//
//	InputWord = 0b00001000;
//	Data = 0b10000000;				// LVDS TXCLK Disable; CMOS CLKOUT Disable; LVDS drive adjust - low
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
//	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
//	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

// Change to Page 0 and start the state machines
	InputWord = 0b00011111;
	Data = 0b00000000;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

	InputWord = 0b00000000;
	Data = 0b00100011;
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC1_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC2_SS);
	SpiTIADCWrite(&SpiInstance, SPI_DEVICE_ID, InputWord, Data, READ_TI_ADC3_SS);
	SpiTIADCRead(&SpiInstance, SPI_DEVICE_ID, InputWord, READ_TI_ADC1_SS);

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
	xil_printf("ADC_READ: %d mV\n", result);

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


/* This function reads a value from the TI ADC
int SpiTIADCWrite(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 InputWord, u8 Data){
	int Status;

	 Set SPI Master, Manual Slave Select
	 Clock Polarity and Phase = 10
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION
				| XSP_CLK_PHASE_1_OPTION);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	 Select Slave Chip
	Status = XSpi_SetSlaveSelect(SpiInstancePtr, READ_TI_ADC3_SS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	 Start the SPI driver so that the device is enabled.
	XSpi_Start(SpiInstancePtr);

	 Disable Global interrupt to use polled mode operation
	XSpi_IntrGlobalDisable(SpiInstancePtr);

	 Prepare WriteBuffer Contents
	 Input Data Word assigned as follows:
	 * | Write(0)/Read(1) | CE[1] | CE[0] | A[4] | A[3] | A[2] | A[1] | A[0] |
	 * |	DI[7:0]		|
	 * Details refer to page 89 of LM98722 data sheet

	WriteBuffer[1] = InputWord;
	WriteBuffer[0] = Data;

	 Dummy Read and Delay
	int Wait;
	int _temp;

	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	WriteBuffer[1] = InputWord|READ;

	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	 Initialize Buffers to zero
	ResetReadBuffer();

	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	for (Wait = 0; Wait < 1000000; Wait++)
		_temp = Wait;

	xil_printf("Reading %X,%X from TI-ADC3\n ", ReadBuffer[1], ReadBuffer[0]);
	xil_printf("Writing %X,%X into TI-ADC3\n ", WriteBuffer[1], WriteBuffer[0]);

}*/

/* This function writes a value to the TI ADC*/
int SpiTIADCWrite(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 InputWord, u8 Data, u16 SSMask){
	int Status;

	/* Set SPI Master, Manual Slave Select */
	/* Clock Polarity and Phase = 00 */
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Select Slave Chip */
	Status = XSpi_SetSlaveSelect(SpiInstancePtr, SSMask);
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
int SpiTIADCRead(XSpi *SpiInstancePtr, u16 SpiDeviceId, u8 Address, u16 SSMask){
	int Status;

	/* Set SPI Master, Manual Slave Select */
	/* Clock Polarity and Phase = 00 */
	Status = XSpi_SetOptions(SpiInstancePtr,
			XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Select Slave Chip */
	Status = XSpi_SetSlaveSelect(SpiInstancePtr, SSMask);
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
	int RegOut = (ReadBuffer [1] & 0b00000001) + (ReadBuffer [0] << 1);

	xil_printf("Reading %X from Address %X\n ", RegOut, Address);

}
