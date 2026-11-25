# 01 - Electrónica Digital (Tang Nano 20K)

Repositorio organizado con los proyectos completos de **Gowin EDA** (código fuente en SystemVerilog y archivos de proyecto/restricciones `.gprj`, `.cst`, `.sdc`) para las prácticas de Electrónica Digital en la tarjeta **Sipeed Tang Nano 20K**.

- **FPGA objetivo:** Gowin `GW2AR-18C` (`GW2AR-LV18QN88C8/I7`)
- **IDE:** Gowin EDA

> **Nota:** La carpeta `impl/` y los archivos `*.gprj.user` generados por Gowin EDA se excluyen mediante `.gitignore` para mantener el repositorio limpio y ligero.

## Índice de prácticas

*(Nota: No existe una práctica `P07` en la colección actual.)*

| Práctica | Proyecto / Carpeta | Archivo `.gprj` | Descripción |
| :--- | :--- | :--- | :--- |
| **P01** | [`P01_Sumador_3b`](P01_Sumador_3b/) | `P01.gprj` | Sumador de 3 bits con salida en display de 7 segmentos. |
| **P02** | [`P02_Contador_0_9`](P02_Contador_0_9/) | `P02.gprj` | Contador ascendente de 0 a 9 con divisor de reloj y display de 7 segmentos. |
| **P03** | [`P03_Contador_0_9_UD/base`](P03_Contador_0_9_UD/base/) | `P03.gprj` | Contador ascendente/descendente de 0 a 9 controlado por entrada `up_down`. |
| **P03** | [`P03_Contador_0_9_UD/E1_auto_toggle`](P03_Contador_0_9_UD/E1_auto_toggle/) | `P03_E.gprj` | Contador ascendente/descendente de 0 a 9 con cambio automático de dirección (`toggle`). |
| **P04** | [`P04_Contadores_Multiplexados/E1_contador_0_99`](P04_Contadores_Multiplexados/E1_contador_0_99/) | `P04_ED_E1_counter99.gprj` | Contador de 0 a 99 con 2 displays de 7 segmentos multiplexados. |
| **P04** | [`P04_Contadores_Multiplexados/E2_contador_pausa`](P04_Contadores_Multiplexados/E2_contador_pausa/) | `P04_ED_E2.gprj` | Contador de 0 a 99 multiplexado con botón de pausa/reanudación (FSM). |
| **P04** | [`P04_Contadores_Multiplexados/E3_contador_0_999`](P04_Contadores_Multiplexados/E3_contador_0_999/) | `P04_ED_E3.gprj` | Contador de 0 a 999 con 3 displays de 7 segmentos multiplexados. |
| **P05** | [`P05_Contadores_UD_Multiplexados/base`](P05_Contadores_UD_Multiplexados/base/) | `P05.gprj` | Contador ascendente/descendente de 0 a 99 con 2 displays multiplexados. |
| **P05** | [`P05_Contadores_UD_Multiplexados/E1_contador_0_49_ud`](P05_Contadores_UD_Multiplexados/E1_contador_0_49_ud/) | `P05_E1.gprj` | Contador ascendente/descendente de 0 a 49 con 2 displays multiplexados (incluye `top_tb.sv`). |
| **P05** | [`P05_Contadores_UD_Multiplexados/E2_contador_0_9999_ud`](P05_Contadores_UD_Multiplexados/E2_contador_0_9999_ud/) | `P05_E2.gprj` | Contador ascendente/descendente de 0 a 9999 con 4 displays multiplexados. |
| **P06** | [`P06_PWM_Ultrasonico/E1_pwm`](P06_PWM_Ultrasonico/E1_pwm/) | `P06_pwm.gprj` | Generador PWM con ciclo de trabajo configurable (`duty[4:0]`). |
| **P06** | [`P06_PWM_Ultrasonico/E2_ultrasonico`](P06_PWM_Ultrasonico/E2_ultrasonico/) | `P06_E2_ultrasonico.gprj` | Medición de distancia con sensor ultrasónico (`trigger`/`echo`) en 3 displays multiplexados. |
| **P08** | [`P08_UART/E1_tx_cadena`](P08_UART/E1_tx_cadena/) | `P08_uart_cadena.gprj` | Transmisor UART (`tx`) que envía una cadena almacenada en ROM. |
| **P08** | [`P08_UART/E2_rx_display`](P08_UART/E2_rx_display/) | `P08_uart_E2_rx.gprj` | Receptor UART (`rx`) con visualización en display de 7 segmentos. |
| **P08** | [`P08_UART/E3_echo`](P08_UART/E3_echo/) | `P08_uart_E3_echo.gprj` | Sistema UART Echo (`rx` a `tx`). |
| **P09** | [`P09_SPI_DAC/E1_resolucion`](P09_SPI_DAC/E1_resolucion/) | `P09_dac_E1_resolution.gprj` | DAC por SPI con rampa y selección de resolución (8, 10 o 12 bits). |
| **P09** | [`P09_SPI_DAC/E2_frecuencia`](P09_SPI_DAC/E2_frecuencia/) | `P09_dac_E2_freq.gprj` | DAC por SPI con rampa y variación de frecuencia. |
| **P09** | [`P09_SPI_DAC/E3_senoidal`](P09_SPI_DAC/E3_senoidal/) | `P09_dac_E3_sin.gprj` | DAC por SPI con tabla ROM senoidal de 40 muestras y resolución seleccionable. |

## Cómo usar un proyecto en Gowin EDA

1. Clona este repositorio o descárgalo en tu equipo.
2. Abre **Gowin EDA** y selecciona **Open Project...** para abrir el archivo `.gprj` de la práctica deseada (por ejemplo, `P01_Sumador_3b/P01.gprj`).
3. Ejecuta **Synthesize** y **Place & Route** en el panel de procesos para generar la carpeta `impl/` y el bitstream `.fs`.
4. Conecta la **Tang Nano 20K** y programa el archivo `.fs` generado mediante **Gowin Programmer**.
