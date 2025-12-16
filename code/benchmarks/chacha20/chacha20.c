/* Copyright 2019 SiFive, Inc */
/* SPDX-License-Identifier: Apache-2.0 */

#include <stdint.h>
#include <string.h>
#include "chacha20.h"

#define CHACHA20_CONSTANT       "expand 32-byte k"
#define CHACHA20_ROTL(x, n)     (((x) << (n)) | ((x) >> (32 - (n))))
#define CHACHA20_QR(a, b, c, d)               \
	a += b; d ^= a; d = CHACHA20_ROTL(d, 16); \
	c += d; b ^= c; b = CHACHA20_ROTL(b, 12); \
	a += b; d ^= a; d = CHACHA20_ROTL(d,  8); \
	c += d; b ^= c; b = CHACHA20_ROTL(b,  7)

const key256_t Key __attribute__((section(".secure_const"))) = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
    0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f};

const nonce96_t Nonce __attribute__((section(".secure_const"))) = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4a,
    0x00, 0x00, 0x00, 0x00};

const uint32_t Count __attribute__((section(".secure_const"))) = 0x00000001;

ChaCha20_Ctx CTX __attribute__((section(".secure_vars")));

uint32_t res __attribute__((section(".secure_vars")));
__attribute__((section(".secure_code"))) static uint32_t pack4(const uint8_t* a);
static uint32_t pack4(const uint8_t* a)
{
	res =
		  (uint32_t)a[0] << 0 * 8
		| (uint32_t)a[1] << 1 * 8
		| (uint32_t)a[2] << 2 * 8
		| (uint32_t)a[3] << 3 * 8;

	return res;
}

int kk __attribute__((section(".secure_vars")));
__attribute__((section(".secure_code"))) static void ChaCha20_block_next(const uint32_t in[16], uint32_t out[16], uint8_t** keystream);
static void ChaCha20_block_next(const uint32_t in[16], uint32_t out[16], uint8_t** keystream)
{
	for(kk = 0; kk < 4*4; kk++)
		out[kk] = in[kk];

	// Round 1/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]); // Column 0
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]); // Column 1
	CHACHA20_QR(out[2], out[6], out[10], out[14]); // Column 2
	CHACHA20_QR(out[3], out[7], out[11], out[15]); // Column 3
	CHACHA20_QR(out[0], out[5], out[10], out[15]); // Diagonal 1 (main diagonal)
	CHACHA20_QR(out[1], out[6], out[11], out[12]); // Diagonal 2
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]); // Diagonal 3
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]); // Diagonal 4

	// Round 2/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 3/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 4/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 5/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 6/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 7/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 8/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 9/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	// Round 10/10
	CHACHA20_QR(out[0], out[4], out[ 8], out[12]);
	CHACHA20_QR(out[1], out[5], out[ 9], out[13]);
	CHACHA20_QR(out[2], out[6], out[10], out[14]);
	CHACHA20_QR(out[3], out[7], out[11], out[15]);
	CHACHA20_QR(out[0], out[5], out[10], out[15]);
	CHACHA20_QR(out[1], out[6], out[11], out[12]);
	CHACHA20_QR(out[2], out[7], out[ 8], out[13]);
	CHACHA20_QR(out[3], out[4], out[ 9], out[14]);

	for(kk = 0; kk < 4*4; kk++)
		out[kk] += in[kk];

	if(keystream != NULL)
		*keystream = (uint8_t*)out;
}

__attribute__((section(".secure_code"))) static void ChaCha20_init(ChaCha20_Ctx* ctx, const key256_t key, const nonce96_t nonce, uint32_t count);
static void ChaCha20_init(ChaCha20_Ctx* ctx, const key256_t key, const nonce96_t nonce, uint32_t count)
{
	ctx->state[ 0] = pack4((const uint8_t*)CHACHA20_CONSTANT + 0 * 4);
	ctx->state[ 1] = pack4((const uint8_t*)CHACHA20_CONSTANT + 1 * 4);
	ctx->state[ 2] = pack4((const uint8_t*)CHACHA20_CONSTANT + 2 * 4);
	ctx->state[ 3] = pack4((const uint8_t*)CHACHA20_CONSTANT + 3 * 4);
	ctx->state[ 4] = pack4(key + 0 * 4);
	ctx->state[ 5] = pack4(key + 1 * 4);
	ctx->state[ 6] = pack4(key + 2 * 4);
	ctx->state[ 7] = pack4(key + 3 * 4);
	ctx->state[ 8] = pack4(key + 4 * 4);
	ctx->state[ 9] = pack4(key + 5 * 4);
	ctx->state[10] = pack4(key + 6 * 4);
	ctx->state[11] = pack4(key + 7 * 4);
	ctx->state[12] = count;
	ctx->state[13] = pack4(nonce + 0 * 4);
	ctx->state[14] = pack4(nonce + 1 * 4);
	ctx->state[15] = pack4(nonce + 2 * 4);
}

uint32_t tmp[4*4] __attribute__((section(".secure_vars")));
uint8_t* keystream __attribute__((section(".secure_vars")));
size_t ii __attribute__((section(".secure_vars")));
size_t jj __attribute__((section(".secure_vars")));
void ChaCha20_xor(const uint8_t* input_buffer, uint8_t* output_buffer, const size_t bufflen)
{
	keystream = NULL;
	
	ChaCha20_init(&CTX, Key, Nonce, Count);

	for(ii = 0; ii < bufflen; ii += 64)
	{
		ChaCha20_block_next(CTX.state, tmp, &keystream);
		CTX.state[12]++;

		if(CTX.state[12] == 0)
		{
			CTX.state[13]++;
		}

		for(jj = ii; jj < ii + 64; jj++)
		{
			if(jj >= bufflen)
				break;

			output_buffer[jj] = input_buffer[jj] ^ keystream[jj - ii];
		}
	}
}

