################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
ADC_pwrdwn.elf.size \

ELFCHECK += \
ADC_pwrdwn.elf.elfcheck \


# All Target
all: ADC_pwrdwn.elf secondary-outputs

# Tool invocations
ADC_pwrdwn.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../ADC_pwrdwn_bsp/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "ADC_pwrdwn.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

ADC_pwrdwn.elf.size: ADC_pwrdwn.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size ADC_pwrdwn.elf  |tee "ADC_pwrdwn.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

ADC_pwrdwn.elf.elfcheck: ADC_pwrdwn.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck ADC_pwrdwn.elf -hw ../../MB_SPI_hw_platform/system.xml -pe microblaze_0  |tee "ADC_pwrdwn.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) ADC_pwrdwn.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
