/*****************************************************************************
* Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/spi_flash_peripheral_v1_00_a/src/spi_flash_peripheral.c
* Version:           1.00.a
* Description:       spi_flash_peripheral Driver Source File
* Date:              Tue May 09 14:44:11 2017 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "spi_flash_peripheral.h"

/************************** Function Definitions ***************************/

//intializes given spi_flash peripheral control register
void SPI_FLASH_intialize(&spi_flash spi){
    spi->control = SPI_SS_MASK;
    SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);
}

//transfers byteCount bytes of data over spi, receivebuffer can be null, buffers must be big enough if they exist
XStatus SPI_FLASH_transfer(spi_flash* spi, u8* sendBuffer, u8* receiveBuffer, int byteCount){
    int i;
    spi->control = spi->control & ~FIFO_RESET_MASK;
    for (i = 0; i < byteCount; i++){ //load sending fifo, transferring every other clock edge to be sure everything gets transferred bc idk how to sync ublaze clock with spi clock
        SPI_FLASH_WRITE_INPUT(baseAddress, *sendBuffer++);
        spi->control = spi->control | MOSI_WR_EN_MASK;
        SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);
        while (SPI_FLASH_READ_STATUS(spi->baseAddress) & MOSI_WR_ACK_MASK == 0){}  //wait for write acknowledge
        spi->control = spi->control & ~MOSI_WR_EN_MASK;
        SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);
        while (SPI_FLASH_READ_STATUS(spi->baseAddress) & MOSI_WR_ACK_MASK != 0){} //wait for not write acknowledge
        if (SPI_FLASH_READ_STATUS(spi->baseAddress) & MOSI_FULL_MASK != 0){
            return XST_FIFO_ERROR;
        }
    }

    spi->control = (spi->control & ~SPI_SS_MASK) | SPI_TRANSMIT_MASK;
    SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);
    while (SPI_FLASH_READ_STATUS(spi->baseAddress) & MOSI_EMPTY_MASK == 0) //wait for fifo to be empty --> transmission completed, an extra byte in read fifo
    spi->control = (spi->control | SPI_SS_MASK) & ~SPI_TRANSMIT_MASK;
    SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);

    for (i = 0; i < byteCount; i++){ //read receiving fifo, transferring every other clock edge to be sure everything gets transferred bc idk how to sync ublaze clock with spi clock
        spi->control = spi->control | MISO_READ_EN_MASK;
        SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);
        while (SPI_FLASH_READ_STATUS(spi->baseAddress) & MISO_VALID_MASK == 0){}  //wait for read valid
        *receivBuffer++ = SPI_FLASH_READ_OUTPUT(spi->baseAddress);
        spi->control = spi->control & ~MISO_READ_EN_MASK;
        SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);
        while (SPI_FLASH_READ_STATUS(spi->baseAddress) & MOSI_WR_ACK_MASK != 0){} //wait for not read valid
        if (SPI_FLASH_READ_STATUS(spi->baseAddress) & MISO_EMPTY_MASK != 0){
            return XST_FIFO_ERROR;
        }
    }

    spi->control = spi->control | FIFO_RESET_MASK; //clean out fifos
    SPI_FLASH_WRITE_CONTROL(spi->baseAddress, spi->control);
    return XST_SUCCESS;
}
