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
