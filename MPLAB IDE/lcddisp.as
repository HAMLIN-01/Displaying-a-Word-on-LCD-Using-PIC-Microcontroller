opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 16 "C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
	psect config,class=CONFIG,delta=2 ;#
# 16 "C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFFF & 0xFFFF & 0xFF7F & 0xFFFF & 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_cmd
	FNCALL	_main,_show
	FNCALL	_show,_dat
	FNCALL	_lcd_init,_cmd
	FNROOT	_main
	global	_j
	global	_PORTD
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:
_PORTD	set	8
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_TRISD
_TRISD	set	136
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	87	;'W'
	retlw	69	;'E'
	retlw	76	;'L'
	retlw	67	;'C'
	retlw	79	;'O'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	79	;'O'
	retlw	32	;' '
	retlw	73	;'I'
	retlw	80	;'P'
	retlw	67	;'C'
	retlw	83	;'S'
	retlw	0
psect	strings
	file	"lcddisp.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_j:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_cmd
?_cmd:	; 0 bytes @ 0x0
	global	??_cmd
??_cmd:	; 0 bytes @ 0x0
	global	?_show
?_show:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_dat
?_dat:	; 0 bytes @ 0x0
	global	??_dat
??_dat:	; 0 bytes @ 0x0
	global	cmd@a
cmd@a:	; 1 bytes @ 0x0
	global	dat@b
dat@b:	; 1 bytes @ 0x0
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x1
	global	??_show
??_show:	; 0 bytes @ 0x1
	ds	1
	global	show@s
show@s:	; 1 bytes @ 0x2
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x3
	global	main@i
main@i:	; 2 bytes @ 0x3
	ds	2
;;Data sizes: Strings 16, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       7
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; show@s	PTR unsigned char  size(1) Largest target is 16
;;		 -> STR_1(CODE[16]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_show
;;   _show->_dat
;;   _lcd_init->_cmd
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     135
;;                                              3 COMMON     2     2      0
;;                           _lcd_init
;;                                _cmd
;;                               _show
;; ---------------------------------------------------------------------------------
;; (1) _show                                                 2     2      0      45
;;                                              1 COMMON     2     2      0
;;                                _dat
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      15
;;                                _cmd
;; ---------------------------------------------------------------------------------
;; (2) _dat                                                  1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _cmd                                                  1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _cmd
;;   _cmd
;;   _show
;;     _dat
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       7       1       50.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       7       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       9      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 19 in file "C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    3[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_init
;;		_cmd
;;		_show
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
	line	19
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	21
	
l1904:	
;displcd.c: 20: unsigned int i;
;displcd.c: 21: TRISD=TRISC0=TRISC1=TRISC2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	bcf	(1081/8)^080h,(1081)&7
	bcf	(1080/8)^080h,(1080)&7
	movlw	0
	btfsc	(1080/8)^080h,(1080)&7
	movlw	1
	movwf	(136)^080h	;volatile
	line	22
	
l1906:	
;displcd.c: 22: lcd_init();
	fcall	_lcd_init
	line	23
	
l1908:	
;displcd.c: 23: cmd(0x80);
	movlw	(080h)
	fcall	_cmd
	line	24
	
l1910:	
;displcd.c: 24: show("WELCOME TO IPCS");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_show
	goto	l1912
	line	25
;displcd.c: 25: while(1) {
	
l693:	
	line	26
	
l1912:	
;displcd.c: 26: for(i=0;i<15000;i++);
	clrf	(main@i)
	clrf	(main@i+1)
	
l1914:	
	movlw	high(03A98h)
	subwf	(main@i+1),w
	movlw	low(03A98h)
	skipnz
	subwf	(main@i),w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l1918
u2190:
	goto	l1920
	
l1916:	
	goto	l1920
	
l694:	
	
l1918:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	movlw	high(03A98h)
	subwf	(main@i+1),w
	movlw	low(03A98h)
	skipnz
	subwf	(main@i),w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l1918
u2200:
	goto	l1920
	
l695:	
	line	27
	
l1920:	
;displcd.c: 27: cmd(0x18);
	movlw	(018h)
	fcall	_cmd
	line	28
	
l1922:	
;displcd.c: 28: for(i=0;i<15000;i++);
	clrf	(main@i)
	clrf	(main@i+1)
	
l1924:	
	movlw	high(03A98h)
	subwf	(main@i+1),w
	movlw	low(03A98h)
	skipnz
	subwf	(main@i),w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l1928
u2210:
	goto	l1912
	
l1926:	
	goto	l1912
	
l696:	
	
l1928:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	movlw	high(03A98h)
	subwf	(main@i+1),w
	movlw	low(03A98h)
	skipnz
	subwf	(main@i),w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l1928
u2220:
	goto	l1912
	
l697:	
	goto	l1912
	line	30
	
l698:	
	line	25
	goto	l1912
	
l699:	
	line	31
	
l700:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_show
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:

;; *************** function _show *****************
;; Defined at:
;;		line 62 in file "C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> STR_1(16), 
;; Auto vars:     Size  Location     Type
;;  s               1    2[COMMON] PTR unsigned char 
;;		 -> STR_1(16), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_dat
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text85
	file	"C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
	line	62
	global	__size_of_show
	__size_of_show	equ	__end_of_show-_show
	
_show:	
	opt	stack 6
; Regs used in _show: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;show@s stored from wreg
	movwf	(show@s)
	line	63
	
l1896:	
;displcd.c: 63: while(*s) {
	goto	l1902
	
l717:	
	line	64
	
l1898:	
;displcd.c: 64: dat(*s++);
	movf	(show@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_dat
	
l1900:	
	movlw	(01h)
	movwf	(??_show+0)+0
	movf	(??_show+0)+0,w
	addwf	(show@s),f
	goto	l1902
	line	65
	
l716:	
	line	63
	
l1902:	
	movf	(show@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2181
	goto	u2180
u2181:
	goto	l1898
u2180:
	goto	l719
	
l718:	
	line	66
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_show
	__end_of_show:
;; =============== function _show ends ============

	signat	_show,4216
	global	_lcd_init
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 34 in file "C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text86
	file	"C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
	line	34
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 6
; Regs used in _lcd_init: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	35
	
l1894:	
;displcd.c: 35: cmd(0x38);
	movlw	(038h)
	fcall	_cmd
	line	36
;displcd.c: 36: cmd(0x0c);
	movlw	(0Ch)
	fcall	_cmd
	line	37
;displcd.c: 37: cmd(0x06);
	movlw	(06h)
	fcall	_cmd
	line	38
;displcd.c: 38: cmd(0x80);
	movlw	(080h)
	fcall	_cmd
	line	39
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_dat
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:

;; *************** function _dat *****************
;; Defined at:
;;		line 52 in file "C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
;; Parameters:    Size  Location     Type
;;  b               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  b               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_show
;; This function uses a non-reentrant model
;;
psect	text87
	file	"C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
	line	52
	global	__size_of_dat
	__size_of_dat	equ	__end_of_dat-_dat
	
_dat:	
	opt	stack 6
; Regs used in _dat: [wreg+status,2+btemp+1]
;dat@b stored from wreg
	movwf	(dat@b)
	line	53
	
l1110:	
;displcd.c: 53: PORTD=b;
	movf	(dat@b),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	54
	
l1112:	
;displcd.c: 54: RC0=1;
	bsf	(56/8),(56)&7
	line	55
	
l1114:	
;displcd.c: 55: RC1=0;
	bcf	(57/8),(57)&7
	line	56
	
l1116:	
;displcd.c: 56: RC2=1;
	bsf	(58/8),(58)&7
	line	57
	
l1118:	
;displcd.c: 57: for(j=0;j<1000;j++);
	clrf	(_j)
	clrf	(_j+1)
	
l1120:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u35
	movlw	low(03E8h)
	subwf	(_j),w
u35:

	skipc
	goto	u31
	goto	u30
u31:
	goto	l1124
u30:
	goto	l712
	
l1122:	
	goto	l712
	
l711:	
	
l1124:	
	movlw	low(01h)
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	
l1126:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u45
	movlw	low(03E8h)
	subwf	(_j),w
u45:

	skipc
	goto	u41
	goto	u40
u41:
	goto	l1124
u40:
	
l712:	
	line	58
;displcd.c: 58: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	59
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_dat
	__end_of_dat:
;; =============== function _dat ends ============

	signat	_dat,4216
	global	_cmd
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:

;; *************** function _cmd *****************
;; Defined at:
;;		line 42 in file "C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text88
	file	"C:\Users\HP\OneDrive\Documents\PIC\LCD\displcd.c"
	line	42
	global	__size_of_cmd
	__size_of_cmd	equ	__end_of_cmd-_cmd
	
_cmd:	
	opt	stack 7
; Regs used in _cmd: [wreg+status,2+btemp+1]
;cmd@a stored from wreg
	movwf	(cmd@a)
	line	43
	
l1092:	
;displcd.c: 43: PORTD=a;
	movf	(cmd@a),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	44
	
l1094:	
;displcd.c: 44: RC0=0;
	bcf	(56/8),(56)&7
	line	45
	
l1096:	
;displcd.c: 45: RC1=0;
	bcf	(57/8),(57)&7
	line	46
	
l1098:	
;displcd.c: 46: RC2=1;
	bsf	(58/8),(58)&7
	line	47
	
l1100:	
;displcd.c: 47: for(j=0;j<1000;j++);
	clrf	(_j)
	clrf	(_j+1)
	
l1102:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u15
	movlw	low(03E8h)
	subwf	(_j),w
u15:

	skipc
	goto	u11
	goto	u10
u11:
	goto	l1106
u10:
	goto	l707
	
l1104:	
	goto	l707
	
l706:	
	
l1106:	
	movlw	low(01h)
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	
l1108:	
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u25
	movlw	low(03E8h)
	subwf	(_j),w
u25:

	skipc
	goto	u21
	goto	u20
u21:
	goto	l1106
u20:
	
l707:	
	line	48
;displcd.c: 48: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	49
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_cmd
	__end_of_cmd:
;; =============== function _cmd ends ============

	signat	_cmd,4216
psect	text89,local,class=CODE,delta=2
global __ptext89
__ptext89:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
