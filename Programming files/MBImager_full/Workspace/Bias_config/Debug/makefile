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
Bias_config.elf.size \

ELFCHECK += \
Bias_config.elf.elfcheck \


# All Target
all: Bias_config.elf secondary-outputs

# Tool invocations
Bias_config.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../Bias_config_bsp/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "Bias_config.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Bias_config.elf.size: Bias_config.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size Bias_config.elf  |tee "Bias_config.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

Bias_config.elf.elfcheck: Bias_config.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck Bias_config.elf -hw ../../MB_SPI_hw_platform/system.xml -pe microblaze_0  |tee "Bias_config.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) Bias_config.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
