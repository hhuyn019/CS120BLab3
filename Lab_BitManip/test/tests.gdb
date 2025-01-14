# Test file for Lab_BitManip


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Example test:
test "PINA: 0x0A, PINB: 0x26 => PORTC: 0x05"
setPINA 0x0A
setPINB 0x26
continue 20
expectPORTC 0x05
checkResult

test "PINA: 0x62, PINB: 0x0F => PORTC: 0x07"
setPINA 0x62
setPINB 0x0F
continue 20
expectPORTC 0x07
checkResult

test "PINA: 0xC0, PINB: 0xFF => PORTC: 0x0A"
setPINA 0xC0
setPINB 0xFF
continue 20
expectPORTC 0x0A
checkResult

# Add tests below

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
