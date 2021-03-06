        INTEGER FUNCTION IIMIN(N,X,INCX)
        INTEGER I,N,INCX
        INTEGER X(INCX,1),IMIN
C
C THIS FUNCTION RETURNS THE INDEX OF THE LARGEST (ALGEBRAIC)
C COMPONENT OF X.
C ONLY EVERY INCXTH COMPONENT OF X IS CONSIDERED.
C
        IIMIN=0
        IF(N.EQ.0) RETURN
C/6S
        IF(N.LT.0) CALL SETERR(12HIIMIN-N.LT.0,12,1,2)
        IF(INCX.LT.1)CALL SETERR(15HIIMIN-INCX.LT.1,15,2,2)
C/7S
C       IF(N.LT.0) CALL SETERR('IIMIN-N.LT.0',12,1,2)
C       IF(INCX.LT.1)CALL SETERR('IIMIN-INCX.LT.1',15,2,2)
C/
        IMIN=X(1,1)
        IIMIN=1
        DO 10 I=1,N
        IF(IMIN.LE.X(1,I)) GO TO 10
           IMIN=X(1,I)
           IIMIN=I
 10     CONTINUE
        RETURN
        END
