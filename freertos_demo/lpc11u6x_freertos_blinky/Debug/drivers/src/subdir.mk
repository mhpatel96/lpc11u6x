################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/src/adc_11u6x.c \
../drivers/src/chip_11u6x.c \
../drivers/src/clock_11u6x.c \
../drivers/src/crc_11u6x.c \
../drivers/src/dma_11u6x.c \
../drivers/src/eeprom.c \
../drivers/src/gpio_11u6x.c \
../drivers/src/gpiogroup_11u6x.c \
../drivers/src/i2c_11u6x.c \
../drivers/src/i2cm_11u6x.c \
../drivers/src/iap.c \
../drivers/src/iocon_11u6x.c \
../drivers/src/mtb.c \
../drivers/src/pinint_11u6x.c \
../drivers/src/pmu_11u6x.c \
../drivers/src/ring_buffer.c \
../drivers/src/romdiv_11u6x.c \
../drivers/src/rtc_11u6x.c \
../drivers/src/sct_11u6x.c \
../drivers/src/ssp_11u6x.c \
../drivers/src/stopwatch_11u6x.c \
../drivers/src/syscon_11u6x.c \
../drivers/src/sysinit_11u6x.c \
../drivers/src/timer_11u6x.c \
../drivers/src/uart_0_11u6x.c \
../drivers/src/uart_n_11u6x.c \
../drivers/src/wwdt_11u6x.c 

C_DEPS += \
./drivers/src/adc_11u6x.d \
./drivers/src/chip_11u6x.d \
./drivers/src/clock_11u6x.d \
./drivers/src/crc_11u6x.d \
./drivers/src/dma_11u6x.d \
./drivers/src/eeprom.d \
./drivers/src/gpio_11u6x.d \
./drivers/src/gpiogroup_11u6x.d \
./drivers/src/i2c_11u6x.d \
./drivers/src/i2cm_11u6x.d \
./drivers/src/iap.d \
./drivers/src/iocon_11u6x.d \
./drivers/src/mtb.d \
./drivers/src/pinint_11u6x.d \
./drivers/src/pmu_11u6x.d \
./drivers/src/ring_buffer.d \
./drivers/src/romdiv_11u6x.d \
./drivers/src/rtc_11u6x.d \
./drivers/src/sct_11u6x.d \
./drivers/src/ssp_11u6x.d \
./drivers/src/stopwatch_11u6x.d \
./drivers/src/syscon_11u6x.d \
./drivers/src/sysinit_11u6x.d \
./drivers/src/timer_11u6x.d \
./drivers/src/uart_0_11u6x.d \
./drivers/src/uart_n_11u6x.d \
./drivers/src/wwdt_11u6x.d 

OBJS += \
./drivers/src/adc_11u6x.o \
./drivers/src/chip_11u6x.o \
./drivers/src/clock_11u6x.o \
./drivers/src/crc_11u6x.o \
./drivers/src/dma_11u6x.o \
./drivers/src/eeprom.o \
./drivers/src/gpio_11u6x.o \
./drivers/src/gpiogroup_11u6x.o \
./drivers/src/i2c_11u6x.o \
./drivers/src/i2cm_11u6x.o \
./drivers/src/iap.o \
./drivers/src/iocon_11u6x.o \
./drivers/src/mtb.o \
./drivers/src/pinint_11u6x.o \
./drivers/src/pmu_11u6x.o \
./drivers/src/ring_buffer.o \
./drivers/src/romdiv_11u6x.o \
./drivers/src/rtc_11u6x.o \
./drivers/src/sct_11u6x.o \
./drivers/src/ssp_11u6x.o \
./drivers/src/stopwatch_11u6x.o \
./drivers/src/syscon_11u6x.o \
./drivers/src/sysinit_11u6x.o \
./drivers/src/timer_11u6x.o \
./drivers/src/uart_0_11u6x.o \
./drivers/src/uart_n_11u6x.o \
./drivers/src/wwdt_11u6x.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/src/%.o: ../drivers/src/%.c drivers/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__MTB_BUFFER_SIZE=256 -D__USE_ROMDIVIDE -D__USE_LPCOPEN -D__LPC11U6X__ -D__REDLIB__ -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_arm_cm0" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_freertoslpc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0 -mthumb -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers-2f-src

clean-drivers-2f-src:
	-$(RM) ./drivers/src/adc_11u6x.d ./drivers/src/adc_11u6x.o ./drivers/src/chip_11u6x.d ./drivers/src/chip_11u6x.o ./drivers/src/clock_11u6x.d ./drivers/src/clock_11u6x.o ./drivers/src/crc_11u6x.d ./drivers/src/crc_11u6x.o ./drivers/src/dma_11u6x.d ./drivers/src/dma_11u6x.o ./drivers/src/eeprom.d ./drivers/src/eeprom.o ./drivers/src/gpio_11u6x.d ./drivers/src/gpio_11u6x.o ./drivers/src/gpiogroup_11u6x.d ./drivers/src/gpiogroup_11u6x.o ./drivers/src/i2c_11u6x.d ./drivers/src/i2c_11u6x.o ./drivers/src/i2cm_11u6x.d ./drivers/src/i2cm_11u6x.o ./drivers/src/iap.d ./drivers/src/iap.o ./drivers/src/iocon_11u6x.d ./drivers/src/iocon_11u6x.o ./drivers/src/mtb.d ./drivers/src/mtb.o ./drivers/src/pinint_11u6x.d ./drivers/src/pinint_11u6x.o ./drivers/src/pmu_11u6x.d ./drivers/src/pmu_11u6x.o ./drivers/src/ring_buffer.d ./drivers/src/ring_buffer.o ./drivers/src/romdiv_11u6x.d ./drivers/src/romdiv_11u6x.o ./drivers/src/rtc_11u6x.d ./drivers/src/rtc_11u6x.o ./drivers/src/sct_11u6x.d ./drivers/src/sct_11u6x.o ./drivers/src/ssp_11u6x.d ./drivers/src/ssp_11u6x.o ./drivers/src/stopwatch_11u6x.d ./drivers/src/stopwatch_11u6x.o ./drivers/src/syscon_11u6x.d ./drivers/src/syscon_11u6x.o ./drivers/src/sysinit_11u6x.d ./drivers/src/sysinit_11u6x.o ./drivers/src/timer_11u6x.d ./drivers/src/timer_11u6x.o ./drivers/src/uart_0_11u6x.d ./drivers/src/uart_0_11u6x.o ./drivers/src/uart_n_11u6x.d ./drivers/src/uart_n_11u6x.o ./drivers/src/wwdt_11u6x.d ./drivers/src/wwdt_11u6x.o

.PHONY: clean-drivers-2f-src

