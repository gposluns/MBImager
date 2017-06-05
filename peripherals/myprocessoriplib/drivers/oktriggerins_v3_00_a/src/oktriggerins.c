/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/oktriggerins_v3_00_a/src/oktriggerins.c
* Version:           3.00.a
* Description:       oktriggerins Driver Source File
* Date:              Fri Jun 02 10:01:18 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "oktriggerins.h"


/************************** Function Definitions ***************************/

void OKTRIGGERINS_Initialize(u32 baseaddr){
	baseAddress = baseaddr;
	
	int i, j;
	for (i = 0; i < OKTRIGGERINS_NUM_REG; i++){
		for (j = 0; j < OKTRIGGERINS_NUM_REG; j++){
			handlers [i][j] = NULL;
			datas [i][j] = NULL;
		}
	}
}

void OKTRIGGERINS_SetInterruptMask(u8 trigger, u32 mask){
	masks[trigger] = mask;
	OKTRIGGERINS_mWriteReg(baseAddress, trigger*0x04, mask);
}

u32 OKTRIGGERINS_GetTrigger(u8 trigger, u32 mask){
	return mask & OKTRIGGERINS_mReadReg(baseAddress, trigger*0x04);
}

void OKTRIGGERINS_ClearTrigger(u8 trigger){
	OKTRIGGERINS_SetInterruptMask(trigger, masks[trigger]);
}

void OKTRIGGERINS_RegisterHandler(u8 trigger, u32 mask, XInterruptHandler handler, void* data){
	int i;
	for (i = 0; i < OKTRIGGERINS_NUM_REG; i++){
		if (mask & 1 << i == 0) continue;
		handlers[trigger][i] = handler;
		datas[trigger][i] = data;
	}
}

void OKTRIGGERINS_Handler(void* data){
	int i, j;
	u32 triggers [OKTRIGGERINS_NUM_REG];
	for (i = 0; i < OKTRIGGERINS_NUM_REG; i++){
		triggers[i] = OKTRIGGERINS_GetTrigger(i, masks[i]);
	}
	for (i = 0; i < OKTRIGGERINS_NUM_REG; i++){
		if (triggers[i] == 0) continue;
		for(j = 0; j < OKTRIGGERINS_NUM_REG; j++){
			if (triggers[i] & 1 << j == 0) continue;
			handlers[i][j](datas[i][j]);
		}
	}
}