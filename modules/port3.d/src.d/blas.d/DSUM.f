      DOUBLE PRECISION FUNCTION DSUM(N,X,INCX)
C
C  PROGRAM TO FIND THE SUM OF N COMPONENTS OF A VECTOR.
C  THE PROGRAM GUARDS AGAINST OVERFLOW.
C
C  ADAPTED BY PHYLLIS FOX
C  FROM W. STANLEY BROWNS ALGORITHM FOR FINDING THE MEAN
C  AUGUST 23, 1982.
C
C  INPUT PARAMETERS -
C
C  N             - THE NUMBER OF ELEMENTS TO BE SUMMED
C
C  X             - VECTOR OF LENGTH AT LEAST N
C
C  INCX          - THE PROGRAM SUMS ONLY THE COMPONENTS SEPARATED BY
C                  SPACING, INCX, I.E.
C                  X(1) + X(1+INCX) + ... +X(1+(N-1)*INCX)
C
C
C  SCRATCH SPACE ALLOCATED - NONE
C
C  ERROR STATES -
C
C  1 - N .LT. 0
C
C  2 - INCX .LT. 1
C
C  3 - N IS TOO BIG (CANNOT GUARANTEE NO OVERFLOW)
C      (RECOVERABLE ERROR)
C
C  4 - THE RESULTANT SUM IS TOO BIG AND WOULD OVERFLOW
C      WHEN UNSCALED.
C      INFINITY (D1MACH(2)) WITH THE APPROPRIATE SIGN IS RETURNED.
C      (RECOVERABLE ERROR)
C
C  NOTE - WHEN N IS ZERO, DSUM=0.0D0 IS RETURNED.
C
      INTEGER J, K, N, INCX
      DOUBLE PRECISION X(INCX,1), BASE, BIG, SMALL, EPS
      DOUBLE PRECISION EPSIN, BNDRY, FLTN, TEMP, DFLOAT, D1MACH
C
      DSUM = 0.
      IF(N .EQ. 0 ) RETURN
C/6S
      IF(N.LT.0) CALL SETERR(11HDSUM-N.LT.0, 11, 1, 2)
      IF(INCX.LT.1) CALL SETERR (14HDSUM-INCX.LT.1, 14, 2, 2)
C/7S
C     IF(N.LT.0) CALL SETERR('DSUM-N.LT.0', 11, 1, 2)
C     IF(INCX.LT.1) CALL SETERR ('DSUM-INCX.LT.1', 14, 2, 2)
C/
C
C  IF N IS NOT LESS THAN 1/EPS, OVERFLOW MAY OCCUR
C
      EPS = D1MACH(4)
      EPSIN = 1.0D0/EPS
      FLTN = DFLOAT(N)
      IF (FLTN .LT. EPSIN) GO TO 10
C/6S
      CALL SETERR(14HDSUM-N TOO BIG, 14, 3, 1)
C/7S
C     CALL SETERR('DSUM-N TOO BIG', 14, 3, 1)
C/
      RETURN
C
C  NOW SUM ELEMENTS UNTIL ONE GREATER THAN BNDRY IS FOUND
C
C  BNDRY IS (BASE)*(SMALL)/(EPS**2)
C
 10   BASE = FLOAT(I1MACH(10))
      SMALL = D1MACH(1)
      BIG = D1MACH(2)
C
      BNDRY = BASE*SMALL*EPSIN*EPSIN
C
      DO 20 J=1,N
C
C  IF A LARGE ONE IS FOUND, GO TO THE PROCEDURE FOR BIG ADDENDS.
C
      IF(DABS(X(1,J)) .GE. BNDRY) GO TO 30
      DSUM = DSUM + EPSIN*X(1,J)
 20   CONTINUE
C
C  IF NO LARGE ELEMENTS HAVE BEEN FOUND,
C  TAKE OUT THE EPS SCALING FACTOR FROM THE SUM, AND RETURN.
C
      DSUM = EPS*DSUM
      RETURN
C
C  COMES HERE AFTER A LARGE ADDEND IS FOUND.
C  (AND STAYS IN THIS LOOP)
C
 30   DSUM = EPS*EPS*DSUM
      DO 40 K=J,N
      DSUM = DSUM + EPS*X(1,K)
 40   CONTINUE
C
C  HERE DSUM IS EQUAL TO THE SUM SCALED BY EPS.
C
C  CHECK FOR OVERFLOW ON RESCALING
C
      TEMP = EPS*BIG
      IF (DSUM .GE. TEMP .OR. DSUM .LE. (-TEMP)) GO TO 50
C
C  HERE ALL IS WELL
C
      DSUM = DSUM*EPSIN
      RETURN
C
C  COMES HERE TO A RECOVERABLE ERROR BECAUSE THE SUM WOULD OVERFLOW.
C  RETURN THE VALUE BIG WITH THE CORRECT SIGN.
C
 50   DSUM = DSIGN(BIG, DSUM)
C/6S
      CALL SETERR(
     1  39HDSUM-SUM TOO BIG, +OR-INFINITY RETURNED, 39, 4, 1)
C/7S
C     CALL SETERR(
C    1  'DSUM-SUM TOO BIG, +OR-INFINITY RETURNED', 39, 4, 1)
C/
      RETURN
      END
