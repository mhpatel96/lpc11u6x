################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/src/FreeRTOSCommonHooks.c \
../freertos/src/croutine.c \
../freertos/src/heap_3.c \
../freertos/src/list.c \
../freertos/src/port.c \
../freertos/src/queue.c \
../freertos/src/sysinit.c \
../freertos/src/tasks.c \
../freertos/src/timers.c 

C_DEPS += \
./freertos/src/FreeRTOSCommonHooks.d \
./freertos/src/croutine.d \
./freertos/src/heap_3.d \
./freertos/src/list.d \
./freertos/src/port.d \
./freertos/src/queue.d \
./freertos/src/sysinit.d \
./freertos/src/tasks.d \
./freertos/src/timers.d 

OBJS += \
./freertos/src/FreeRTOSCommonHooks.o \
./freertos/src/croutine.o \
./freertos/src/heap_3.o \
./freertos/src/list.o \
./freertos/src/port.o \
./freertos/src/queue.o \
./freertos/src/sysinit.o \
./freertos/src/tasks.o \
./freertos/src/timers.o 


# Each subdirectory must supply rules for building sources it contributes
freertos/src/%.o: ../freertos/src/%.c freertos/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__MTB_BUFFER_SIZE=256 -D__USE_ROMDIVIDE -D__USE_LPCOPEN -D__LPC11U6X__ -D__REDLIB__ -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_arm_cm0" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_freertoslpc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0 -mthumb -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-freertos-2f-src

clean-freertos-2f-src:
	-$(RM) ./freertos/src/FreeRTOSCommonHooks.d ./freertos/src/FreeRTOSCommonHooks.o ./freertos/src/croutine.d ./freertos/src/croutine.o ./freertos/src/heap_3.d ./freertos/src/heap_3.o ./freertos/src/list.d ./freertos/src/list.o ./freertos/src/port.d ./freertos/src/port.o ./freertos/src/queue.d ./freertos/src/queue.o ./freertos/src/sysinit.d ./freertos/src/sysinit.o ./freertos/src/tasks.d ./freertos/src/tasks.o ./freertos/src/timers.d ./freertos/src/timers.o

.PHONY: clean-freertos-2f-src

