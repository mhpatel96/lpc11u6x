################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cr_startup_lpc11u6x.c \
../src/crp.c \
../src/lpc11u6x_freertos_blinky.c \
../src/mtb.c \
../src/sysinit.c 

S_SRCS += \
../src/aeabi_romdiv_patch.s 

C_DEPS += \
./src/cr_startup_lpc11u6x.d \
./src/crp.d \
./src/lpc11u6x_freertos_blinky.d \
./src/mtb.d \
./src/sysinit.d 

OBJS += \
./src/aeabi_romdiv_patch.o \
./src/cr_startup_lpc11u6x.o \
./src/crp.o \
./src/lpc11u6x_freertos_blinky.o \
./src/mtb.o \
./src/sysinit.o 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.s src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__USE_ROMDIVIDE -D__USE_LPCOPEN -D__LPC11U6X__ -D__REDLIB__ -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc_board_nxp_lpcxpresso_11u68\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc_chip_11u6x\inc" -g3 -mcpu=cortex-m0 -mthumb -specs=redlib.specs -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__MTB_BUFFER_SIZE=256 -D__USE_ROMDIVIDE -D__USE_LPCOPEN -D__LPC11U6X__ -D__REDLIB__ -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc_board_nxp_lpcxpresso_11u68\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc_chip_11u6x\inc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0 -mthumb -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src

clean-src:
	-$(RM) ./src/aeabi_romdiv_patch.o ./src/cr_startup_lpc11u6x.d ./src/cr_startup_lpc11u6x.o ./src/crp.d ./src/crp.o ./src/lpc11u6x_freertos_blinky.d ./src/lpc11u6x_freertos_blinky.o ./src/mtb.d ./src/mtb.o ./src/sysinit.d ./src/sysinit.o

.PHONY: clean-src

