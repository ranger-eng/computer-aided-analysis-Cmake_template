        INTEGER FUNCTION ISAMIN(N,X,INCX)
        INTEGER I,N,INCX
        REAL X(INCX,1),SMIN
C THIS FUNCTION RETURNS THE INDEX OF THE COMPONENT
C OF X HAVING MINIMUM MAGNITUDE. ONLY EVERY
C INCXTH COMPONENT OF X IS CONSIDERED
C
        ISAMIN=0
        IF(N.EQ.0) RETURN
C/6S
        IF(N.LT.0) CALL SETERR(13HISAMIN-N.LT.0,13,1,2)
        IF(INCX.LT.1)CALL SETERR(16HISAMIN-INCX.LT.1,16,2,2)
C/7S
C       IF(N.LT.0) CALL SETERR('ISAMIN-N.LT.0',13,1,2)
C       IF(INCX.LT.1)CALL SETERR('ISAMIN-INCX.LT.1',16,2,2)
C/
        SMIN=ABS(X(1,1))
        ISAMIN=1
        IF(SMIN .EQ. 0.0) RETURN
        DO 10 I=1,N
        IF(SMIN.LE.ABS(X(1,I))) GO TO 10
           SMIN=ABS(X(1,I))
           ISAMIN=I
           IF(SMIN .EQ. 0.0) RETURN
 10     CONTINUE
        RETURN
        END
