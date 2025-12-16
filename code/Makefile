BENCHMARK = stringsearch

GCC_DIR =  ~/ti/msp430-gcc/bin
SUPPORT_FILE_DIRECTORY = ~/ti/msp430-gcc/include
CC      = $(GCC_DIR)/msp430-elf-gcc

SOBJDIR = bin
ROBJDIR = rbin
BMDIR   = benchmarks
GWDIR   = looking-glass-dispatchers
LDDIR   = ld
ASMDIR  = asm

ifeq ($(BENCHMARK), crc)
SRCDIR  = benchmarks/crc
SOBJECTS = $(SOBJDIR)/secure-crc.out
ROBJECTS = $(ROBJDIR)/regular-crc.out
BMFLAG  = -DCRC
else ifeq ($(BENCHMARK), dijkstra)
SRCDIR  = benchmarks/dijkstra
SOBJECTS = $(SOBJDIR)/secure-dijkstra.out
ROBJECTS = $(ROBJDIR)/regular-dijkstra.out
BMFLAG  = -DDIJKSTRA
else ifeq ($(BENCHMARK), stringsearch)
SRCDIR  = benchmarks/stringsearch
SOBJECTS = $(SOBJDIR)/secure-stringsearch.out
ROBJECTS = $(ROBJDIR)/regular-stringsearch.out
BMFLAG  = -DSTRINGSEARCH
else ifeq ($(BENCHMARK), fft)
SRCDIR  = benchmarks/fft
SOBJECTS = $(SOBJDIR)/secure-fft.out
ROBJECTS = $(ROBJDIR)/regular-fft.out
BMFLAG  = -DFFT
else ifeq ($(BENCHMARK), aes)
SRCDIR  = benchmarks/aes
SOBJECTS = $(SOBJDIR)/secure-aes.out
ROBJECTS = $(ROBJDIR)/regular-aes.out
BMFLAG  = -DAES
else ifeq ($(BENCHMARK), chacha20)
SRCDIR  = benchmarks/chacha20
SOBJECTS = $(SOBJDIR)/secure-chacha20.out
ROBJECTS = $(ROBJDIR)/regular-chacha20.out
BMFLAG  = -DCHACHA20
else ifeq ($(BENCHMARK), rc4)
SRCDIR  = benchmarks/rc4
SOBJECTS = $(SOBJDIR)/secure-rc4.out
ROBJECTS = $(ROBJDIR)/regular-rc4.out
BMFLAG  = -DRC4
else ifeq ($(BENCHMARK), rsa)
SRCDIR  = benchmarks/rsa
SOBJECTS = $(SOBJDIR)/secure-rsa.out
ROBJECTS = $(ROBJDIR)/regular-rsa.out
BMFLAG  = -DRSA

CFLAGS = -I $(SUPPORT_FILE_DIRECTORY) -DBARE_METAL -mmcu=msp430fr5994 -Os -S -fverbose-asm -mlarge $(BMFLAG)
ASMFLAGS = -I $(SUPPORT_FILE_DIRECTORY) -DBARE_METAL -mmcu=msp430fr5994 -D_GNU_ASSEMBLER -Wall -g -fdata-sections -ffunction-sections -T $(LDDIR)/msp430fr5994.ld -ffreestanding -mlarge $(BMFLAG)
LFLAGS = -L $(SUPPORT_FILE_DIRECTORY)

# Don't delete .S files as intermediate
#.SECONDARY:

.PHONY: clean

secure: $(SOBJECTS)

regular: $(ROBJECTS)

$(SOBJDIR)/secure-crc.out: $(ASMDIR)/main.S $(ASMDIR)/crc.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ROBJDIR)/regular-crc.out: $(ASMDIR)/main.S $(ASMDIR)/crc.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(SOBJDIR)/secure-dijkstra.out: $(ASMDIR)/main.S $(ASMDIR)/dijkstra.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ROBJDIR)/regular-dijkstra.out: $(ASMDIR)/main.S $(ASMDIR)/dijkstra.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@
	
$(SOBJDIR)/secure-stringsearch.out: $(ASMDIR)/main.S $(ASMDIR)/pbmsrch.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ROBJDIR)/regular-stringsearch.out: $(ASMDIR)/main.S $(ASMDIR)/pbmsrch.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@
	
$(SOBJDIR)/secure-fft.out: $(ASMDIR)/main.S $(ASMDIR)/fourierf.S $(ASMDIR)/fftmisc.S $(SRCDIR)/handmath/*.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@ -lm

$(ROBJDIR)/regular-fft.out: $(ASMDIR)/main.S $(ASMDIR)/fourierf.S $(ASMDIR)/fftmisc.S $(SRCDIR)/handmath/*.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@ -lm
	
$(SOBJDIR)/secure-aes.out: $(ASMDIR)/main.S $(ASMDIR)/aes.S $(SRCDIR)/handmath/*.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ROBJDIR)/regular-aes.out: $(ASMDIR)/main.S $(ASMDIR)/aes.S $(SRCDIR)/handmath/*.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@
	
$(SOBJDIR)/secure-chacha20.out: $(ASMDIR)/main.S $(ASMDIR)/chacha20.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ROBJDIR)/regular-chacha20.out: $(ASMDIR)/main.S $(ASMDIR)/chacha20.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@
	
$(SOBJDIR)/secure-rc4.out: $(ASMDIR)/main.S $(ASMDIR)/rc4.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ROBJDIR)/regular-rc4.out: $(ASMDIR)/main.S $(ASMDIR)/rc4.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@
	
$(SOBJDIR)/secure-rsa.out: $(ASMDIR)/main.S $(ASMDIR)/rsa.S $(SRCDIR)/handmath/*.S $(ASMDIR)/LED.S $(ASMDIR)/gateway.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ROBJDIR)/regular-rsa.out: $(ASMDIR)/main.S $(ASMDIR)/rsa.S $(SRCDIR)/handmath/*.S $(ASMDIR)/LED.S
	$(CC) $(ASMFLAGS) $(LFLAGS) $^ -o $@

$(ASMDIR)/main.S: $(SRCDIR)/main.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@

$(SRCDIR)/handmath/*.S:

$(ASMDIR)/crc.S: $(SRCDIR)/crc.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@

$(ASMDIR)/dijkstra.S: $(SRCDIR)/dijkstra.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@
	
$(ASMDIR)/pbmsrch.S: $(SRCDIR)/pbmsrch.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@
	
$(ASMDIR)/fourierf.S: $(SRCDIR)/fourierf.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@
	
$(ASMDIR)/fftmisc.S: $(SRCDIR)/fftmisc.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@

$(ASMDIR)/aes.S: $(SRCDIR)/aes.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@
	
$(ASMDIR)/chacha20.S: $(SRCDIR)/chacha20.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@
	
$(ASMDIR)/rc4.S: $(SRCDIR)/rc4.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@
	
$(ASMDIR)/rsa.S: $(SRCDIR)/rsa.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@

$(ASMDIR)/LED.S: $(BMDIR)/LED.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@

$(ASMDIR)/gateway.S: $(GWDIR)/gateway.c
	$(CC) $(CFLAGS) $(LFLAGS) $< -o $@

clean:
	$(RM) bin/*.out
