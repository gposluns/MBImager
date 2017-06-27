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
MBI_Debugging.elf.size \

ELFCHECK += \
MBI_Debugging.elf.elfcheck \


# All Target
all: MBI_Debugging.elf secondary-outputs

# Tool invocations
MBI_Debugging.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../Debugging_bsp/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "MBI_Debugging.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

MBI_Debugging.elf.size: MBI_Debugging.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size MBI_Debugging.elf  |tee "MBI_Debugging.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

MBI_Debugging.elf.elfcheck: MBI_Debugging.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck MBI_Debugging.elf -hw ../../MB_SPI_hw_platform/system.xml -pe microblaze_0  |tee "MBI_Debugging.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) MBI_Debugging.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
