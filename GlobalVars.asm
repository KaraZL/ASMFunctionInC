.386
.model flat,c

		extern GlChar:byte
		extern GlShort:word
		extern GlInt:dword
		extern GlLongLong:qword

.code

GlobalAddition		proc
					push ebp,
					push esp, esp
					
					mov al, [ebp+8]
					add [GlChar], al

					mov ax, [ebp+12]
					add [GlShort], ax

					mov eax, [ebp+16]
					add [GlInt], eax

					mov eax, [ebp+20]
					mov edx, [ebp+24]

					add dword ptr[GlLongLong], eax
					; add with carry (flag for larger than dword size additions)
					adc dword ptr[GlLongLong], edx

					pop ebp
					ret
GlobalAddition endp
			end


