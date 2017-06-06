/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/oktriggerins_v2_00_a/src/oktriggerins.h
* Version:           2.00.a
* Description:       oktriggerins Driver Header File
* Date:              Tue May 30 11:02:30 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef OKTRIGGERINS_H
#define OKTRIGGERINS_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "xparameters.h"
#include "xintc.h"

/************************** Constant Definitions ***************************/

#define OKTRIGGERINS_USER_NUM_REG 1
/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 */
#define OKTRIGGERINS_USER_SLV_SPACE_OFFSET (0x00000000)
#define OKTRIGGERINS_SLV_REG0_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000000)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a OKTRIGGERINS register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the OKTRIGGERINS device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void OKTRIGGERINS_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define OKTRIGGERINS_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a OKTRIGGERINS register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the OKTRIGGERINS device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 OKTRIGGERINS_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define OKTRIGGERINS_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from OKTRIGGERINS user logic slave registers.
 *
 * @param   BaseAddress is the base address of the OKTRIGGERINS device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void OKTRIGGERINS_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 OKTRIGGERINS_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define OKTRIGGERINS_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))

#define OKTRIGGERINS_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG0_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/
void* baseaddress;
XInterruptHandler handlers[32];
void* datas[32];

//initializes the driver with the base address, also registers to give interrupts
void OKTRIGGERINS_Initialize(void* baseaddr);

//registers an interrupt handler to 1 or more triggers (indicated by mask)
void OKTRIGGERINS_RegisterHandler(XInterruptHandler handler, u32 mask, void* data);

//the ublaze interrupt handler used by this driver
void OKTRIGGERINS_Handler(void* data);

void OKTRIGGERINS_StubHandler(void* data);
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the OKTRIGGERINS instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus OKTRIGGERINS_SelfTest(void * baseaddr_p);
/**
*  Defines the number of registers available for read and write*/
#define TEST_AXI_LITE_USER_NUM_REG 1


#endif /** OKTRIGGERINS_H */
