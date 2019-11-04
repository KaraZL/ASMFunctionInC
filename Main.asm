;.386
.model flat,c
.code

ReverseArray	proc
				push ebp
				mov ebp, esp
				push esi
				push edi

				xor eax,eax
				;ebp contains parameters - int is 4 bytes, so we need to move from 4 bytes in ebp
				mov edi, [ebp+8] 
				mov esi, [ebp+12]
				mov ecx, [ebp+16]
				test ecx, ecx

				; -1 from array
				lea esi,[esi+ecx*4-4]
				pushfd
				std

@@:				lodsd
				mov [edi],eax
				add edi,4
				dec ecx
				jnz @B

				popfd
				mov eax,1

				pop edi
				pop esi
				pop ebp

				ret

ReverseArray	endp
				end
