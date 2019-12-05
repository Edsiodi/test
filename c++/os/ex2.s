	.text
	.file	"ex2.c"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	callq	fork
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jge	.LBB0_2
# %bb.1:
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	%eax, -16(%rbp)         # 4-byte Spill
	jmp	.LBB0_14
.LBB0_2:
	cmpl	$0, -12(%rbp)
	jle	.LBB0_8
# %bb.3:
	movl	$0, -8(%rbp)
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, -8(%rbp)
	jge	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	movl	$1, %edi
	movl	%eax, -20(%rbp)         # 4-byte Spill
	callq	sleep
	movl	%eax, -24(%rbp)         # 4-byte Spill
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_4
.LBB0_7:
	jmp	.LBB0_13
.LBB0_8:
	movl	$0, -8(%rbp)
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, -8(%rbp)
	jge	.LBB0_12
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=1
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
	movl	$1, %edi
	movl	%eax, -28(%rbp)         # 4-byte Spill
	callq	sleep
	movl	%eax, -32(%rbp)         # 4-byte Spill
# %bb.11:                               #   in Loop: Header=BB0_9 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_9
.LBB0_12:
	jmp	.LBB0_13
.LBB0_13:
	jmp	.LBB0_14
.LBB0_14:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"error\n"
	.size	.L.str, 7

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"I am parent.\n"
	.size	.L.str.1, 14

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"I am child.\n"
	.size	.L.str.2, 13


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
