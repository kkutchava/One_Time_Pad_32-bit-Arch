.globl _decrs
_decrs:
pushl %ebp
movl %esp, %ebp
subl $16, %esp
pushl %ebx
pushl %esi
pushl %edi

movl 8(%ebp), %ebx  #ebx = arr
movl 12(%ebp), %edx  #edx = num
movl 16(%ebp), %ecx  #ecx = key

xorl %esi, %esi  #esi = i = 0
cmpl %edx, %esi  #i : num
jge ENDFOR  #jump if i>=num
FOR:
pushl %edx
pushl %ecx
call _lsfrs  #to have in eax new key-value
popl %ecx
popl %edx
movl (%ebx, %esi, 4), %edi
addl %eax, %edi
cmpl $26, %edi
jle ENDIF
subl $26, %edi
ENDIF:
movl %edi, (%ebx, %esi, 4)
movl %eax, %ecx  #ecx = key = lsfrs(key)
incl %esi #i++
cmpl %edx, %esi  #i : num
jl FOR
ENDFOR:

popl %edi
popl %esi
popl %ebx
movl %ebp, %esp
popl %ebp
ret
