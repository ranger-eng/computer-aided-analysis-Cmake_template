      DOUBLE PRECISION FUNCTION D1MACH(I)
C
C  DOUBLE-PRECISION MACHINE CONSTANTS
C
C  D1MACH( 1) = B**(EMIN-1), THE SMALLEST POSITIVE MAGNITUDE.
C
C  D1MACH( 2) = B**EMAX*(1 - B**(-T)), THE LARGEST MAGNITUDE.
C
C  D1MACH( 3) = B**(-T), THE SMALLEST RELATIVE SPACING.
C
C  D1MACH( 4) = B**(1-T), THE LARGEST RELATIVE SPACING.
C
C  D1MACH( 5) = LOG10(B)
C
C  TO ALTER THIS FUNCTION FOR A PARTICULAR ENVIRONMENT,
C  THE DESIRED SET OF DATA STATEMENTS SHOULD BE ACTIVATED BY
C  REMOVING THE C FROM COLUMN 1.
C
C  WHERE POSSIBLE, OCTAL OR HEXADECIMAL CONSTANTS HAVE BEEN USED
C  TO SPECIFY THE CONSTANTS EXACTLY WHICH HAS IN SOME CASES
C  REQUIRED THE USE OF EQUIVALENT INTEGER ARRAYS.
C
C----- modification by charles thompson 3-10-87 ULOWELL
      INTEGER SMALL(2)
      INTEGER LARGE(2)
      INTEGER RIGHT(2)
      INTEGER DIVER(2)
      INTEGER LOG10(2)
C
C     INTEGER SMALL(4)
C     INTEGER LARGE(4)
C     INTEGER RIGHT(4)
C     INTEGER DIVER(4)
C     INTEGER LOG10(4)
C----- end modification by charles thompson 3-10-87 ULOWELL
C
      DOUBLE PRECISION DMACH(5)
C
      EQUIVALENCE (DMACH(1),SMALL(1))
      EQUIVALENCE (DMACH(2),LARGE(1))
      EQUIVALENCE (DMACH(3),RIGHT(1))
      EQUIVALENCE (DMACH(4),DIVER(1))
      EQUIVALENCE (DMACH(5),LOG10(1))
C
C----- modification by charles thompson 3-10-87 ULOWELL
C     MACHINE CONSTANTS FOR THE ALLIANT FX-8
C     FORTRAN-77 COMPILER
c      data SMALL(1), SMALL(2)  /  803209216,           0/
c      data LARGE(1), LARGE(2)  / 1341128704,           0/
c      data RIGHT(1), RIGHT(2)  / 1017118720,           0/
c      data DIVER(1), DIVER(2)  / 1018167296,           0/
c      data LOG10(1), LOG10(2)  / 1070810131,  1352628735/
C
C     Machine constants for IEEE arithmetic machines and 8087-based
C     micros, such as the IBM PC and AT&T 6300, in which the least
C     significant byte is stored first.
C
c      DATA SMALL(1),SMALL(2) /     1048576,          0 /
c      DATA LARGE(1),LARGE(2) /  2146435071,         -1 /
c      DATA RIGHT(1),RIGHT(2) /  1017118720,          0  /
c      DATA DIVER(1),DIVER(2) /  1018167296,          0 /
c      DATA LOG10(1),LOG10(2) /  1070810131, 1352628735 /
C
C     MACHINE CONSTANTS FOR THE ALLIANT FX-2800
      DATA SMALL(1),SMALL(2) /  0,	2097152/
      DATA LARGE(1),LARGE(2) /  0,	2145386496/
      DATA RIGHT(1),RIGHT(2) /  0,	1017118720/
      DATA DIVER(1),DIVER(2) /  0,      1018167296/
      DATA LOG10(1),LOG10(2) /1352628735, 1070810131/

C
C
C     MACHINE CONSTANTS FOR THE DATA GENERAL MV-100000.
C
C      data SMALL(1),SMALL(2) /  17825792,           0/
C 	data LARGE(1),LARGE(2) /2130706431,          -1/
C	data RIGHT(1),RIGHT(2) / 856686592,           0/
C	data DIVER(1),DIVER(2) / 873463808,           0/
C	data LOG10(1),LOG10(2) /1091781651,  1352628734/
C
C----- end modification by charles thompson 3-10-87 ULOWELL
C
C     MACHINE CONSTANTS FOR THE BURROUGHS 1700 SYSTEM.
C
C      DATA SMALL(1) / ZC00800000 /
C      DATA SMALL(2) / Z000000000 /
C
C      DATA LARGE(1) / ZDFFFFFFFF /
C      DATA LARGE(2) / ZFFFFFFFFF /
C
C      DATA RIGHT(1) / ZCC5800000 /
C      DATA RIGHT(2) / Z000000000 /
C
C      DATA DIVER(1) / ZCC6800000 /
C      DATA DIVER(2) / Z000000000 /
C
C      DATA LOG10(1) / ZD00E730E7 /
C      DATA LOG10(2) / ZC77800DC0 /
C
C     MACHINE CONSTANTS FOR THE BURROUGHS 5700 SYSTEM.
C
C      DATA SMALL(1) / O1771000000000000 /
C      DATA SMALL(2) / O0000000000000000 /
C
C      DATA LARGE(1) / O0777777777777777 /
C      DATA LARGE(2) / O0007777777777777 /
C
C      DATA RIGHT(1) / O1461000000000000 /
C      DATA RIGHT(2) / O0000000000000000 /
C
C      DATA DIVER(1) / O1451000000000000 /
C      DATA DIVER(2) / O0000000000000000 /
C
C      DATA LOG10(1) / O1157163034761674 /
C      DATA LOG10(2) / O0006677466732724 /
C
C     MACHINE CONSTANTS FOR THE BURROUGHS 6700/7700 SYSTEMS.
C
C      DATA SMALL(1) / O1771000000000000 /
C      DATA SMALL(2) / O7770000000000000 /
C
C      DATA LARGE(1) / O0777777777777777 /
C      DATA LARGE(2) / O7777777777777777 /
C
C      DATA RIGHT(1) / O1461000000000000 /
C      DATA RIGHT(2) / O0000000000000000 /
C
C      DATA DIVER(1) / O1451000000000000 /
C      DATA DIVER(2) / O0000000000000000 /
C
C      DATA LOG10(1) / O1157163034761674 /
C      DATA LOG10(2) / O0006677466732724 /
C
C     MACHINE CONSTANTS FOR THE CDC 6000/7000 SERIES.
C
C      DATA SMALL(1) / 00604000000000000000B /
C      DATA SMALL(2) / 00000000000000000000B /
C
C      DATA LARGE(1) / 37767777777777777777B /
C      DATA LARGE(2) / 37167777777777777777B /
C
C      DATA RIGHT(1) / 15604000000000000000B /
C      DATA RIGHT(2) / 15000000000000000000B /
C
C      DATA DIVER(1) / 15614000000000000000B /
C      DATA DIVER(2) / 15010000000000000000B /
C
C      DATA LOG10(1) / 17164642023241175717B /
C      DATA LOG10(2) / 16367571421742254654B /
C
C     MACHINE CONSTANTS FOR THE CRAY 1
C
C      DATA SMALL(1) / 201354000000000000000B /
C      DATA SMALL(2) / 000000000000000000000B /
C
C      DATA LARGE(1) / 577767777777777777777B /
C      DATA LARGE(2) / 000007777777777777776B /
C
C      DATA RIGHT(1) / 376434000000000000000B /
C      DATA RIGHT(2) / 000000000000000000000B /
C
C      DATA DIVER(1) / 376444000000000000000B /
C      DATA DIVER(2) / 000000000000000000000B /
C
C      DATA LOG10(1) / 377774642023241175717B /
C      DATA LOG10(2) / 000007571421742254654B /
C
C     MACHINE CONSTANTS FOR THE DATA GENERAL ECLIPSE S/200
C
C     NOTE - IT MAY BE APPROPRIATE TO INCLUDE THE FOLLOWING CARD -
C     STATIC DMACH(5)
C
C      DATA SMALL/20K,3*0/,LARGE/77777K,3*177777K/
C      DATA RIGHT/31420K,3*0/,DIVER/32020K,3*0/
C      DATA LOG10/40423K,42023K,50237K,74776K/
C
C     MACHINE CONSTANTS FOR THE HARRIS SLASH 6 AND SLASH 7
C
C      DATA SMALL(1),SMALL(2) / '20000000, '00000201 /
C      DATA LARGE(1),LARGE(2) / '37777777, '37777577 /
C      DATA RIGHT(1),RIGHT(2) / '20000000, '00000333 /
C      DATA DIVER(1),DIVER(2) / '20000000, '00000334 /
C      DATA LOG10(1),LOG10(2) / '23210115, '10237777 /
C
C     MACHINE CONSTANTS FOR THE HONEYWELL DPS 8/70 SERIES.
C
C      DATA SMALL(1),SMALL(2) / O402400000000, O000000000000 /
C      DATA LARGE(1),LARGE(2) / O376777777777, O777777777777 /
C      DATA RIGHT(1),RIGHT(2) / O604400000000, O000000000000 /
C      DATA DIVER(1),DIVER(2) / O606400000000, O000000000000 /
C      DATA LOG10(1),LOG10(2) / O776464202324, O117571775714 /
C
C     MACHINE CONSTANTS FOR AT&T 3B SERIES MACHINES.
C
C      DATA SMALL(1),SMALL(2) /    1048576,          0 /
C      DATA LARGE(1),LARGE(2) / 2146435071,         -1 /
C      DATA RIGHT(1),RIGHT(2) / 1017118720,          0 /
C      DATA DIVER(1),DIVER(2) / 1018167296,          0 /
C      DATA LOG10(1),LOG10(2) / 1070810131, 1352628735 /
C
C     MACHINE CONSTANTS FOR THE IBM PC AND OTHER 8087-ARITHMETIC MICROS
C
C      DATA SMALL(1),SMALL(2) /          0,    1048576 /
C      DATA LARGE(1),LARGE(2) /         -1, 2146435071 /
C      DATA RIGHT(1),RIGHT(2) /          0, 1017118720 /
C      DATA DIVER(1),DIVER(2) /          0, 1018167296 /
C      DATA LOG10(1),LOG10(2) / 1352628735, 1070810131 /
C
C     MACHINE CONSTANTS FOR THE IBM 360/370 SERIES,
C     THE XEROX SIGMA 5/7/9 AND THE SEL SYSTEMS 85/86.
C
C      DATA SMALL(1),SMALL(2) / Z00100000, Z00000000 /
C      DATA LARGE(1),LARGE(2) / Z7FFFFFFF, ZFFFFFFFF /
C      DATA RIGHT(1),RIGHT(2) / Z33100000, Z00000000 /
C      DATA DIVER(1),DIVER(2) / Z34100000, Z00000000 /
C      DATA LOG10(1),LOG10(2) / Z41134413, Z509F79FF /
C
C     MACHINE CONSTANTS FOR THE INTERDATA 8/32
C     WITH THE UNIX SYSTEM FORTRAN 77 COMPILER.
C
C     FOR THE INTERDATA FORTRAN VII COMPILER REPLACE
C     THE Z'S SPECIFYING HEX CONSTANTS WITH Y'S.
C
C      DATA SMALL(1),SMALL(2) / Z'00100000', Z'00000000' /
C      DATA LARGE(1),LARGE(2) / Z'7EFFFFFF', Z'FFFFFFFF' /
C      DATA RIGHT(1),RIGHT(2) / Z'33100000', Z'00000000' /
C      DATA DIVER(1),DIVER(2) / Z'34100000', Z'00000000' /
C      DATA LOG10(1),LOG10(2) / Z'41134413', Z'509F79FF' /
C
C     MACHINE CONSTANTS FOR THE PDP-10 (KA PROCESSOR).
C
C      DATA SMALL(1),SMALL(2) / "033400000000, "000000000000 /
C      DATA LARGE(1),LARGE(2) / "377777777777, "344777777777 /
C      DATA RIGHT(1),RIGHT(2) / "113400000000, "000000000000 /
C      DATA DIVER(1),DIVER(2) / "114400000000, "000000000000 /
C      DATA LOG10(1),LOG10(2) / "177464202324, "144117571776 /
C
C     MACHINE CONSTANTS FOR THE PDP-10 (KI PROCESSOR).
C
C      DATA SMALL(1),SMALL(2) / "000400000000, "000000000000 /
C      DATA LARGE(1),LARGE(2) / "377777777777, "377777777777 /
C      DATA RIGHT(1),RIGHT(2) / "103400000000, "000000000000 /
C      DATA DIVER(1),DIVER(2) / "104400000000, "000000000000 /
C      DATA LOG10(1),LOG10(2) / "177464202324, "047674776746 /
C
C     MACHINE CONSTANTS FOR PDP-11 FORTRANS SUPPORTING
C     32-BIT INTEGERS (EXPRESSED IN INTEGER AND OCTAL).
C
C      DATA SMALL(1),SMALL(2) /    8388608,           0 /
C      DATA LARGE(1),LARGE(2) / 2147483647,          -1 /
C      DATA RIGHT(1),RIGHT(2) /  612368384,           0 /
C      DATA DIVER(1),DIVER(2) /  620756992,           0 /
C      DATA LOG10(1),LOG10(2) / 1067065498, -2063872008 /
C
C      DATA SMALL(1),SMALL(2) / O00040000000, O00000000000 /
C      DATA LARGE(1),LARGE(2) / O17777777777, O37777777777 /
C      DATA RIGHT(1),RIGHT(2) / O04440000000, O00000000000 /
C      DATA DIVER(1),DIVER(2) / O04500000000, O00000000000 /
C      DATA LOG10(1),LOG10(2) / O07746420232, O20476747770 /
C
C     MACHINE CONSTANTS FOR PDP-11 FORTRANS SUPPORTING
C     16-BIT INTEGERS (EXPRESSED IN INTEGER AND OCTAL).
C
C      DATA SMALL(1),SMALL(2) /    128,      0 /
C      DATA SMALL(3),SMALL(4) /      0,      0 /
C
C      DATA LARGE(1),LARGE(2) /  32767,     -1 /
C      DATA LARGE(3),LARGE(4) /     -1,     -1 /
C
C      DATA RIGHT(1),RIGHT(2) /   9344,      0 /
C      DATA RIGHT(3),RIGHT(4) /      0,      0 /
C
C      DATA DIVER(1),DIVER(2) /   9472,      0 /
C      DATA DIVER(3),DIVER(4) /      0,      0 /
C
C      DATA LOG10(1),LOG10(2) /  16282,   8346 /
C      DATA LOG10(3),LOG10(4) / -31493, -12296 /
C
C      DATA SMALL(1),SMALL(2) / O000200, O000000 /
C      DATA SMALL(3),SMALL(4) / O000000, O000000 /
C
C      DATA LARGE(1),LARGE(2) / O077777, O177777 /
C      DATA LARGE(3),LARGE(4) / O177777, O177777 /
C
C      DATA RIGHT(1),RIGHT(2) / O022200, O000000 /
C      DATA RIGHT(3),RIGHT(4) / O000000, O000000 /
C
C      DATA DIVER(1),DIVER(2) / O022400, O000000 /
C      DATA DIVER(3),DIVER(4) / O000000, O000000 /
C
C      DATA LOG10(1),LOG10(2) / O037632, O020232 /
C      DATA LOG10(3),LOG10(4) / O102373, O147770 /
C
C     MACHINE CONSTANTS FOR THE UNIVAC 1100 SERIES.
C
C      DATA SMALL(1),SMALL(2) / O000040000000, O000000000000 /
C      DATA LARGE(1),LARGE(2) / O377777777777, O777777777777 /
C      DATA RIGHT(1),RIGHT(2) / O170540000000, O000000000000 /
C      DATA DIVER(1),DIVER(2) / O170640000000, O000000000000 /
C      DATA LOG10(1),LOG10(2) / O177746420232, O411757177572 /
C
C     MACHINE CONSTANTS FOR THE VAX UNIX F77 COMPILER
C
C      DATA SMALL(1),SMALL(2) /        128,           0 /
C      DATA LARGE(1),LARGE(2) /     -32769,          -1 /
C      DATA RIGHT(1),RIGHT(2) /       9344,           0 /
C      DATA DIVER(1),DIVER(2) /       9472,           0 /
C      DATA LOG10(1),LOG10(2) /  546979738,  -805796613 /
C
C     MACHINE CONSTANTS FOR THE VAX-11 WITH
C     FORTRAN IV-PLUS COMPILER
C
C      DATA SMALL(1),SMALL(2) / Z00000080, Z00000000 /
C      DATA LARGE(1),LARGE(2) / ZFFFF7FFF, ZFFFFFFFF /
C      DATA RIGHT(1),RIGHT(2) / Z00002480, Z00000000 /
C      DATA DIVER(1),DIVER(2) / Z00002500, Z00000000 /
C      DATA LOG10(1),LOG10(2) / Z209A3F9A, ZCFF884FB /
C
C     MACHINE CONSTANTS FOR VAX/VMS VERSION 2.2
C
C      DATA SMALL(1),SMALL(2) /       '80'X,        '0'X /
C      DATA LARGE(1),LARGE(2) / 'FFFF7FFF'X, 'FFFFFFFF'X /
C      DATA RIGHT(1),RIGHT(2) /     '2480'X,        '0'X /
C      DATA DIVER(1),DIVER(2) /     '2500'X,        '0'X /
C      DATA LOG10(1),LOG10(2) / '209A3F9A'X, 'CFF884FB'X /
C
C     MACHINE CONSTANTS FOR THE SEQUENT BALANCE 8000
C
C      DATA SMALL(1),SMALL(2) / $00000000,  $00100000 /
C      DATA LARGE(1),LARGE(2) / $FFFFFFFF,  $7FEFFFFF /
C      DATA RIGHT(1),RIGHT(2) / $00000000,  $3CA00000 /
C      DATA DIVER(1),DIVER(2) / $00000000,  $3CB00000 /
C      DATA LOG10(1),LOG10(2) / $509F79FF,  $3FD34413 /
C
C     MACHINE CONSTANTS FOR SVS FORTRAN ON THE AT&T 7300 (UNIX PC)
C
C      DATA SMALL(1),SMALL(2) / $00100000, $00000000 /
C      DATA LARGE(1),LARGE(2) / $7FEFFFFF, $FFFFFFFF /
C      DATA RIGHT(1),RIGHT(2) / $3CA00000, $00000000 /
C      DATA DIVER(1),DIVER(2) / $3CB00000, $00000000 /
C      DATA LOG10(1),LOG10(2) / $3FD34413, $509F79FF /
C
C     MACHINE CONSTANTS FOR THE RM FORTRAN ON THE AT&T 7300 (UNIX PC)
C
C      DATA SMALL(1),SMALL(2) / Z'00100000', Z'00000000' /
C      DATA LARGE(1),LARGE(2) / Z'7FEFFFFF', Z'FFFFFFFF' /
C      DATA RIGHT(1),RIGHT(2) / Z'3CA00000', Z'00000000' /
C      DATA DIVER(1),DIVER(2) / Z'3CB00000', Z'00000000' /
C      DATA LOG10(1),LOG10(2) / Z'3FD34413', Z'509F79FF' /
C
C/6S
      IF (I .LT. 1  .OR.  I .GT. 5)
     1   CALL SETERR(24HD1MACH - I OUT OF BOUNDS,24,1,2)
C/7S
C     IF (I .LT. 1  .OR.  I .GT. 5)
C    1   CALL SETERR('D1MACH - I OUT OF BOUNDS',24,1,2)
C/
C
      D1MACH = DMACH(I)
      RETURN
C
      END
