/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/oktriggerins_v1_00_a/src/oktriggerins.c
* Version:           1.00.a
* Description:       oktriggerins Driver Source File
* Date:              Tue May 23 11:06:23 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "oktriggerins.h"

/************************** Function Definitions ***************************/

void oktriggers_initialize(){
	microblaze_enable_interrupts();
	microblaze_register_handler (&handler, NULL);
}

void handler(void* dummy){
	u32 triggers = OKTRIGGERINS_mReadSlaveReg0(XPAR_OKTRIGGERINS_0_BASEADDR, 0);
	int i;
	for (i = 0; i < 32; i++){
		if (triggers & 1 << i != 0){
			handlers[i] (datas[i]);
		}
	}
	
	microblaze_enable_interrupts();
}

void oktriggers_registerHandler(u32 mask, XInterruptHandler handler, void* data){
	int i;
	for (i = 0; i < 32; i++){
		if (mask & 1 << i != 0){
			handlers[i] = handler;
			datas[i] = data;
		}
	}
}