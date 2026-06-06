ORG 0x0

;VECTORS
V0: WORD $FUNC, 0x0180
V1: WORD $FUNC1, 0x0180

;X
ORG 0x51
X: WORD -100

;CONDITIONS
BIGGEST: WORD 0x003D
LOWEST:  WORD 0xFFBE


;VECTORS INITIALIZATION
ORG 0x10
START:
    LD #8
    OUT 3
    LD #9
    OUT 5

;PROGRAMM
MAIN: EI
    LD X
    SUB #3
    NOP ;Проверка работоспособности основного цикла
    CALL SAVE_X
    NOP ;Корректность Х
    BR MAIN

;ODZ
SAVE_X:
	CMP BIGGEST
	BGE SET_BIGGEST
	CMP LOWEST
    	BLT SET_BIGGEST
    	ST X
   	RET

SET_BIGGEST:
    LD BIGGEST
    ST X
    RET

;FIRST_INTERRUPT_CONTROLLER
FUNC:
    LD X
    NOP ;Проверка значения Х перед выполнением функции
    ASL
    NEG
    SUB #6
    OUT 2
    NOP ;Результат функции
    IRET

;SECOND_INTERRUPT_CONTROLLER
FUNC1:
	CLA
    	IN 4
    	SXTB
    	NOP ;Расширение знакак значения с ВУ-2
    	OR X
    	NOT
    	NOP ;Логическая операция
    	CALL SAVE_X
    	NOP ;Корректность сохранения
    	IRET