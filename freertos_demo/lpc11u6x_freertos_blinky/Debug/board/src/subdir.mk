################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../board/src/board.c \
../board/src/board_sysinit.c 

C_DEPS += \
./board/src/board.d \
./board/src/board_sysinit.d 

OBJS += \
./board/src/board.o \
./board/src/board_sysinit.o 


# Each subdirectory must supply rules for building sources it contributes
board/src/%.o: ../board/src/%.c board/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__MTB_BUFFER_SIZE=256 -D__USE_ROMDIVIDE -D__USE_LPCOPEN -D__LPC11U6X__ -D__REDLIB__ -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_arm_cm0" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_freertoslpc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0 -mthumb -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-board-2f-src

clean-board-2f-src:
	-$(RM) ./board/src/board.d ./board/src/board.o ./board/src/board_sysinit.d ./board/src/board_sysinit.o

.PHONY: clean-board-2f-src

