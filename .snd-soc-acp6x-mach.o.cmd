savedcmd_snd-soc-acp6x-mach.o := ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments   -r -o snd-soc-acp6x-mach.o @snd-soc-acp6x-mach.mod  ; /usr/src/kernels/7.1.10-200.fc44.x86_64/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --sls --static-call --uaccess --prefix=16  --link  --module snd-soc-acp6x-mach.o

snd-soc-acp6x-mach.o: $(wildcard /usr/src/kernels/7.1.10-200.fc44.x86_64/tools/objtool/objtool)
