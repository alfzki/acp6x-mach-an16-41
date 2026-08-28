savedcmd_snd-soc-acp6x-mach.mod := printf '%s\n'   acp6x-mach.o | awk '!x[$$0]++ { print("./"$$0) }' > snd-soc-acp6x-mach.mod
