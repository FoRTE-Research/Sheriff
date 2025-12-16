#This pyhton shell script does the following:
# Replaces references to compiler insterted insecure
# helper functions with secure helper functions

#Imports
import os

#add all compiler inserted functions and their secure replacements
insecure_list = []
secure_list = []
file_list = []

#Reading insecure .S file
for target_file in file_list:

    fileN = open(target_file, 'r')
    code_lines = fileN.readlines()

    count = 0
    rev_count = 0
    modification_required = 0

    #While loop routine to check for any illegal function references
    while True:
        if (count >= len(code_lines)):
            break
        line = code_lines[count]
        asm_string = line.strip()

        for insecure_function in insecure_list:
            if insecure_function in asm_string:
                print("Illegal reference to insecure function found: {}\n".format(insecure_function))
                #Changing illegal reference in code_lines list
                secure_function = secure_list[insecure_list.index(insecure_function)]
                asm_string = asm_string.replace(insecure_function, secure_function)
                code_lines[count] =  "    "+asm_string+"\n"
                break

        count += 1

    #Closing insecure .S file
    fileN.close()

    #Updating to secure .S file
    fileN = open(target_file, 'w')
    fileN.writelines(code_lines)
    fileN.close()
    print(target_file+" is secure!\n")
