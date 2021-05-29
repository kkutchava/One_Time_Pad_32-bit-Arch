.globl _lsfrs
_lsfrs:
pushl %ebp
movl %esp, %ebp
subl $8, %esp
pushl %ebx

movl 8(%ebp), %ebx
movw %bx, %ax  #ax = newvl = (uint16_t)seed
DOWHILE:
movw %ax, %cx  #cx = b
movw %ax, %dx  #temp. storage
cmpw $0, %ax
jne NOTEQ
movw $0x1, %ax  #newvl = 0x1
NOTEQ:
shrw $2, %dx  #dx = dx>>2
xorw %dx, %cx  #cx = b = b ^ dx
movw %ax, %dx  #reusing dx
shrw $3, %dx  #dx = dx>>3
xorw %dx, %cx  #cx = b = b ^ dx
movw %ax, %dx  #reusing dx
shrw $5, %dx  #dx = dx>>5
xorw %dx, %cx  #cx = b = b ^ dx
shrw $1, %ax  #ax = newvl = newvl>>1
salw $15, %cx  #cx = b = b<<15
orw %cx, %ax  #ax = newvl = b | newvl
movzwl %ax, %eax  #eax = newvl = (unsigned)newvl
cmpl $26, %eax
jg DOWHILE

popl %ebx
movl %ebp, %esp
popl %ebp
ret

