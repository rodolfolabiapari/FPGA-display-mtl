/* system.h
 *
 * Machine generated for a CPU named "cpu" as defined in:
 * e:\TAIWAN_SVN\mtl\cd\v1.0\Demonstrations\SOPC\DE2_SOPC_MTL_PAINTER\software\MTL_DEMO_syslib\..\..\MTL_SOPC.ptf
 *
 * Generated: 2011-09-14 11:30:35.062
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "MTL_SOPC"
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN_BASE 0x00502110
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_PRESENT
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT_BASE 0x00502110
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_PRESENT
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDERR_BASE 0x00502110
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_PRESENT
#define ALT_CPU_FREQ 100000000
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_BIG_ENDIAN 0
#define NIOS2_INTERRUPT_CONTROLLER_ID 0

#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x00480020
#define NIOS2_RESET_ADDR 0x00000000
#define NIOS2_BREAK_ADDR 0x00501020

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTPLL
#define __TERASIC_SRAM
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALT_VIP_VFR
#define __ALTERA_AVALON_CLOCK_CROSSING
#define __ALTERA_AVALON_SYSID
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_PIO
#define __TERASIC_MULTI_TOUCH
#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_TRI_STATE_BRIDGE
#define __ALTERA_AVALON_CFI_FLASH
#define __ALTERA_AVALON_LCD_16207

/*
 * altpll_sys configuration
 *
 */

#define ALTPLL_SYS_NAME "/dev/altpll_sys"
#define ALTPLL_SYS_TYPE "altpll"
#define ALTPLL_SYS_BASE 0x00502100
#define ALTPLL_SYS_SPAN 16
#define ALT_MODULE_CLASS_altpll_sys altpll

/*
 * sram configuration
 *
 */

#define SRAM_NAME "/dev/sram"
#define SRAM_TYPE "TERASIC_SRAM"
#define SRAM_BASE 0x00480000
#define SRAM_SPAN 524288
#define ALT_MODULE_CLASS_sram TERASIC_SRAM

/*
 * jtag_uart configuration
 *
 */

#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_BASE 0x00502110
#define JTAG_UART_SPAN 8
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_READ_CHAR_STREAM ""
#define JTAG_UART_SHOWASCII 1
#define JTAG_UART_RELATIVEPATH 1
#define JTAG_UART_READ_LE 0
#define JTAG_UART_WRITE_LE 0
#define JTAG_UART_ALTERA_SHOW_UNRELEASED_JTAG_UART_FEATURES 0
#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart

/*
 * sdram configuration
 *
 */

#define SDRAM_NAME "/dev/sdram"
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_BASE 0x00800000
#define SDRAM_SPAN 8388608
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_ADDR_WIDTH 12
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_CAS_LATENCY 3
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_AC 5.5
#define SDRAM_T_WR 14.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_SHARED_DATA 0
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_IS_INITIALIZED 1
#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller

/*
 * alt_vip_vfr_0 configuration
 *
 */

#define ALT_VIP_VFR_0_NAME "/dev/alt_vip_vfr_0"
#define ALT_VIP_VFR_0_TYPE "alt_vip_vfr"
#define ALT_VIP_VFR_0_BASE 0x00502000
#define ALT_VIP_VFR_0_SPAN 128
#define ALT_VIP_VFR_0_IRQ 1
#define ALT_VIP_VFR_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define ALT_MODULE_CLASS_alt_vip_vfr_0 alt_vip_vfr

/*
 * clock_crossing_io configuration
 *
 */

#define CLOCK_CROSSING_IO_NAME "/dev/clock_crossing_io"
#define CLOCK_CROSSING_IO_TYPE "altera_avalon_clock_crossing"
#define CLOCK_CROSSING_IO_BASE 0x02000000
#define CLOCK_CROSSING_IO_SPAN 128
#define CLOCK_CROSSING_IO_UPSTREAM_FIFO_DEPTH 64
#define CLOCK_CROSSING_IO_DOWNSTREAM_FIFO_DEPTH 32
#define CLOCK_CROSSING_IO_DATA_WIDTH 32
#define CLOCK_CROSSING_IO_NATIVE_ADDRESS_WIDTH 5
#define CLOCK_CROSSING_IO_USE_BYTE_ENABLE 1
#define CLOCK_CROSSING_IO_USE_BURST_COUNT 0
#define CLOCK_CROSSING_IO_MAXIMUM_BURST_SIZE 8
#define CLOCK_CROSSING_IO_UPSTREAM_USE_REGISTER 0
#define CLOCK_CROSSING_IO_DOWNSTREAM_USE_REGISTER 0
#define CLOCK_CROSSING_IO_SLAVE_SYNCHRONIZER_DEPTH 3
#define CLOCK_CROSSING_IO_MASTER_SYNCHRONIZER_DEPTH 3
#define CLOCK_CROSSING_IO_DEVICE_FAMILY "CYCLONEII"
#define ALT_MODULE_CLASS_clock_crossing_io altera_avalon_clock_crossing

/*
 * sysid configuration
 *
 */

#define SYSID_NAME "/dev/sysid"
#define SYSID_TYPE "altera_avalon_sysid"
#define SYSID_BASE 0x02000060
#define SYSID_SPAN 8
#define SYSID_ID 0u
#define SYSID_TIMESTAMP 1313734521u
#define SYSID_REGENERATE_VALUES 0
#define ALT_MODULE_CLASS_sysid altera_avalon_sysid

/*
 * timer configuration
 *
 */

#define TIMER_NAME "/dev/timer"
#define TIMER_TYPE "altera_avalon_timer"
#define TIMER_BASE 0x02000000
#define TIMER_SPAN 32
#define TIMER_IRQ 3
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_ALWAYS_RUN 0
#define TIMER_FIXED_PERIOD 0
#define TIMER_SNAPSHOT 1
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_LOAD_VALUE 49999
#define TIMER_COUNTER_SIZE 32
#define TIMER_MULT 0.0010
#define TIMER_TICKS_PER_SEC 1000
#define TIMER_FREQ 50000000
#define ALT_MODULE_CLASS_timer altera_avalon_timer

/*
 * key configuration
 *
 */

#define KEY_NAME "/dev/key"
#define KEY_TYPE "altera_avalon_pio"
#define KEY_BASE 0x02000020
#define KEY_SPAN 16
#define KEY_DO_TEST_BENCH_WIRING 0
#define KEY_DRIVEN_SIM_VALUE 0
#define KEY_HAS_TRI 0
#define KEY_HAS_OUT 0
#define KEY_HAS_IN 1
#define KEY_CAPTURE 0
#define KEY_DATA_WIDTH 8
#define KEY_RESET_VALUE 0
#define KEY_EDGE_TYPE "NONE"
#define KEY_IRQ_TYPE "NONE"
#define KEY_BIT_CLEARING_EDGE_REGISTER 0
#define KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEY_FREQ 50000000
#define ALT_MODULE_CLASS_key altera_avalon_pio

/*
 * led configuration
 *
 */

#define LED_NAME "/dev/led"
#define LED_TYPE "altera_avalon_pio"
#define LED_BASE 0x02000030
#define LED_SPAN 16
#define LED_DO_TEST_BENCH_WIRING 0
#define LED_DRIVEN_SIM_VALUE 0
#define LED_HAS_TRI 0
#define LED_HAS_OUT 1
#define LED_HAS_IN 0
#define LED_CAPTURE 0
#define LED_DATA_WIDTH 18
#define LED_RESET_VALUE 0
#define LED_EDGE_TYPE "NONE"
#define LED_IRQ_TYPE "NONE"
#define LED_BIT_CLEARING_EDGE_REGISTER 0
#define LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_FREQ 50000000
#define ALT_MODULE_CLASS_led altera_avalon_pio

/*
 * multi_touch configuration
 *
 */

#define MULTI_TOUCH_NAME "/dev/multi_touch"
#define MULTI_TOUCH_TYPE "TERASIC_MULTI_TOUCH"
#define MULTI_TOUCH_BASE 0x00502080
#define MULTI_TOUCH_SPAN 128
#define MULTI_TOUCH_IRQ 2
#define MULTI_TOUCH_IRQ_INTERRUPT_CONTROLLER_ID 0
#define ALT_MODULE_CLASS_multi_touch TERASIC_MULTI_TOUCH

/*
 * epcs_flash_controller configuration
 *
 */

#define EPCS_FLASH_CONTROLLER_NAME "/dev/epcs_flash_controller"
#define EPCS_FLASH_CONTROLLER_TYPE "altera_avalon_epcs_flash_controller"
#define EPCS_FLASH_CONTROLLER_BASE 0x00501800
#define EPCS_FLASH_CONTROLLER_SPAN 2048
#define EPCS_FLASH_CONTROLLER_IRQ 4
#define EPCS_FLASH_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_FLASH_CONTROLLER_DATABITS 8
#define EPCS_FLASH_CONTROLLER_TARGETCLOCK 20
#define EPCS_FLASH_CONTROLLER_CLOCKUNITS "MHz"
#define EPCS_FLASH_CONTROLLER_CLOCKMULT 1000000
#define EPCS_FLASH_CONTROLLER_NUMSLAVES 1
#define EPCS_FLASH_CONTROLLER_ISMASTER 1
#define EPCS_FLASH_CONTROLLER_CLOCKPOLARITY 0
#define EPCS_FLASH_CONTROLLER_CLOCKPHASE 0
#define EPCS_FLASH_CONTROLLER_LSBFIRST 0
#define EPCS_FLASH_CONTROLLER_EXTRADELAY 0
#define EPCS_FLASH_CONTROLLER_TARGETSSDELAY 100
#define EPCS_FLASH_CONTROLLER_DELAYUNITS "us"
#define EPCS_FLASH_CONTROLLER_DELAYMULT "1e-006"
#define EPCS_FLASH_CONTROLLER_PREFIX "epcs_"
#define EPCS_FLASH_CONTROLLER_REGISTER_OFFSET 0x200
#define EPCS_FLASH_CONTROLLER_IGNORE_LEGACY_CHECK 1
#define EPCS_FLASH_CONTROLLER_USE_ASMI_ATOM 1
#define EPCS_FLASH_CONTROLLER_CLOCKUNIT "kHz"
#define EPCS_FLASH_CONTROLLER_DELAYUNIT "us"
#define EPCS_FLASH_CONTROLLER_DISABLEAVALONFLOWCONTROL 0
#define EPCS_FLASH_CONTROLLER_INSERT_SYNC 0
#define EPCS_FLASH_CONTROLLER_SYNC_REG_DEPTH 2
#define ALT_MODULE_CLASS_epcs_flash_controller altera_avalon_epcs_flash_controller

/*
 * tri_state_bridge_flash configuration
 *
 */

#define TRI_STATE_BRIDGE_FLASH_NAME "/dev/tri_state_bridge_flash"
#define TRI_STATE_BRIDGE_FLASH_TYPE "altera_avalon_tri_state_bridge"
#define ALT_MODULE_CLASS_tri_state_bridge_flash altera_avalon_tri_state_bridge

/*
 * cfi_flash configuration
 *
 */

#define CFI_FLASH_NAME "/dev/cfi_flash"
#define CFI_FLASH_TYPE "altera_avalon_cfi_flash"
#define CFI_FLASH_BASE 0x00000000
#define CFI_FLASH_SPAN 4194304
#define CFI_FLASH_SETUP_VALUE 100
#define CFI_FLASH_WAIT_VALUE 160
#define CFI_FLASH_HOLD_VALUE 100
#define CFI_FLASH_TIMING_UNITS "ns"
#define CFI_FLASH_UNIT_MULTIPLIER 1
#define CFI_FLASH_SIZE 4194304
#define ALT_MODULE_CLASS_cfi_flash altera_avalon_cfi_flash

/*
 * sw configuration
 *
 */

#define SW_NAME "/dev/sw"
#define SW_TYPE "altera_avalon_pio"
#define SW_BASE 0x02000040
#define SW_SPAN 16
#define SW_DO_TEST_BENCH_WIRING 0
#define SW_DRIVEN_SIM_VALUE 0
#define SW_HAS_TRI 0
#define SW_HAS_OUT 0
#define SW_HAS_IN 1
#define SW_CAPTURE 0
#define SW_DATA_WIDTH 18
#define SW_RESET_VALUE 0
#define SW_EDGE_TYPE "NONE"
#define SW_IRQ_TYPE "NONE"
#define SW_BIT_CLEARING_EDGE_REGISTER 0
#define SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SW_FREQ 50000000
#define ALT_MODULE_CLASS_sw altera_avalon_pio

/*
 * lcd configuration
 *
 */

#define LCD_NAME "/dev/lcd"
#define LCD_TYPE "altera_avalon_lcd_16207"
#define LCD_BASE 0x02000050
#define LCD_SPAN 16
#define ALT_MODULE_CLASS_lcd altera_avalon_lcd_16207

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       SRAM
#define ALT_RODATA_DEVICE     SRAM
#define ALT_RWDATA_DEVICE     SRAM
#define ALT_EXCEPTIONS_DEVICE SRAM
#define ALT_RESET_DEVICE      CFI_FLASH


#endif /* __SYSTEM_H_ */
