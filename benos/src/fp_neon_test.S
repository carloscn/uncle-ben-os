.global fp_test
fp_test:
	fmov s0, #5.25
	ret


.global neon_test
neon_test:
	mov x9, xzr
	1:
	ld1 {v0.16b}, [x0], 16
	st1 {v0.16b}, [x1], 16
	add x9, x9, 16
	cmp x9, x2
	bne 1b
	
	ret

.global neon_ld2_test
neon_ld2_test:
	mov x9, xzr
	1:
	ld2 {v0.16b, v1.16b}, [x0], 32
	st2 {v0.16b, v1.16b}, [x1], 32
	add x9, x9, 32
	cmp x9, x2
	bne 1b
	ret
	
.global neon_rgb24_bgr24_test
neon_rgb24_bgr24_test:
	mov x9, xzr
	1:
	ld3 {v0.16b, v1.16b, v2.16b}, [x0], 48
	mov v3.16b, v0.16b
	mov v0.16b, v2.16b
	mov v2.16b, v3.16b
	st3 {v0.16b, v1.16b, v2.16b}, [x1], 48
	add x9, x9, 48
	cmp x9, x2
	bne 1b
	ret

.global neon_mla_test
neon_mla_test:
	movi v3.16b, 0
	movi v4.16b, 0
	ld1 {v0.16b}, [x0], 16
	ld1 {v1.16b}, [x0], 16
	mla v3.16b, v0.16b, v1.16b
	mla v3.16b, v0.16b, v1.16b

	mov w1, #0
	mov v2.4s[0], w1
	mov w1, #1
	mov v2.4s[1], w1
	mov w1, #2
	mov v2.4s[2], w1
	mov w1, #3
	mov v2.4s[3], w1
	mov w1, #2
	mov v5.4s[0], w1
	mov w1, #3
	mov v5.4s[1], w1

	mla v4.4s, v2.4s, v5.4s[0]
	mla v4.4s, v2.4s, v5.4s[1]
	ret
