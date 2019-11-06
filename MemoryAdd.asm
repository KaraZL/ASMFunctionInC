.386
.model flat, c

.const

;int FibVals[] = { 0, 1, 1, 2, 3, 5, 8, 13,21, 34, 55, 89, 144, 233, 377, 610 };
FibVals   dword 0, 1, 1, 2, 3, 5, 8, 13, 21
dword 34, 55, 89, 144, 233, 377, 610


;NumFibVals = sizeof(FibVals) / sizeof(int)
NumFibVals  dword($ - FibVals) / sizeof dword
;set public to get access to it
public  NumFibVals

.code

MemoryAddressing  proc
push ebp
mov ebp, esp
;non-volatile registers
push ebx
push esi
push edi


xor eax, eax
;ecx = i
mov ecx, [ebp + 8]
cmp ecx, 0
;jump less
jl InvalidIndex
cmp ecx, [NumFibVals]
;jump greater equal
jge  InvalidIndex

;Eg1 - base register
;ebx = FibVals
mov ebx, offset FibVals
;esi = i
mov esi, [ebp + 8]
; esi = i * 4
shl esi, 2
; ebx = FibVals + i * 4
add ebx, esi
mov eax, [ebx]
mov edi, [ebp + 12]
mov[edi], eax


; Eg2 - base register + displacement

mov esi, [ebp + 8]
shl esi, 2
mov eax, [esi + FibVals]
mov edi, [ebp + 16]
mov[edi], eax

; Eg3 - base register + index register

;offset - get the address instead of value
mov ebx, offset FibVals
mov esi, [ebp + 8]
shl esi, 2
mov eax, [ebx + esi]
mov edi, [ebp + 20]
mov[edi], eax

; Eg4 - base register + index register * scale factor

mov ebx, offset FibVals
mov esi, [ebp + 8]
mov eax, [ebx + esi * 4]
mov edi, [ebp + 24]
mov[edi], eax
;sys_exit - returning val
mov eax, 1

InvalidIndex:
pop edi
pop esi
pop ebx
pop ebp

ret

MemoryAddressing  endp
end

