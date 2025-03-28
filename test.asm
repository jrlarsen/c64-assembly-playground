*=$1000

main:
    inc $d020
    dec $d021
    jmp main