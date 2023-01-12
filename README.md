# nrf51822_beacon
<h5 align="center">Creating a keychain (bluetooth beacon) from a found tag from a car alarm system</a> 
<h6 align="wrap">
Цель - из найденной платы метки от сигнализации сделать себе брелок-метку на ключи, попутно познакомиться с цепочкой инструментов, настроить рабочее окружение,
познакомиться с OpenOCD
<br>Используемые инструменты:  Nordic SDK nRF51_SDK_10.0.0_dc26b5e, gcc-arm-none-eabi-4_9, CNU make, OpenOCD, St-link V2</a>  
<br>В папке проекта для используемого софтдевайса и тулчейна поправить в make файле и файле линковщика все что касается вашего текущего чипа (подробно описано у https://diytronic.ru/2017/12/05/testing-nrf51822-ble-module/, за что ему огромное спасбо). У меня просто make вылетал с ошибкой недостающего файла, я так и не нашел что ему надо. Компиляция прошла без ошибок с такким ключем "make nrf51822_xxaa_s130 ".
<br>Для объединения своей программы с софдевайсом использовался mergehex.exe из состава nrf-command-line-tools
<br>Пример: mergehex.exe --merge s110_nrf51_8.0.0_softdevice.hex nrf51822_xxaa_s110.hex --output merge.hex 
<br> Команды для прошивки через Open OCD:
</h6>
<h7>
<br>openocd -f interface/stlink-v2.cfg -f target/nrf51.cfg -c "init"  #Запуск OCD
<br>telnet localhost 4444                                             #login into openocd commandline
<br>halt
<br>program path/to/your/softdevice.hex verify
<br>reset
<br>shutdown
</h7>
