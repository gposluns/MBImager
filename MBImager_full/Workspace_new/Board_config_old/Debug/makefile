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
Board_config_old.elf.size \

ELFCHECK += \
Board_config_old.elf.elfcheck \


# All Target
all: Board_config_old.elf secondary-outputs

# Tool invocations
Board_config_old.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../Board_config_old_bsp/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "Board_config_old.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Board_config_old.elf.size: Board_config_old.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size Board_config_old.elf  |tee "Board_config_old.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

Board_config_old.elf.elfcheck: Board_config_old.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck Board_config_old.elf -hw ../../MB_SPI_hw_platform/system.xml -pe microblaze_0  |tee "Board_config_old.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) Board_config_old.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
