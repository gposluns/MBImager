/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/oktriggerins_v2_00_a/src/oktriggerins.c
* Version:           2.00.a
* Description:       oktriggerins Driver Source File
* Date:              Tue May 30 11:02:30 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "oktriggerins.h"

/************************** Function Definitions ***************************/

//initialize OKTRIGGERINS peripheral with base address, and sets up stub handlers
//	param:baseaddr:  The base address of the OKTRIGGERINS Peripheral, (get from xparameters.h)
void OKTRIGGERINS_Initialize(void* baseaddr){
	baseaddress = baseaddr;
	int i;
	
	for (i = 0; i < 32; i++){
		handlers[i] = OKTRIGGERINS_StubHandler;
		datas[i] = NULL;
	}
}

/*
Registers an interrupt handler (fn pointer to a function with a void* as param which returns void)
to a trigger(s)

param:handler: fn ptr to handler function
param:mask:  set bits in the mask correspond to triggers to assign this handler to 
*/
void OKTRIGGERINS_RegisterHandler (XInterruptHandler handler, u32 mask, void* data){
	int i;
	for (i = 0 ; i <32; i++){
		if ((mask & (1 << i)) != 0){
			handlers[i] = handler;
			datas[i] = data;
		}
	}
}

//The interrupt handler used by this driver, register with your interrupt controller.
void OKTRIGGERINS_Handler(void* data){
	int i;
	u32 triggers = OKTRIGGERINS_mReadSlaveReg0(baseaddress, 0);
	for (i = 0; i < 32; i++){
		if ((triggers & 1 << i) != 0){
			handlers[i](datas[i]);
		}
	}
	OKTRIGGERINS_mWriteSlaveReg0(baseaddress, 0, 0);
}

//Stub handler does nothing, is initially assigned to all triggers
void OKTRIGGERINS_StubHandler(void* data){
}