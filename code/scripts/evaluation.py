#Imports
import os

#Select a benchmark
#benchmark = "crc"
#benchmark = "dijkstra"
benchmark = "stringsearch"
#benchmark = "fft"
#benchmark = "aes"
#benchmark = "chacha20"
#benchmark = "rc4"
#enchmark = "rsa"

#modify msp430fr5994.ld based on benchmark
file1 = open('../ld/msp430fr5994.ld', 'r')
code_lines = file1.readlines()

if (benchmark == "crc"):
    code_lines[456] = "    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    //*(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    //. = ALIGN(2);\n"
    code_lines[478] = "    //*(.text.*)\n"
elif (benchmark == "dijkstra"):
    code_lines[456] = "    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    //*(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    //. = ALIGN(2);\n"
    code_lines[478] = "    //*(.text.*)\n"
elif (benchmark == "stringsearch"):
    code_lines[456] = "    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    //*(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    //. = ALIGN(2);\n"
    code_lines[478] = "    //*(.text.*)\n"
elif (benchmark == "fft"):
    code_lines[456] = "    //*(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    *(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    . = ALIGN(2);\n"
    code_lines[478] = "    *(.text.*)\n"
elif (benchmark == "aes"):
    code_lines[456] = "    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    //*(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    //. = ALIGN(2);\n"
    code_lines[478] = "    //*(.text.*)\n"
elif (benchmark == "chacha20"):
    code_lines[456] = "    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    //*(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    //. = ALIGN(2);\n"
    code_lines[478] = "    //*(.text.*)\n"
elif (benchmark == "rc4"):
    code_lines[456] = "    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    //*(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    //. = ALIGN(2);\n"
    code_lines[478] = "    //*(.text.*)\n"
elif (benchmark == "rsa"):
    code_lines[456] = "    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)\n"
    code_lines[457] = "    //*(.text .stub .gnu.linkonce.t.* .text:*)\n"
    code_lines[477] = "    //. = ALIGN(2);\n"
    code_lines[478] = "    //*(.text.*)\n"
    
file1 = open('../ld/msp430fr5994.ld', 'w')
file1.writelines(code_lines)
file1.close()
print("msp430fr5994.ld is updated!\n")

#modify Makefile based on benchmark
file1 = open('../Makefile', 'r')
code_lines = file1.readlines()

if (benchmark == "crc"):
    code_lines[0] = "BENCHMARK = crc\n"
elif (benchmark == "dijkstra"):
    code_lines[0] = "BENCHMARK = dijkstra\n"
elif (benchmark == "stringsearch"):
    code_lines[0] = "BENCHMARK = stringsearch\n"
elif (benchmark == "fft"):
    code_lines[0] = "BENCHMARK = fft\n"
elif (benchmark == "aes"):
    code_lines[0] = "BENCHMARK = aes\n"
elif (benchmark == "chacha20"):
    code_lines[0] = "BENCHMARK = chacha20\n"
elif (benchmark == "rc4"):
    code_lines[0] = "BENCHMARK = rc4\n"
elif (benchmark == "rsa"):
    code_lines[0] = "BENCHMARK = rsa\n"
    
file1 = open('../Makefile', 'w')
file1.writelines(code_lines)
file1.close()
print("Makefile is updated!\n")

#modify secure-compile.py based on benchmark
file1 = open('asmlink.py', 'r')
code_lines = file1.readlines()

if (benchmark == "crc"):
    code_lines[8] = "insecure_list = []\n"
    code_lines[9] = "secure_list = []\n"
    code_lines[10] = "file_list = []\n"
elif (benchmark == "dijkstra"):
    code_lines[8] = "insecure_list = []\n"
    code_lines[9] = "secure_list = []\n"
    code_lines[10] = "file_list = []\n"
elif (benchmark == "stringsearch"):
    code_lines[8] = "insecure_list = []\n"
    code_lines[9] = "secure_list = []\n"
    code_lines[10] = "file_list = []\n"
elif (benchmark == "fft"):
    code_lines[8] = "insecure_list = [\"__mspabi_fltuld\", \"__mspabi_divd\", \"__mspabi_mpyd\", \"__mspabi_addd\", \"__mspabi_subd\", \"__mspabi_cvtfd\", \"__mspabi_cvtdf\", \"__mspabi_slli\", \"#sin\", \"#cos\"]\n"
    code_lines[9] = "secure_list = [\"my_fltuld\", \"my_divd\", \"my_mpyd\", \"my_addd\", \"my_subd\", \"my_cvtfd\", \"my_cvtdf\", \"my_slli\", \"#my_sin\", \"#my_cos\"]\n"
    code_lines[10] = "file_list = [\"../asm/fourierf.S\", \"../asm/fftmisc.S\"]\n"
elif (benchmark == "aes"):
    code_lines[8] = "insecure_list = [\"__mspabi_mpyi_f5hw\"]\n"
    code_lines[9] = "secure_list = [\"my_mulhi2\"]\n"
    code_lines[10] = "file_list = [\"../asm/aes.S\"]\n"
elif (benchmark == "chacha20"):
    code_lines[8] = "insecure_list = []\n"
    code_lines[9] = "secure_list = []\n"
    code_lines[10] = "file_list = []\n"
elif (benchmark == "rc4"):
    code_lines[8] = "insecure_list = []\n"
    code_lines[9] = "secure_list = []\n"
    code_lines[10] = "file_list = []\n"
elif (benchmark == "rsa"):
    code_lines[8] = "insecure_list = [\"__mspabi_mpyll\", \"__mspabi_remull\", \"__mspabi_srlll\"]\n"
    code_lines[9] = "secure_list = [\"my_muldi3\", \"my_remull\", \"my_srlll\"]\n"
    code_lines[10] = "file_list = [\"../asm/rsa.S\"]\n"
    
file1 = open('asmlink.py', 'w')
file1.writelines(code_lines)
file1.close()
print("asmlink.py is updated!\n")

#Build regular .out files (give your working directory paths here)
os.system('rm ~/Sheriff/code/asm/*')
os.system('echo "asm directory clear!"')
os.system('make regular -C ~/Sheriff/code')

#replace illegal helper fn references with secure fn references
os.system('python3 ~/Sheriff/code/scripts/asmlink.py')

os.system('rm ~/Sheriff/code/rbin/*')
os.system('echo "rbin directory clear!"')
os.system('make regular -C ~/Sheriff/code')
os.system('echo "Finished building regular binaries...\n"')

#modify secure-compile.py based on benchmark
file1 = open('secure-compile.py', 'r')
code_lines = file1.readlines()

if (benchmark == "crc"):
    code_lines[15] = "secure_functions = [\"crcSlow\", \"crcInit\", \"crcFast\"]\n"
elif (benchmark == "dijkstra"):
    code_lines[15] = "secure_functions = [\"dijkstraFunc\"]\n"
elif (benchmark == "stringsearch"):
    code_lines[15] = "secure_functions = [\"pbmsrch\"]\n"
elif (benchmark == "fft"):
    code_lines[15] = "secure_functions = [\"fft_float\"]\n"
elif (benchmark == "aes"):
    code_lines[15] = "secure_functions = [\"AES_init_ctx\", \"AES_encrypt\", \"AES_decrypt\"]\n"
elif (benchmark == "chacha20"):
    code_lines[15] = "secure_functions = [\"ChaCha20_xor\"]\n"
elif (benchmark == "rc4"):
    code_lines[15] = "secure_functions = [\"arcfour_init\", \"arcfour_byte\", \"arcfour_encrypt\"]\n"
elif (benchmark == "rsa"):
    code_lines[15] = "secure_functions = [\"rsaEncrypt\", \"rsaDecrypt\"]\n"
    
file1 = open('secure-compile.py', 'w')
file1.writelines(code_lines)
file1.close()
print("secure-compile.py is updated!\n")

#Build secure .out binaries
os.system('python3 ~/Sheriff/code/scripts/secure-compile.py')
os.system('echo "Finished building secure binaries..."')
