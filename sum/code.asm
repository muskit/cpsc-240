extern printf
extern scanf

;; constants
INPUT_LEN equ 64
MATH_EXPRESSION equ 24 * INPUT_LEN

;; symbol to expose to C
global my_asm_program

;; declare initialized data blocks
segment .data
prompt_name: db `Hello.\nPlease enter two numbers separated by a space. I will sum them up.\n`, 0
strf_two_ints: db "%d %d", 0
strf_result: db `%d + %d = %d\n`, 0


segment .text
my_asm_program:
    push rbp
    mov rbp, rsp
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    push rbx
    pushf

    ; ==PRINT PROMPT== ;
    mov rdi, prompt_name
    call printf

    ; ==GET INPUT== ;
    push 0 ; stack alignment for scanf (PLEASE COMMENT OUT, WILL CRASH IF NOT RUNNING ON UTM)
    ; make room for two ints on stack
    push 0
    push 0
    mov rdi, strf_two_ints

    mov rsi, rsp
    mov rdx, rsp
    add rdx, 8

    call scanf

    ; transfer values and add them
    pop r15
    pop r14
    mov r13, r14 ; r13 = b
    add r13, r15 ; r13 = b + a

    ; print result
    mov rdi, strf_result
    mov rsi, r15
    mov rdx, r14
    mov rcx, r13
    call printf

    pop rax; undo stack alignment (PLEASE COMMENT OUT, WILL CRASH IF NOT RUNNING ON UTM)
    mov rax, r13

    popf
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    pop rbp
    ret ;  return
