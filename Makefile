#----------------------------------------------------------------------------------------------#
# Variables
#----------------------------------------------------------------------------------------------#
CC = gcc
CFLAGS = -Wall -Wextra -std=c99

# Input and output files
INPUT = c.niam
OUTPUT = temp.c
EXEC = niam

#----------------------------------------------------------------------------------------------#
# Dependency Tree 
#----------------------------------------------------------------------------------------------#

define REVERSE
	tac $(INPUT) | rev | \
	sed 'y/{}()<>/}{)(></' > $(OUTPUT)
endef

# Compile and cleanup.
$(EXEC): $(OUTPUT)
	$(CC) $(CFLAGS) $(OUTPUT) -o $(EXEC)	
	rm $(OUTPUT)

# Reverse the source code and create a temporary C file.
$(OUTPUT): $(INPUT)
	$(REVERSE)
	
# Clean up binary.
clean:
	rm $(EXEC)


