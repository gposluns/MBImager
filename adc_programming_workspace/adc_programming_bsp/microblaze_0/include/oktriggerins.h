/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/oktriggerins_v3_00_a/src/oktriggerins.h
* Version:           3.00.a
* Description:       oktriggerins Driver Header File
* Date:              Fri Jun 02 10:01:18 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef OKTRIGGERINS_H
#define OKTRIGGERINS_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
/*#include "xintc.h"
#include "xparameters.h"*/

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 * -- SLV_REG4 : user logic slave module register 4
 * -- SLV_REG5 : user logic slave module register 5
 * -- SLV_REG6 : user logic slave module register 6
 * -- SLV_REG7 : user logic slave module register 7
 * -- SLV_REG8 : user logic slave module register 8
 * -- SLV_REG9 : user logic slave module register 9
 * -- SLV_REG10 : user logic slave module register 10
 * -- SLV_REG11 : user logic slave module register 11
 * -- SLV_REG12 : user logic slave module register 12
 * -- SLV_REG13 : user logic slave module register 13
 * -- SLV_REG14 : user logic slave module register 14
 * -- SLV_REG15 : user logic slave module register 15
 * -- SLV_REG16 : user logic slave module register 16
 * -- SLV_REG17 : user logic slave module register 17
 * -- SLV_REG18 : user logic slave module register 18
 * -- SLV_REG19 : user logic slave module register 19
 * -- SLV_REG20 : user logic slave module register 20
 * -- SLV_REG21 : user logic slave module register 21
 * -- SLV_REG22 : user logic slave module register 22
 * -- SLV_REG23 : user logic slave module register 23
 * -- SLV_REG24 : user logic slave module register 24
 * -- SLV_REG25 : user logic slave module register 25
 * -- SLV_REG26 : user logic slave module register 26
 * -- SLV_REG27 : user logic slave module register 27
 * -- SLV_REG28 : user logic slave module register 28
 * -- SLV_REG29 : user logic slave module register 29
 * -- SLV_REG30 : user logic slave module register 30
 * -- SLV_REG31 : user logic slave module register 31
 */
#define OKTRIGGERINS_USER_SLV_SPACE_OFFSET (0x00000000)
#define OKTRIGGERINS_SLV_REG0_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000000)
#define OKTRIGGERINS_SLV_REG1_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000004)
#define OKTRIGGERINS_SLV_REG2_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000008)
#define OKTRIGGERINS_SLV_REG3_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define OKTRIGGERINS_SLV_REG4_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000010)
#define OKTRIGGERINS_SLV_REG5_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000014)
#define OKTRIGGERINS_SLV_REG6_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000018)
#define OKTRIGGERINS_SLV_REG7_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000001C)
#define OKTRIGGERINS_SLV_REG8_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000020)
#define OKTRIGGERINS_SLV_REG9_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000024)
#define OKTRIGGERINS_SLV_REG10_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000028)
#define OKTRIGGERINS_SLV_REG11_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000002C)
#define OKTRIGGERINS_SLV_REG12_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000030)
#define OKTRIGGERINS_SLV_REG13_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000034)
#define OKTRIGGERINS_SLV_REG14_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000038)
#define OKTRIGGERINS_SLV_REG15_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000003C)
#define OKTRIGGERINS_SLV_REG16_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000040)
#define OKTRIGGERINS_SLV_REG17_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000044)
#define OKTRIGGERINS_SLV_REG18_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000048)
#define OKTRIGGERINS_SLV_REG19_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000004C)
#define OKTRIGGERINS_SLV_REG20_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000050)
#define OKTRIGGERINS_SLV_REG21_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000054)
#define OKTRIGGERINS_SLV_REG22_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000058)
#define OKTRIGGERINS_SLV_REG23_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000005C)
#define OKTRIGGERINS_SLV_REG24_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000060)
#define OKTRIGGERINS_SLV_REG25_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000064)
#define OKTRIGGERINS_SLV_REG26_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000068)
#define OKTRIGGERINS_SLV_REG27_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000006C)
#define OKTRIGGERINS_SLV_REG28_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000070)
#define OKTRIGGERINS_SLV_REG29_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000074)
#define OKTRIGGERINS_SLV_REG30_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x00000078)
#define OKTRIGGERINS_SLV_REG31_OFFSET (OKTRIGGERINS_USER_SLV_SPACE_OFFSET + 0x0000007C)

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
#define OKTRIGGERINS_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg5(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG5_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg6(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG6_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg7(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG7_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg8(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG8_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg9(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG9_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg10(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG10_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg11(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG11_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg12(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG12_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg13(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG13_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg14(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG14_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg15(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG15_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg16(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG16_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg17(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG17_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg18(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG18_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg19(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG19_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg20(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG20_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg21(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG21_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg22(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG22_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg23(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG23_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg24(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG24_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg25(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG25_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg26(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG26_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg27(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG27_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg28(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG28_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg29(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG29_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg30(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG30_OFFSET) + (RegOffset), (Xuint32)(Value))
#define OKTRIGGERINS_mWriteSlaveReg31(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (OKTRIGGERINS_SLV_REG31_OFFSET) + (RegOffset), (Xuint32)(Value))

#define OKTRIGGERINS_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG0_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG1_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG2_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG3_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG4_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg5(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG5_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg6(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG6_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg7(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG7_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg8(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG8_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg9(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG9_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg10(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG10_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg11(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG11_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg12(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG12_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg13(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG13_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg14(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG14_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg15(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG15_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg16(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG16_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg17(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG17_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg18(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG18_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg19(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG19_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg20(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG20_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg21(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG21_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg22(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG22_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg23(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG23_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg24(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG24_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg25(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG25_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg26(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG26_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg27(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG27_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg28(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG28_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg29(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG29_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg30(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG30_OFFSET) + (RegOffset))
#define OKTRIGGERINS_mReadSlaveReg31(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (OKTRIGGERINS_SLV_REG31_OFFSET) + (RegOffset))

/**
 *  Defines the number of registers available for read and write*/
#define TEST_AXI_LITE_USER_NUM_REG 32
#define OKTRIGGERINS_NUM_REG TEST_AXI_LITE_USER_NUM_REG
	
//base address of the peripheral (can't be >1 so no need for a struct)
u32 baseAddress; 

//up to 1024 interrupt handlers, 1/trigger bit, organized by trigger
XInterruptHandler handlers [OKTRIGGERINS_NUM_REG][OKTRIGGERINS_NUM_REG]; 

//up to 1024 data pointers to pass to corresponding handlers, same organization
void* datas [OKTRIGGERINS_NUM_REG][OKTRIGGERINS_NUM_REG];

//interrupt masks currently being used for each trigger are saved here for convenience
u32 masks [OKTRIGGERINS_NUM_REG];	
/************************** Function Prototypes ****************************/

//Initializes the driver with base address and stub handlers
void OKTRIGGERINS_Initialize(u32 baseaddr);

//Sets the interrupt mask for a trigger (set bit -> interrupt on trigger on this bit)
//The trigger is cleared when this function is called
void OKTRIGGERINS_SetInterruptMask(u8 trigger, u32 mask);

//Registers an interrupt handler to a bit(s) of a trigger, indicated by mask
void OKTRIGGERINS_RegisterHandler(u8 trigger, u32 mask, XInterruptHandler handler, void* data);

//Interrupt handler used by this driver, pass to your interrupt controller
void OKTRIGGERINS_Handler(void* data);

//Gets the value of a trigger, bitwise anded with a mask
u32 OKTRIGGERINS_GetTrigger(u8 trigger, u32 mask);

//Clears a trigger (this just calls SetInterrupt Mask with the saved mask value for that trigger)
void OKTRIGGERINS_ClearTrigger(u8 trigger);

//Stub handler clears the interrupting trigger and nothing else
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


#endif /** OKTRIGGERINS_H */
