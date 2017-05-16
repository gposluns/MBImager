/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/spi_flash_peripheral_v1_00_a/src/spi_flash_peripheral.h
* Version:           1.00.a
* Description:       spi_flash_peripheral Driver Header File
* Date:              Tue May 09 14:44:11 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef SPI_FLASH_PERIPHERAL_H
#define SPI_FLASH_PERIPHERAL_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 */
#define SPI_FLASH_PERIPHERAL_USER_SLV_SPACE_OFFSET (0x00000000)
#define SPI_FLASH_PERIPHERAL_SLV_REG0_OFFSET (SPI_FLASH_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x00000000)
#define SPI_FLASH_PERIPHERAL_SLV_REG1_OFFSET (SPI_FLASH_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x00000004)
#define SPI_FLASH_PERIPHERAL_SLV_REG2_OFFSET (SPI_FLASH_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x00000008)
#define SPI_FLASH_PERIPHERAL_SLV_REG3_OFFSET (SPI_FLASH_PERIPHERAL_USER_SLV_SPACE_OFFSET + 0x0000000C)

/**
 * Software Reset Space Register Offsets
 * -- RST : software reset register
 */
#define SPI_FLASH_PERIPHERAL_SOFT_RST_SPACE_OFFSET (0x00000100)
#define SPI_FLASH_PERIPHERAL_RST_REG_OFFSET (SPI_FLASH_PERIPHERAL_SOFT_RST_SPACE_OFFSET + 0x00000000)

/**
 * Software Reset Masks
 * -- SOFT_RESET : software reset
 */
#define SOFT_RESET (0x0000000A)

//Named register offsets
#define SPI_FLASH_STATUS_REG_OFFSET SPI_FLASH_PERIPHERAL_SLV_REG0_OFFSET
#define SPI_FLASH_CONTROL_REG_OFFSET SPI_FLASH_PERIPHERAL_SLV_REG1_OFFSET
#define SPI_FLASH_INPUT_REG_OFFSET SPI_FLASH_PERIPHERAL_SLV_REG2_OFFSET
#define SPI_FLASH_OUTPUT_REG_OFFSET SPI_FLASH_PERIPHERAL_SLV_REG2_OFFSET

//control and status masks
#define MOSI_EMPTY_MASK 0x80000000
#define MISO_EMPTY_MASK 0x40000000
#define MISO_VALID_MASK 0x20000000
#define MOSI_FULL_MASK  0x10000000
#define MOSI_WR_ACK_MASK 0x8000000
#define FIFO_RESET_MASK   0x80000000
#define SPI_TRANSMIT_MASK 0x40000000
#define MISO_READ_EN_MASK 0x20000000
#define SPI_SS_MASK       0x10000000
#define MOSI_WR_EN_MASK    0x8000000
/**************************** Type Definitions *****************************/

typedef struct{
    u32 control;
    void* baseAddress;
}spi_flash

/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a SPI_FLASH_PERIPHERAL register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the SPI_FLASH_PERIPHERAL device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void SPI_FLASH_PERIPHERAL_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define SPI_FLASH_PERIPHERAL_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a SPI_FLASH_PERIPHERAL register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the SPI_FLASH_PERIPHERAL device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 SPI_FLASH_PERIPHERAL_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define SPI_FLASH_PERIPHERAL_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from SPI_FLASH_PERIPHERAL user logic slave registers.
 *
 * @param   BaseAddress is the base address of the SPI_FLASH_PERIPHERAL device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void SPI_FLASH_PERIPHERAL_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 SPI_FLASH_PERIPHERAL_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define SPI_FLASH_PERIPHERAL_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SPI_FLASH_PERIPHERAL_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SPI_FLASH_PERIPHERAL_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SPI_FLASH_PERIPHERAL_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))

#define SPI_FLASH_PERIPHERAL_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG0_OFFSET) + (RegOffset))
#define SPI_FLASH_PERIPHERAL_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG1_OFFSET) + (RegOffset))
#define SPI_FLASH_PERIPHERAL_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG2_OFFSET) + (RegOffset))
#define SPI_FLASH_PERIPHERAL_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SPI_FLASH_PERIPHERAL_SLV_REG3_OFFSET) + (RegOffset))

//named versions
#define SPI_FLASH_READ_STATUS(BaseAddress) SPI_FLASH_PERIPHERAL_mReadSlaveReg0(BaseAddress, 0)
#define SPI_FLASH_READ_OUTPUT(BaseAddress) SPI_FLASH_PERIPHERAL_mReadSlaveReg3(BaseAddress, 24)
#define SPI_FLASH_WRITE_CONTROL(BaseAddress, value) SPI_FLASH_PERIPHERAL_mWriteSlaveReg1(BaseAddress, 0, value)
#define SPI_FLASH_WRITE_INPUT  (BaseAddress, value) SPI_FLASH_PERIPHERAL_mWriteSlaveReg2(BaseAddress, 24, value)

/**
 *
 * Reset SPI_FLASH_PERIPHERAL via software.
 *
 * @param   BaseAddress is the base address of the SPI_FLASH_PERIPHERAL device.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void SPI_FLASH_PERIPHERAL_mReset(Xuint32 BaseAddress)
 *
 */
#define SPI_FLASH_PERIPHERAL_mReset(BaseAddress) \
 	Xil_Out32((BaseAddress)+(SPI_FLASH_PERIPHERAL_RST_REG_OFFSET), SOFT_RESET)

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the SPI_FLASH_PERIPHERAL instance to be worked on.
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
XStatus SPI_FLASH_PERIPHERAL_SelfTest(void * baseaddr_p);
/**
*  Defines the number of registers available for read and write*/
#define TEST_AXI_LITE_USER_NUM_REG 4

//transfer byteCount bytes over SPI, send from sendBuffer, receive to receiveBuffer, blocks until done.
//receivebuffer may be null
XStatus SPI_FLASH_transfer(spi_falsh* spi, u8* sendBuffer, u8* receiveBuffer, int byteCount);

//initializes given spi_flash control register
void SPI_FLASH_intialize(spi_flash* spi);
#endif /** SPI_FLASH_PERIPHERAL_H */
