      SUBROUTINE S1MACH
C
C  S1MACH TESTS THE CONSISTENCY OF THE MACHINE CONSTANTS IN
C  I1MACH, R1MACH AND D1MACH.
C
      INTEGER IMACH(16),I1MACH
      INTEGER STDOUT
      INTEGER DIGINT, DIGSP, DIGDP
      REAL RMACH(5),R1MACH
      REAL S2MACH, XR, YR
      REAL SBASE, SBASEM
      REAL ALOG10, SQRT
      DOUBLE PRECISION DLOG10, DSQRT
      DOUBLE PRECISION DMACH(5),D1MACH
      DOUBLE PRECISION S3MACH, XD, YD
      DOUBLE PRECISION DBASE, DBASEM
C
C/6S
      INTEGER IFMT(12)
      INTEGER EFMT(15)
      INTEGER DFMT(15)
      INTEGER CCPLUS
C/7S
C     CHARACTER*1 IFMT1(12), EFMT1(15), DFMT1(15), CCPLUS
C     CHARACTER*12 IFMT
C     CHARACTER*15 EFMT, DFMT
C     EQUIVALENCE (IFMT1(1),IFMT), (EFMT1(1),EFMT), (DFMT1(1),DFMT)
C/
      INTEGER DWIDTH, WWIDTH, EWIDTH
      INTEGER DEMAX, DEMIN
C
      EQUIVALENCE ( STDOUT, IMACH(2) )
      EQUIVALENCE ( DIGINT, IMACH(8) )
      EQUIVALENCE ( DIGSP,  IMACH(11) )
      EQUIVALENCE ( DIGDP,  IMACH(14) )
C
C/6S
      DATA CCPLUS   / 1H+ /
C/7S
C     DATA CCPLUS   / '+' /
C/
C
C/6S
      DATA IFMT(1 ) / 1H( /
      DATA IFMT(2 ) / 1HA /
      DATA IFMT(3 ) / 1H1 /
      DATA IFMT(4 ) / 1H, /
      DATA IFMT(5 ) / 1H5 /
      DATA IFMT(6 ) / 1H1 /
      DATA IFMT(7 ) / 1HX /
      DATA IFMT(8 ) / 1H, /
      DATA IFMT(9 ) / 1HI /
      DATA IFMT(10) / 1H  /
      DATA IFMT(11) / 1H  /
      DATA IFMT(12) / 1H) /
C/7S
C     DATA IFMT1(1 ) / '(' /
C     DATA IFMT1(2 ) / 'A' /
C     DATA IFMT1(3 ) / '1' /
C     DATA IFMT1(4 ) / ',' /
C     DATA IFMT1(5 ) / '5' /
C     DATA IFMT1(6 ) / '1' /
C     DATA IFMT1(7 ) / 'X' /
C     DATA IFMT1(8 ) / ',' /
C     DATA IFMT1(9 ) / 'I' /
C     DATA IFMT1(10) / ' ' /
C     DATA IFMT1(11) / ' ' /
C     DATA IFMT1(12) / ')' /
C/
C
C/6S
      DATA EFMT( 1) / 1H( /,    DFMT( 1) / 1H( /
      DATA EFMT( 2) / 1HA /,    DFMT( 2) / 1HA /
      DATA EFMT( 3) / 1H1 /,    DFMT( 3) / 1H1 /
      DATA EFMT( 4) / 1H, /,    DFMT( 4) / 1H, /
      DATA EFMT( 5) / 1H3 /,    DFMT( 5) / 1H3 /
      DATA EFMT( 6) / 1H2 /,    DFMT( 6) / 1H2 /
      DATA EFMT( 7) / 1HX /,    DFMT( 7) / 1HX /
      DATA EFMT( 8) / 1H, /,    DFMT( 8) / 1H, /
      DATA EFMT( 9) / 1HE /,    DFMT( 9) / 1HD /
      DATA EFMT(10) / 1H  /,    DFMT(10) / 1H  /
      DATA EFMT(11) / 1H  /,    DFMT(11) / 1H  /
      DATA EFMT(12) / 1H. /,    DFMT(12) / 1H. /
      DATA EFMT(13) / 1H  /,    DFMT(13) / 1H  /
      DATA EFMT(14) / 1H  /,    DFMT(14) / 1H  /
      DATA EFMT(15) / 1H) /,    DFMT(15) / 1H) /
C/7S
C     DATA EFMT1( 1) / '(' /,    DFMT1( 1) / '(' /
C     DATA EFMT1( 2) / 'A' /,    DFMT1( 2) / 'A' /
C     DATA EFMT1( 3) / '1' /,    DFMT1( 3) / '1' /
C     DATA EFMT1( 4) / ',' /,    DFMT1( 4) / ',' /
C     DATA EFMT1( 5) / '3' /,    DFMT1( 5) / '3' /
C     DATA EFMT1( 6) / '2' /,    DFMT1( 6) / '2' /
C     DATA EFMT1( 7) / 'X' /,    DFMT1( 7) / 'X' /
C     DATA EFMT1( 8) / ',' /,    DFMT1( 8) / ',' /
C     DATA EFMT1( 9) / 'E' /,    DFMT1( 9) / 'D' /
C     DATA EFMT1(10) / ' ' /,    DFMT1(10) / ' ' /
C     DATA EFMT1(11) / ' ' /,    DFMT1(11) / ' ' /
C     DATA EFMT1(12) / '.' /,    DFMT1(12) / '.' /
C     DATA EFMT1(13) / ' ' /,    DFMT1(13) / ' ' /
C     DATA EFMT1(14) / ' ' /,    DFMT1(14) / ' ' /
C     DATA EFMT1(15) / ')' /,    DFMT1(15) / ')' /
C/
C
C  FETCH ALL CONSTANTS INTO LOCAL ARRAYS
C
      DO 10 I = 1,16
        IMACH(I) = I1MACH(I)
 10     CONTINUE
C
      DO 20 I = 1,5
        RMACH(I) = R1MACH(I)
        DMACH(I) = D1MACH(I)
 20     CONTINUE
C
C  COMPUTE NUMBER OF CHARACTER POSITIONS NEEDED FOR WRITING
C  OUT THE LARGEST INTEGER ALLOWING FOR ONE SPACE AND A SIGN
C  AND PLUG THE FIELD WIDTH IN THE FORMAT.
C
      WWIDTH = ICEIL( ALOG10(FLOAT(IMACH(7)))*FLOAT(IMACH(8)) ) + 2
C/6S
      CALL S88FMT( 2, WWIDTH, IFMT(10) )
      WRITE( STDOUT, 900 ) ( IFMT(I), I = 9, 11 )
C/7S
C     CALL S88FMT( 2, WWIDTH, IFMT1(10) )
C     WRITE( STDOUT, 900 ) ( IFMT1(I), I = 9, 11 )
C/
 900  FORMAT(//37H FORMAT CONVERSION FOR INTEGERS IS - ,3A1
     1       / 25H INTEGER CONSTANTS FOLLOW///)
C
C  NOW WRITE OUT THE INTEGER CONSTANTS
C
      WRITE( STDOUT, 1001 )
 1001 FORMAT(24H THE STANDARD INPUT UNIT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(1)
C
      WRITE( STDOUT, 1002 )
 1002 FORMAT(25H THE STANDARD OUTPUT UNIT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(2)
C
      WRITE( STDOUT, 1003 )
 1003 FORMAT(24H THE STANDARD PUNCH UNIT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(3)
C
      WRITE( STDOUT, 1004 )
 1004 FORMAT(32H THE STANDARD ERROR MESSAGE UNIT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(4)
C
      WRITE( STDOUT, 1005 )
 1005 FORMAT(28H THE NUMBER OF BITS PER WORD)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(5)
C
      WRITE( STDOUT, 1006 )
 1006 FORMAT(34H THE NUMBER OF CHARACTERS PER WORD)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(6)
C
      WRITE( STDOUT, 1007 )
 1007 FORMAT(34H A, THE BASE OF AN S-DIGIT INTEGER)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(7)
C
      WRITE( STDOUT, 1008 )
 1008 FORMAT(31H S, THE NUMBER OF BASE-A DIGITS)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(8)
C
      WRITE( STDOUT, 1009 )
 1009 FORMAT(32H A**S - 1, THE LARGEST MAGNITUDE)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(9)
C
      WRITE( STDOUT, 1010 )
 1010 FORMAT(47H B, THE BASE OF A T-DIGIT FLOATING-POINT NUMBER)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(10)
C
      WRITE( STDOUT, 1011 )
 1011 FORMAT(51H T, THE NUMBER OF BASE-B DIGITS IN SINGLE-PRECISION)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(11)
C
      WRITE( STDOUT, 1012 )
 1012 FORMAT(45H EMIN, THE SMALLEST SINGLE-PRECISION EXPONENT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(12)
C
      WRITE( STDOUT, 1013 )
 1013 FORMAT(44H EMAX, THE LARGEST SINGLE-PRECISION EXPONENT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(13)
C
      WRITE( STDOUT, 1014 )
 1014 FORMAT(51H T, THE NUMBER OF BASE-B DIGITS IN DOUBLE-PRECISION)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(14)
C
      WRITE( STDOUT, 1015 )
 1015 FORMAT(45H EMIN, THE SMALLEST DOUBLE-PRECISION EXPONENT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(15)
C
      WRITE( STDOUT, 1016 )
 1016 FORMAT(44H EMAX, THE LARGEST DOUBLE-PRECISION EXPONENT)
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(16)
C
C  COMPUTE THE NUMBER OF CHARACTER POSITIONS NEEDED FOR WRITING
C  OUT A SINGLE-PRECISION NUMBER ALLOWING FOR ONE SPACE AND
C  A SIGN AND PLUG THE FIELDS IN THE FORMAT.
C
      DWIDTH = ICEIL( ALOG10(FLOAT(IMACH(10)))*FLOAT(IMACH(11)) )
C/6S
      CALL S88FMT( 2, DWIDTH, EFMT(13) )
C/7S
C     CALL S88FMT( 2, DWIDTH, EFMT1(13) )
C/
      DEMIN =  IFLR( ALOG10(FLOAT(IMACH(10)))*FLOAT(IMACH(12)-1) ) + 1
      DEMAX = ICEIL( ALOG10(FLOAT(IMACH(10)))*FLOAT(IMACH(13)) )
      EWIDTH = IFLR( ALOG10(FLOAT(MAX0(IABS(DEMIN),IABS(DEMAX)))) ) + 1
      WWIDTH = DWIDTH + EWIDTH + 6
C/6S
      CALL S88FMT( 2, WWIDTH, EFMT(10) )
      WRITE( STDOUT, 1900 ) ( EFMT(I), I = 9, 14 )
C/7S
C     CALL S88FMT( 2, WWIDTH, EFMT1(10) )
C     WRITE( STDOUT, 1900 ) ( EFMT1(I), I = 9, 14 )
C/
 1900 FORMAT(//45H FORMAT CONVERSION FOR SINGLE-PRECISION IS - ,6A1
     1       / 34H SINGLE-PRECISION CONSTANTS FOLLOW///)
C
C  NOW WRITE OUT THE SINGLE-PRECISION CONSTANTS
C
      WRITE( STDOUT, 2001 )
 2001 FORMAT(32H THE SMALLEST POSITIVE MAGNITUDE)
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(1)
C
      WRITE( STDOUT, 2002 )
 2002 FORMAT(22H THE LARGEST MAGNITUDE)
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(2)
C
      WRITE( STDOUT, 2003 )
 2003 FORMAT(30H THE SMALLEST RELATIVE SPACING)
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(3)
C
      WRITE( STDOUT, 2004 )
 2004 FORMAT(29H THE LARGEST RELATIVE SPACING)
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(4)
C
      WRITE( STDOUT, 2005 )
 2005 FORMAT(18H LOG10 OF THE BASE)
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(5)
C/6S
      CALL S88FMT( 2, WWIDTH+1, EFMT(10) )
      CALL S88FMT( 2, DWIDTH+1, EFMT(13) )
C/7S
C     CALL S88FMT( 2, WWIDTH+1, EFMT1(10) )
C     CALL S88FMT( 2, DWIDTH+1, EFMT1(13) )
C/
C  COMPUTE THE NUMBER OF CHARACTER POSITIONS NEEDED FOR WRITING
C  OUT A DOUBLE-PRECISION NUMBER ALLOWING FOR ONE SPACE AND
C  A SIGN AND PLUG THE FIELDS IN THE FORMAT.
C
      DWIDTH = ICEIL( ALOG10(FLOAT(IMACH(10)))*FLOAT(IMACH(14)) )
C/6S
      CALL S88FMT( 2, DWIDTH, DFMT(13) )
C/7S
C     CALL S88FMT( 2, DWIDTH, DFMT1(13) )
C/
      DEMIN =  IFLR( ALOG10(FLOAT(IMACH(10)))*FLOAT(IMACH(15)-1) ) + 1
      DEMAX = ICEIL( ALOG10(FLOAT(IMACH(10)))*FLOAT(IMACH(16)) )
      EWIDTH = IFLR( ALOG10(FLOAT(MAX0(IABS(DEMIN),IABS(DEMAX)))) ) + 1
      WWIDTH = DWIDTH + EWIDTH + 6
C/6S
      CALL S88FMT( 2, WWIDTH, DFMT(10) )
      WRITE( STDOUT, 2900 ) ( DFMT(I), I = 9, 14 )
C/7S
C     CALL S88FMT( 2, WWIDTH, DFMT1(10) )
C     WRITE( STDOUT, 2900 ) ( DFMT1(I), I = 9, 14 )
C/
 2900 FORMAT(//45H FORMAT CONVERSION FOR DOUBLE-PRECISION IS - ,6A1
     1       / 34H DOUBLE-PRECISION CONSTANTS FOLLOW///)
C
C  NOW WRITE OUT THE DOUBLE-PRECISION CONSTANTS
C
      WRITE( STDOUT, 3001 )
 3001 FORMAT(32H THE SMALLEST POSITIVE MAGNITUDE)
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(1)
C
      WRITE( STDOUT, 3002 )
 3002 FORMAT(22H THE LARGEST MAGNITUDE)
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(2)
C
      WRITE( STDOUT, 3003 )
 3003 FORMAT(30H THE SMALLEST RELATIVE SPACING)
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(3)
C
      WRITE( STDOUT, 3004 )
 3004 FORMAT(29H THE LARGEST RELATIVE SPACING)
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(4)
C
      WRITE( STDOUT, 3005 )
 3005 FORMAT(18H LOG10 OF THE BASE)
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(5)
C/6S
      CALL S88FMT( 2, WWIDTH+1, DFMT(10) )
      CALL S88FMT( 2, DWIDTH+1, DFMT(13) )
C/7S
C     CALL S88FMT( 2, WWIDTH+1, DFMT1(10) )
C     CALL S88FMT( 2, DWIDTH+1, DFMT1(13) )
C/
C  NOW CHECK CONSISTENCY OF INTEGER CONSTANTS
C/6S
      CALL S88FMT( 2, 14, IFMT(5) )
C/7S
C     CALL S88FMT( 2, 14, IFMT1(5) )
C/
      IF( IMACH(11) .LE. IMACH(14) ) GOTO 4009
      WRITE( STDOUT, 4001 )
 4001 FORMAT(30H0I1MACH(11) EXCEEDS I1MACH(14) )
      WRITE( STDOUT, 4002 )
 4002 FORMAT(13H I1MACH(11) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(11)
      WRITE( STDOUT, 4003 )
 4003 FORMAT(13H I1MACH(14) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(14)
 4009 CONTINUE
C
      IF( IMACH(13) .LE. IMACH(16) ) GOTO 4019
      WRITE( STDOUT, 4011 )
 4011 FORMAT(40H0WARNING - I1MACH(13) EXCEEDS I1MACH(16) )
      WRITE( STDOUT, 4012 )
 4012 FORMAT(13H I1MACH(13) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(13)
      WRITE( STDOUT, 4013 )
 4013 FORMAT(13H I1MACH(16) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(16)
 4019 CONTINUE
C
      IF( IMACH(16)-IMACH(15) .GE. IMACH(13)-IMACH(12) ) GOTO 4029
      WRITE( STDOUT, 4021 )
 4021 FORMAT(34H0WARNING - I1MACH(13) - I1MACH(12) )
      WRITE( STDOUT, 4022 )
 4022 FORMAT(32H EXCEEDS I1MACH(16) - I1MACH(15) )
      WRITE( STDOUT, 4023 )
 4023 FORMAT(13H I1MACH(12) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(12)
      WRITE( STDOUT, 4024 )
 4024 FORMAT(13H I1MACH(13) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(13)
      WRITE( STDOUT, 4025 )
 4025 FORMAT(13H I1MACH(15) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(15)
      WRITE( STDOUT, 4026 )
 4026 FORMAT(13H I1MACH(16) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(16)
 4029 CONTINUE
C
      N = 0
      IBASEM = IMACH(7) - 1
      DO 4030 I = 1, DIGINT
        N = N*IMACH(7) + IBASEM
 4030   CONTINUE
C
      IF( IMACH(9) .EQ. N) GOTO 4039
      WRITE( STDOUT, 4031 )
 4031 FORMAT(39H1IMACH(9) IS NOT IMACH(7)**IMACH(8) - 1 )
      WRITE( STDOUT, 4032 )
 4032 FORMAT(12H I1MACH(7) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(7)
      WRITE( STDOUT, 4034 )
 4034 FORMAT(12H I1MACH(8) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(8)
      WRITE( STDOUT, 4035 )
 4035 FORMAT(12H I1MACH(9) = )
      WRITE( STDOUT, IFMT ) CCPLUS, IMACH(9)
 4039 CONTINUE
C
C NOW CHECK CONSISTENCY OF SINGLE-PRECISION CONSTANTS
C/6S
      CALL S88FMT( 2, 19, EFMT(5) )
C/7S
C     CALL S88FMT( 2, 19, EFMT1(5) )
C/
      XR = S2MACH( 1.0, IMACH(10), IMACH(12)-1 )
      IF( XR .EQ. RMACH(1) ) GOTO 5009
      WRITE( STDOUT, 5001 )
 5001 FORMAT(47H0R1MACH(1) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 5002 )
 5002 FORMAT(12H R1MACH(1) = )
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(1)
      WRITE( STDOUT, 5003 )
 5003 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, EFMT ) CCPLUS, XR
      WRITE( STDOUT, 5004 )
 5004 FORMAT(14H DIFFERENCE = )
      XR = RMACH(1) - XR
      WRITE( STDOUT, EFMT ) CCPLUS, XR
 5009 CONTINUE
C
      XR = 0.0
      SBASE  = FLOAT( IMACH(10) )
      SBASEM = FLOAT( IMACH(10)-1 )
      DO 5010 I = 1, DIGSP
        XR = (XR + SBASEM)/SBASE
 5010   CONTINUE
C
      XR = S2MACH( XR, IMACH(10), IMACH(13) )
      IF( XR .EQ. RMACH(2) ) GOTO 5019
      WRITE( STDOUT, 5011 )
 5011 FORMAT(47H0R1MACH(2) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 5012 )
 5012 FORMAT(12H R1MACH(2) = )
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(2)
      WRITE( STDOUT, 5013 )
 5013 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, EFMT ) CCPLUS, XR
      WRITE( STDOUT, 5014 )
 5014 FORMAT(14H DIFFERENCE = )
      XR = RMACH(2) - XR
      WRITE( STDOUT, EFMT ) CCPLUS, XR
 5019 CONTINUE
C
      XR = S2MACH( 1.0, IMACH(10), -IMACH(11) )
      IF( XR .EQ. RMACH(3) ) GOTO 5029
      WRITE( STDOUT, 5021 )
 5021 FORMAT(47H0R1MACH(3) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 5022 )
 5022 FORMAT(12H R1MACH(3) = )
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(3)
      WRITE( STDOUT, 5023 )
 5023 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, EFMT ) CCPLUS, XR
      WRITE( STDOUT, 5024 )
 5024 FORMAT(14H DIFFERENCE = )
      XR = RMACH(3) - XR
      WRITE( STDOUT, EFMT ) CCPLUS, XR
 5029 CONTINUE
C
      XR = S2MACH( 1.0, IMACH(10), 1-IMACH(11) )
      IF( XR .EQ. RMACH(4) ) GOTO 5039
      WRITE( STDOUT, 5031 )
 5031 FORMAT(47H0R1MACH(4) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 5032 )
 5032 FORMAT(12H R1MACH(4) = )
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(4)
      WRITE( STDOUT, 5033 )
 5033 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, EFMT ) CCPLUS, XR
      WRITE( STDOUT, 5034 )
 5034 FORMAT(14H DIFFERENCE = )
      XR = RMACH(4) - XR
      WRITE( STDOUT, EFMT ) CCPLUS, XR
 5039 CONTINUE
C
      XR = ALOG10( FLOAT(IMACH(10)) )
      IF( XR .EQ. RMACH(5) ) GOTO 5049
      WRITE( STDOUT, 5041 )
 5041 FORMAT(47H0R1MACH(5) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 5042 )
 5042 FORMAT(12H R1MACH(5) = )
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(5)
      WRITE( STDOUT, 5043 )
 5043 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, EFMT ) CCPLUS, XR
      WRITE( STDOUT, 5044 )
 5044 FORMAT(14H DIFFERENCE = )
      XR = RMACH(5) - XR
      WRITE( STDOUT, EFMT ) CCPLUS, XR
 5049 CONTINUE
C
C NOW CHECK CONSISTENCY OF DOUBLE-PRECISION CONSTANTS
C/6S
      CALL S88FMT( 2, 19, DFMT(5) )
C/7S
C     CALL S88FMT( 2, 19, DFMT1(5) )
C/
      XD = S3MACH( 1.0D0, IMACH(10), IMACH(15)-1 )
      IF( XD .EQ. DMACH(1) ) GOTO 6009
      WRITE( STDOUT, 6001 )
 6001 FORMAT(47H0D1MACH(1) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 6002 )
 6002 FORMAT(12H D1MACH(1) = )
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(1)
      WRITE( STDOUT, 6003 )
 6003 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, DFMT ) CCPLUS, XD
      WRITE( STDOUT, 6004 )
 6004 FORMAT(14H DIFFERENCE = )
      XD = DMACH(1) - XD
      WRITE( STDOUT, DFMT ) CCPLUS, XD
 6009 CONTINUE
C
      XD = 0.0D0
      DBASE  = DBLE ( FLOAT( IMACH(10) ) )
      DBASEM = DBLE ( FLOAT( IMACH(10)-1 ) )
      DO 6010 I = 1, DIGDP
        XD = (XD + DBASEM)/DBASE
 6010   CONTINUE
C
      XD = S3MACH( XD, IMACH(10), IMACH(16) )
      IF( XD .EQ. DMACH(2) ) GOTO 6019
      WRITE( STDOUT, 6011 )
 6011 FORMAT(47H0D1MACH(2) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 6012 )
 6012 FORMAT(12H D1MACH(2) = )
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(2)
      WRITE( STDOUT, 6013 )
 6013 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, DFMT ) CCPLUS, XD
      WRITE( STDOUT, 6014 )
 6014 FORMAT(14H DIFFERENCE = )
      XD = DMACH(2) - XD
      WRITE( STDOUT, DFMT ) CCPLUS, XD
 6019 CONTINUE
C
      XD = S3MACH( 1.0D0, IMACH(10), -IMACH(14) )
      IF( XD .EQ. DMACH(3) ) GOTO 6029
      WRITE( STDOUT, 6021 )
 6021 FORMAT(47H0D1MACH(3) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 6022 )
 6022 FORMAT(12H D1MACH(3) = )
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(3)
      WRITE( STDOUT, 6023 )
 6023 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, DFMT ) CCPLUS, XD
      WRITE( STDOUT, 6024 )
 6024 FORMAT(14H DIFFERENCE = )
      XD = DMACH(3) - XD
      WRITE( STDOUT, DFMT ) CCPLUS, XD
 6029 CONTINUE
C
      XD = S3MACH( 1.0D0, IMACH(10), 1-IMACH(14) )
      IF( XD .EQ. DMACH(4) ) GOTO 6039
      WRITE( STDOUT, 6031 )
 6031 FORMAT(47H0D1MACH(4) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 6032 )
 6032 FORMAT(12H D1MACH(4) = )
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(4)
      WRITE( STDOUT, 6033 )
 6033 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, DFMT ) CCPLUS, XD
      WRITE( STDOUT, 6034 )
 6034 FORMAT(14H DIFFERENCE = )
      XD = DMACH(4) - XD
      WRITE( STDOUT, DFMT ) CCPLUS, XD
 6039 CONTINUE
C
      XD = DLOG10( DBLE(FLOAT(IMACH(10))) )
      IF( XD .EQ. DMACH(5) ) GOTO 6049
      WRITE( STDOUT, 6041 )
 6041 FORMAT(47H0D1MACH(5) DOES NOT AGREE WITH CALCULATED VALUE)
      WRITE( STDOUT, 6042 )
 6042 FORMAT(12H D1MACH(5) = )
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(5)
      WRITE( STDOUT, 6043 )
 6043 FORMAT(19H CALCULATED VALUE = )
      WRITE( STDOUT, DFMT ) CCPLUS, XD
      WRITE( STDOUT, 6044 )
 6044 FORMAT(14H DIFFERENCE = )
      XD = DMACH(5) - XD
      WRITE( STDOUT, DFMT ) CCPLUS, XD
 6049 CONTINUE
C
C NOW SEE IF SINGLE-PRECISION IS CLOSED UNDER NEGATION
C
      XR = -RMACH(1)
      XR = -XR
      IF( XR .EQ. RMACH(1) ) GOTO 7009
      WRITE( STDOUT, 7001 )
 7001 FORMAT(29H0-(-R1MACH(1)) .NE. R1MACH(1))
      WRITE( STDOUT, 7002 )
 7002 FORMAT(16H    R1MACH(1)  = )
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(1)
      WRITE( STDOUT, 7003 )
 7003 FORMAT(16H -(-R1MACH(1)) = )
      WRITE( STDOUT, EFMT ) CCPLUS, XR
 7009 CONTINUE
C
      XR = -RMACH(2)
      XR = -XR
      IF( XR .EQ. RMACH(2) ) GOTO 7019
      WRITE( STDOUT, 7011 )
 7011 FORMAT(29H0-(-R1MACH(2)) .NE. R1MACH(2))
      WRITE( STDOUT, 7012 )
 7012 FORMAT(16H    R1MACH(2)  = )
      WRITE( STDOUT, EFMT ) CCPLUS, RMACH(2)
      WRITE( STDOUT, 7013 )
 7013 FORMAT(16H -(-R1MACH(2)) = )
      WRITE( STDOUT, EFMT ) CCPLUS, XR
 7019 CONTINUE
C
C NOW SEE IF DOUBLE-PRECISION IS CLOSED UNDER NEGATION
C
      XD = -DMACH(1)
      XD = -XD
      IF( XD .EQ. DMACH(1) ) GOTO 8009
      WRITE( STDOUT, 8001 )
 8001 FORMAT(29H0-(-D1MACH(1)) .NE. D1MACH(1))
      WRITE( STDOUT, 8002 )
 8002 FORMAT(16H    D1MACH(1)  = )
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(1)
      WRITE( STDOUT, 8003 )
 8003 FORMAT(16H -(-D1MACH(1)) = )
      WRITE( STDOUT, DFMT ) CCPLUS, XD
 8009 CONTINUE
C
      XD = -DMACH(2)
      XD = -XD
      IF( XD .EQ. DMACH(2) ) GOTO 8019
      WRITE( STDOUT, 8011 )
 8011 FORMAT(29H0-(-D1MACH(2)) .NE. D1MACH(2))
      WRITE( STDOUT, 8012 )
 8012 FORMAT(16H    D1MACH(2)  = )
      WRITE( STDOUT, DFMT ) CCPLUS, DMACH(2)
      WRITE( STDOUT, 8013 )
 8013 FORMAT(16H -(-D1MACH(2)) = )
      WRITE( STDOUT, DFMT ) CCPLUS, XD
 8019 CONTINUE
C
C CHECK THAT SQRT AND DSQRT WORK NEAR OVER- AND UNDERFLOW LIMITS.
C
      N = IMACH(11)/2 + 1
      XR = SQRT(RMACH(1))
      IF (XR .GT. 0.0) GO TO 9002
         WRITE( STDOUT, 9001 )
 9001    FORMAT(18H SQRT(R1MACH(1)) =)
         WRITE( STDOUT, EFMT ) CCPLUS, XR
         GO TO 9004
C SCALE TO AVOID TROUBLE FROM UNDERFLOW...
 9002 XR = S2MACH( XR, IMACH(10), N)
      YR = S2MACH( RMACH(1), IMACH(10), 2*N)
      YR = ABS(XR*XR - YR) / YR
      IF (YR .LT. 2.*RMACH(4)) GO TO 9004
         WRITE( STDOUT, 9003 )
 9003    FORMAT(35H EXCESSIVE ERROR IN SQRT(R1MACH(1))/13H REL. ERROR =)
         WRITE( STDOUT, EFMT ) CCPLUS, YR
 9004 XR = SQRT(RMACH(2))
      IF (XR .GT. 0.0) GO TO 9006
         WRITE( STDOUT, 9005 )
 9005    FORMAT(18H SQRT(R1MACH(2)) =)
         WRITE( STDOUT, EFMT ) CCPLUS, XR
         GO TO 9008
C SCALE TO AVOID TROUBLE FROM OVERFLOW...
 9006 XR = S2MACH( XR, IMACH(10), -N)
      YR = S2MACH( RMACH(2), IMACH(10), -2*N)
      YR = ABS(XR*XR - YR) / YR
      IF (YR .LT. 2.*RMACH(4)) GO TO 9008
         WRITE( STDOUT, 9007 )
 9007    FORMAT(35H EXCESSIVE ERROR IN SQRT(R1MACH(2))/13H REL. ERROR =)
         WRITE( STDOUT, EFMT ) CCPLUS, YR
C
 9008 N = IMACH(14)/2 + 1
      XD = DSQRT(DMACH(1))
      IF (XD .GT. 0.D0) GO TO 9010
         WRITE( STDOUT, 9009 )
 9009    FORMAT(19H DSQRT(D1MACH(1)) =)
         WRITE( STDOUT, DFMT ) CCPLUS, XD
         GO TO 9012
C AGAIN SCALE TO AVOID TROUBLE FROM UNDERFLOW...
 9010 XD = S3MACH( XD, IMACH(10), N)
      YD = S3MACH( DMACH(1), IMACH(10), 2*N)
      YD = DABS(XD*XD - YD) / YD
      IF (YD .LT. 2.D0*DMACH(4)) GO TO 9012
        WRITE( STDOUT, 9011 )
 9011   FORMAT(36H EXCESSIVE ERROR IN DSQRT(D1MACH(1))/13H REL. ERROR =)
        WRITE( STDOUT, EFMT ) CCPLUS, YD
 9012 XD = DSQRT(DMACH(2))
      IF (XD .GT. 0.0D0) GO TO 9014
        WRITE( STDOUT, 9013 )
 9013   FORMAT(19H DSQRT(D1MACH(2)) =)
        WRITE( STDOUT, EFMT ) CCPLUS, XD
        GO TO 9016
C AGAIN SCALE TO AVOID TROUBLE FROM OVERFLOW...
 9014 XD = S3MACH( XD, IMACH(10), -N)
      YD = S3MACH( DMACH(2), IMACH(10), -2*N)
      YD = DABS(XD*XD - YD) / YD
      IF (YD .LT. 2.D0*DMACH(4)) GO TO 9016
        WRITE( STDOUT, 9015 )
 9015   FORMAT(36H EXCESSIVE ERROR IN DSQRT(D1MACH(2))/13H REL. ERROR =)
        WRITE( STDOUT, EFMT ) CCPLUS, YD
 9016 RETURN
C
      END
