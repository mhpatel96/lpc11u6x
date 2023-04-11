################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app/src/cr_startup_lpc11u6x.c \
../app/src/crp.c \
../app/src/lpc11u6x_freertos_blinky.c 

S_SRCS += \
../app/src/aeabi_romdiv_patch.s 

C_DEPS += \
./app/src/cr_startup_lpc11u6x.d \
./app/src/crp.d \
./app/src/lpc11u6x_freertos_blinky.d 

OBJS += \
./app/src/aeabi_romdiv_patch.o \
./app/src/cr_startup_lpc11u6x.o \
./app/src/crp.o \
./app/src/lpc11u6x_freertos_blinky.o 


# Each subdirectory must supply rules for building sources it contributes
app/src/%.o: ../app/src/%.s app/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__USE_ROMDIVIDE -D__USE_LPCOPEN -D__LPC11U6X__ -D__REDLIB__ -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_arm_cm0" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_freertoslpc" -g3 -mcpu=cortex-m0 -mthumb -specs=redlib.specs -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

app/src/%.o: ../app/src/%.c app/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M0PLUS -D__MTB_BUFFER_SIZE=256 -D__USE_ROMDIVIDE -D__USE_LPCOPEN -D__LPC11U6X__ -D__REDLIB__ -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\app\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\board\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\drivers\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\src" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_arm_cm0" -I"E:\MCUXpresso\Workspace\workspace_lpc11u6x_freertos_demo\lpc11u6x_freertos_blinky\freertos\inc_freertoslpc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0 -mthumb -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-app-2f-src

clean-app-2f-src:
	-$(RM) ./app/src/aeabi_romdiv_patch.o ./app/src/cr_startup_lpc11u6x.d ./app/src/cr_startup_lpc11u6x.o ./app/src/crp.d ./app/src/crp.o ./app/src/lpc11u6x_freertos_blinky.d ./app/src/lpc11u6x_freertos_blinky.o

.PHONY: clean-app-2f-src

