/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/oktriggerins_v3_00_a/src/oktriggerins.c
* Version:           3.00.a
* Description:       oktriggerins Driver Source File
* Date:              Fri Jun 02 10:01:18 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "oktriggerins.h"


/************************** Function Definitions ***************************/

//Initializes the driver with base address and stub handlers
//param:baseaddr: the base address of this peripheral (can't be >1 so no need for a struct)
void OKTRIGGERINS_Initialize(u32 baseaddr){
	baseAddress = baseaddr;
	
	int i, j;
	for (i = 0; i < OKTRIGGERINS_NUM_REG; i++){
		for (j = 0; j < OKTRIGGERINS_NUM_REG; j++){
			handlers [i][j] = OKTRIGGERINS_StubHandler;
			datas [i][j] = (void*)i;
		}
	}
}

/*
Sets the interrupt mask for a trigger (set bit -> interrupt on trigger on this bit)
The trigger is cleared when this function is called 
(this is required by the hardware due to axi bus width constraints, sorry)

param:trigger: The trigger to set the interrupt mask of (0-31)

param:mask:  The interrupt mask to assign to this trigger.  A set bit in mask corresponds to a 
	trigger bit which sends interrupts
*/
void OKTRIGGERINS_SetInterruptMask(u8 trigger, u32 mask){
	masks[trigger] = mask;
	OKTRIGGERINS_mWriteReg(baseAddress, trigger*0x04, mask);
}

/*
Gets the value of a trigger, bitwise anded with a mask

param:trigger:  The trigger to get the value of

param:mask:  A mask to indicate which bits of the trigger you care about, for convenience
*/
u32 OKTRIGGERINS_GetTrigger(u8 trigger, u32 mask){
	return mask & OKTRIGGERINS_mReadReg(baseAddress, trigger*0x04);
}

/*
Clears a trigger (this just calls SetInterrupt Mask with the saved mask value for that trigger)

param:trigger:  The trigger which will have its value cleared (0-31)
*/
void OKTRIGGERINS_ClearTrigger(u8 trigger){
	OKTRIGGERINS_SetInterruptMask(trigger, masks[trigger]);
}

/*
Registers an interrupt handler to a bit(s) of a trigger, indicated by mask

param:trigger:  The trigger having a handler assigned to some of its bits

param:mask:  The bits of the trigger which will have the handler assigned (set bit -> assign handler)

param:handler:  The interrupt handler to be called when a bit from the trigger&mask sends an interrupt
	type is fn ptr to a function with a void* parameter which returns void
	
param:data:	 Some data to pass to the handler when it is called, can be anything that fits in a void*,
	including a pointer to more data
	
NOTE:  It is the responsibility of the interrupt handler to clear the trigger when it is done with it.
	Multiple handlers on different bits of the same trigger will not interfere with each other if they
	all do this.  If all handlers of a trigger fail to do this then this peripheral will not be able
	to send more interrupts until something clears the trigger.  The trigger can't be cleared in this 
	handler without reducing the options available to handlers, so that won't change.
*/
void OKTRIGGERINS_RegisterHandler(u8 trigger, u32 mask, XInterruptHandler handler, void* data){
	int i;
	for (i = 0; i < OKTRIGGERINS_NUM_REG; i++){
		if (mask & (1 << i) == 0) continue;
		handlers[trigger][i] = handler;
		datas[trigger][i] = data;
	}
}

//Interrupt handler used by this driver, pass to your interrupt controller
void OKTRIGGERINS_Handler(void* data){
	int i, j;
	for (i = 0; i < OKTRIGGERINS_NUM_REG; i++){
		u32 trigger = OKTRIGGERINS_GetTrigger(i, masks[i]);
		if (trigger == 0) continue;
		for(j = 0; j < 32; j++){
			if ((trigger & (1 << j)) == 0) continue;
			handlers[i][j](datas[i][j]);
		}
	}
}

//Stub handler just clears the trigger
void OKTRIGGERINS_StubHandler(void* data){
	OKTRIGGERINS_ClearTrigger((u8)data);
}