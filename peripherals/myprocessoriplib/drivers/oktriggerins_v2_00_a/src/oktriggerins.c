/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/oktriggerins_v2_00_a/src/oktriggerins.c
* Version:           2.00.a
* Description:       oktriggerins Driver Source File
* Date:              Tue May 30 11:02:30 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "oktriggerins.h"

/************************** Function Definitions ***************************/

void OKTRIGGERINS_Initialize(void* baseaddr){
	baseaddress = baseaddr;
	int i;
	
	 Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR + 4*4, 0xaa55aa55);
	for (i = 0; i < 32; i++){
		handlers[i] = NULL;
		datas[i] = NULL;
	}
}

void OKTRIGGERINS_RegisterHandler (XInterruptHandler handler, u32 mask, void* data){
	int i;
	for (i = 0 ; i <32; i++){
		if (mask & 1 << i != 0){
			Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR + 4*5, 0x7e570000 + i);
			handlers[i] = handler;
			datas[i] = data;
		}
	}
}

void OKTRIGGERINS_Handler(void* data){
	int i;
	u32 triggers = OKTRIGGERINS_mReadSlaveReg0(baseaddress, 0);
	Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR + 4*7, 0x707e57);
	for (i = 0; i < 32; i++){
		if (triggers & 1 << i != 0){
			Xil_Out32(XPAR_OKWIREOUTS_0_BASEADDR + 4*6, 0x7e57ed00 + i);
			handlers[i](datas[i]);
		}
	}
	OKTRIGGERINS_mWriteSlaveReg0(baseaddress, 0, 0);
}