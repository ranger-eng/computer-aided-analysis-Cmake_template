      SUBROUTINE  SCOPY(N,SX,INCX,SY,INCY)
C
C     COPIES A VECTOR, X, TO A VECTOR, Y.
C     USES UNROLLED LOOPS FOR INCREMENTS EQUAL TO 1.
C     JACK DONGARRA, LINPACK, 3/11/78.
C
C     ADAPTED TO PORT 3 BY PHYL FOX, 11/8/83.
C
      REAL SX(1),SY(1)
      INTEGER I,INCX,INCY,IX,IY,M,MP1,N
C
      IF(N.EQ.0)RETURN
C/6S
      IF(N .LT. 0) CALL SETERR(12HSCOPY-N.LT.0, 12, 1, 2)
      IF(INCY .EQ. 0) CALL SETERR(15HSCOPY-INCY.EQ.0, 15, 3, 2)
C/7S
C     IF(N .LT. 0) CALL SETERR('SCOPY-N.LT.0', 12, 1, 2)
C     IF(INCY .EQ. 0) CALL SETERR('SCOPY-INCY.EQ.0', 15, 3, 2)
C/
C
      IF(INCX.EQ.1.AND.INCY.EQ.1)GO TO 20
C
C        CODE FOR UNEQUAL INCREMENTS OR EQUAL INCREMENTS
C          NOT EQUAL TO 1
C
      IX = 1
      IY = 1
      IF(INCX.LT.0)IX = (-N+1)*INCX + 1
      IF(INCY.LT.0)IY = (-N+1)*INCY + 1
      DO 10 I = 1,N
        SY(IY) = SX(IX)
        IX = IX + INCX
        IY = IY + INCY
   10 CONTINUE
      RETURN
C
C        CODE FOR BOTH INCREMENTS EQUAL TO 1
C
C
C        CLEAN-UP LOOP
C
   20 M = MOD(N,7)
      IF( M .EQ. 0 ) GO TO 40
      DO 30 I = 1,M
        SY(I) = SX(I)
   30 CONTINUE
      IF( N .LT. 7 ) RETURN
   40 MP1 = M + 1
      DO 50 I = MP1,N,7
        SY(I) = SX(I)
        SY(I + 1) = SX(I + 1)
        SY(I + 2) = SX(I + 2)
        SY(I + 3) = SX(I + 3)
        SY(I + 4) = SX(I + 4)
        SY(I + 5) = SX(I + 5)
        SY(I + 6) = SX(I + 6)
   50 CONTINUE
      RETURN
      END
