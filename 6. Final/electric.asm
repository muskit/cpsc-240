;; Name: REDACTED
;; Section: CPSC 240-07
;; E-mail: REDACTED

extern printf
extern scanf

global electric

segment .data
; print strings
tic_count_start: db `Starting Time: %lu\n`, 0
tic_count_end: db `Ending Time: %lu\n`, 0
emf_prompt: db `Please enter the emf value (volts): `, 0
res_prompt: db `Please enter the resistance (ohms): `, 0
result: db `The computed current is %lf amps.\n`, 0
return_msg: db `This computed value will be returned to the caller.\n`, 0
; formatted input strings
strf_double: db "%lf", 0

segment .bss

segment .text
electric:
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

    ;; --- PRINT CURRENT TICS ---
    ; get tics
    cpuid
    rdtsc
    shl rdx, 32
    add rax, rdx ; rax = tic count
    ; print tics
    mov rdi, tic_count_start
    mov rsi, rax
    mov rax, 0
    call printf

    ;; --- VOLTS ---
    ; prompt
    mov rdi, emf_prompt
    call printf
    ; get volts
    mov rdi, strf_double
    push qword 0 ; stack alignment
    push qword 0
    mov rsi, rsp
    call scanf
    movsd xmm15, [rsp] ; XMM15 = Voltage

    ;; --- RESISTANCE ---
    ; prompt
    mov rdi, res_prompt
    call printf
    ; get resistance
    mov rdi, strf_double
    mov rsi, rsp
    call scanf
    movsd xmm14, [rsp] ; XMM14 = Resistance
    pop rax
    pop rax

    ;; --- CALCULATE AMPS ---
    divsd xmm15, xmm14
    ; print result
    movsd xmm0, xmm15
    mov rax, 1
    mov rdi, result
    call printf

    ;; --- MSG ABOUT SENDING VALUE TO CALLER ---
    mov rdi, return_msg
    call printf

    ;; --- PRINT CURRENT TICS ---
    ; get tics
    cpuid
    rdtsc
    shl rdx, 32
    add rax, rdx ; rax = tic count
    ; print tics
    mov rdi, tic_count_end
    mov rsi, rax
    mov rax, 0
    call printf

    ; return computed current
    mov rax, 1
    movsd xmm0, xmm15

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