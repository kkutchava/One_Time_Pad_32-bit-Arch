.globl _encrs
_encrs:
pushl %ebp
movl %esp, %ebp
subl $16, %esp
pushl %ebx
pushl %esi
pushl %edi

movl 8(%ebp), %ebx  #ebx = arr
movl 12(%ebp), %edi  #edi = num
movl 16(%ebp), %ecx  #ecx = key

xorl %esi, %esi  #esi = i = 0
cmpl %edi, %esi  #i : num
jge ENDFOR  #jump if i>=num
FOR:
pushl %ecx
call _lsfrs
popl %ecx
subl %eax, (%ebx, %esi, 4)
cmpl $0, (%ebx, %esi, 4)
jge ENDIF
addl $26, (%ebx, %esi, 4)
ENDIF:
movl %eax, %ecx  #ecx = key = lsfrc(key)
incl %esi #i++
cmpl %edi, %esi  #i : num
jl FOR
ENDFOR:

pushl %edi
pushl %esi
popl %ebx
movl %ebp, %esp
popl %ebp
ret

