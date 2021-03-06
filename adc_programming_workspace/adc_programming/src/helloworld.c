/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xintc.h"
#include "xspi.h"
#include "xil_exception.h"
#include "oktriggerins.h"
#include "platform.h"

void print(char *str);

void loadbuffer(u8* buffer, u32 val){
	buffer[0] = (val & 0xff000000) >> 24;
	buffer[1] = (val & 0x00ff0000) >> 16;
	buffer[2] = (val & 0x0000ff00) >> 8;
	buffer[3] = val & 0x000000ff;
}

void spi_status_handler(void* CallBackRef, u32 StatusEvent, unsigned int ByteCount){
	if (StatusEvent == XST_SPI_TRANSFER_DONE){
		Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR, *(u32*)CallBackRef);
	}
	Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR + 0x04*10, StatusEvent);
}

void send_command(void* pointers){
	Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR + 0x04*10, 0);
	loadbuffer(*((u8**)pointers + 1), Xil_In32(XPAR_OKWIREINS_0_BASEADDR + 4));
	**((u32**)pointers + 2) = 0;
	Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR + 0x04*11, **((u32**)pointers + 1));
	XSpi_SetSlaveSelect(*(XSpi**)pointers, Xil_In32(XPAR_OKWIREINS_0_BASEADDR + 8));
	XSpi_Transfer(*(XSpi**)pointers, *((u8**)pointers + 1), *((u8**)pointers + 2), Xil_In32(XPAR_OKWIREINS_0_BASEADDR));
	OKTRIGGERINS_ClearTrigger (0);
}

int main()
{
    init_platform();

    print("Hello World\n\r");

    static XIntc intc;
    static XSpi spi;
    static XSpi_Config* configptr;
    u8 inbuffer[4];
    u8 outbuffer[4];
    void* pointers[3];
    pointers[0] = &spi;
    pointers[1] = inbuffer;
    pointers[2] = outbuffer;


    OKTRIGGERINS_Initialize(XPAR_OKTRIGGERINS_0_BASEADDR);
    OKTRIGGERINS_RegisterHandler(0, 0x01, send_command, pointers);
    OKTRIGGERINS_SetInterruptMask(0, 0x01);

    configptr = XSpi_LookupConfig(XPAR_SPI_0_DEVICE_ID);
    configptr->SlaveOnly = 0;
    XSpi_CfgInitialize(&spi, configptr, configptr->BaseAddress);
    XSpi_SetStatusHandler(&spi, outbuffer, spi_status_handler);
    XSpi_SetOptions(&spi, XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);
    XSpi_Start(&spi);

    XIntc_Initialize(&intc, XPAR_AXI_INTC_0_DEVICE_ID);
    XIntc_Connect (&intc, XPAR_INTC_0_SPI_0_VEC_ID, XSpi_InterruptHandler, &spi);
    XIntc_Connect (&intc, XPAR_INTC_0_OKTRIGGERINS_0_VEC_ID, OKTRIGGERINS_Handler, NULL);
    XIntc_Start(&intc, XIN_REAL_MODE);
    XIntc_Enable(&intc, XPAR_INTC_0_SPI_0_VEC_ID);
    XIntc_Enable(&intc, XPAR_INTC_0_OKTRIGGERINS_0_VEC_ID);

    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, XIntc_InterruptHandler, &intc);
    Xil_ExceptionEnable();

    while (1){}
    return 0;
}
