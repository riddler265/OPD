ORG 0x0

;VECTORS
V0: WORD $FUNC, 0x0180
V1: WORD $FUNC1, 0x0180

ORG 0x51
X:       WORD 1

BIGGEST: WORD 0x003D
LOWEST:  WORD 0xFFBE


ORG 0x10

START:
    LD #8
    OUT 3
    LD #9
    OUT 5

MAIN: EI
    LD X
    SUB #3
    ST X
    HLT         ; Точка остановки после уменьшения АС на 3 (16)
    CALL ODZ
    NOP         ; точка останова: X после проверки ОДЗ (19)
    BR MAIN

ODZ:
    LD X
    CMP BIGGEST
    BGE SET_BIGGEST
    LD X
    CMP LOWEST
    BLT SET_BIGGEST
    RET

SET_BIGGEST:
    LD BIGGEST
    ST X
    NOP         ; точка останова: X вышел за ОДЗ, записан BIGGEST (24)
    RET

FUNC:
    LD X
    ASL
    NEG
    SUB #6
    ST X
    HLT         ; точка останова: результат F(X) в AC до проверки ОДЗ
    CALL ODZ
    LD X
    OUT 2
    HLT         ; точка останова: значение выведено на ВУ-1
    IRET

FUNC1:
    IN 4
    OR X
    NOT
    ST X
    NOP         ; точка останова: результат (DR OR X) NOT в AC
    CALL ODZ
    NOP         ; точка останова: X после проверки ОДЗ в обработчике ВУ-2
    IRET