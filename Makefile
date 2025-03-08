#----------------------------------------------------------------------------------------------#
# Variables
#----------------------------------------------------------------------------------------------#
CC = gcc
CFLAGS = -Wall -Wextra -std=c99

# Input and output files
INPUT = c.niam
OUTPUT = main.c
EXEC = main

#----------------------------------------------------------------------------------------------#
# Dependency Tree 
#----------------------------------------------------------------------------------------------#

define REVERSE_FIX
	tac $(INPUT) | rev | \
	sed 'y/{}()<>/}{)(></' > $(OUTPUT)
endef

$(EXEC): $(OUTPUT)
	$(CC) $(CFLAGS) $(OUTPUT) -o $(EXEC)	
	rm $(OUTPUT)

# Reverse, compile, execute, and cleanup
$(OUTPUT): $(INPUT)
	$(REVERSE_FIX)
	
# Clean generated files
clean:
	rm $(OUTPUT) $(EXEC)


