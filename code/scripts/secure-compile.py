#This pyhton shell script does the following:
#1. Build .S files
#2. Check for any secure function calls in main.S file
#3. Add instructions to push secure function pointer 
#   before the secure function call instructions, and 
#   replace those calls with calls to secure gateway
#   entry call function in main.S file 
#4. Find and replace any insecure fn references in 
#   secure .S files with secure fn references
#5. Build .out binaries

#Imports
import os

#add any secure functions you want to include for library use here
secure_functions = ["pbmsrch"]

#Build .S files (give your working directory paths here)
os.system('rm ~/Sheriff/code/asm/*')
os.system('echo "asm directory clear!"')
os.system('make -C ~/Sheriff/code')

#Reading main.S file
file1 = open('../asm/main.S', 'r')
code_lines = file1.readlines()

count = 0
rev_count = 0
modification_required = 0

#While loop routine to check for any secure function calls
while True:
    if (count >= len(code_lines)):
        break 
    line = code_lines[count]
    asm_string = line.strip()
    
    if "CALL" in asm_string or "CALLA" in asm_string:
    	
    	for valid_secure_function in secure_functions:
    		
    	    if valid_secure_function in asm_string:
		        print("Secure Function Call Found: {}\n".format(valid_secure_function))
		        modification_required = 1		
		        break
    
    #Adding new instruction to code_lines list
    if (modification_required == 1):
        secure_function_index = secure_functions.index(valid_secure_function)
        add_secure_function_ptr = "\tPUSH    #"+str(secure_function_index)+"       ;,\n"
        code_lines.insert(count, add_secure_function_ptr)
        count += 1
        add_entry_call = "\tCALLA   #entry_call  ;\n"
        code_lines.insert(count, add_entry_call)
        count += 1
        code_lines[count] = "\tINCD    SP       ;\n" 
        modification_required = 0
    
    count += 1
    
#Closing main.S file
file1.close()
    
#Updating main.S file
file1 = open('../asm/main.S', 'w')
file1.writelines(code_lines)
file1.close()
print("main.S file is updated!\n")

#replace illegal helper fn references with secure fn references
os.system('python3 ~/Sheriff/code/scripts/asmlink.py')

#Sometimes the makefile cannot detect that main.S is
#newer than the output binary
os.system('rm ~/Sheriff/code/bin/*')
os.system('echo "bin directory clear!"')

#Build .out binaries (give your working directory paths here)
os.system('make -C ~/Sheriff/code')
