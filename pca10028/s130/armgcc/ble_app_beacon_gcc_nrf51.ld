/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  / значения для чипа 51822 xxaa
  FLASH (rx) : ORIGIN = 0x1c000, LENGTH = 256k - 0x1c00   
  RAM (rwx) :  ORIGIN = 0x20002800, LENGTH = 16k - 0x2800

}

SECTIONS
{
  .fs_data_out ALIGN(4):
  {
    PROVIDE( __start_fs_data = .);
    KEEP(*(fs_data))
    PROVIDE( __stop_fs_data = .);
  } = 0
}

INCLUDE "nrf5x_common.ld"