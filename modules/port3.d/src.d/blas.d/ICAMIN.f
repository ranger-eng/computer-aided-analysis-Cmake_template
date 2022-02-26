        INTEGER FUNCTION ICAMIN(N,X,INCX)
        INTEGER I,N,INCX
        COMPLEX X(INCX,1)
        REAL SMIN
C THIS FUNCTION RETURNS THE INDEX OF THE COMPONENT
C OF X HAVING MINIMUM MAGNITUDE. ONLY EVERY
C INCXTH COMPONENT OF X IS CONSIDERED
C
        ICAMIN=0
        IF(N.EQ.0) RETURN
C/6S
        IF(N.LT.0) CALL SETERR(13HICAMIN-N.LT.0,13,1,2)
        IF(INCX.LT.1)CALL SETERR(16HICAMIN-INCX.LT.1,16,2,2)
C/7S
C       IF(N.LT.0) CALL SETERR('ICAMIN-N.LT.0',13,1,2)
C       IF(INCX.LT.1)CALL SETERR('ICAMIN-INCX.LT.1',16,2,2)
C/
        SMIN=CABS(X(1,I))
        ICAMIN=1
        IF(SMIN .EQ. 0.0) RETURN
        DO 10 I=1,N
        IF(SMIN.LE.CABS(X(1,I))) GO TO 10
           SMIN=CABS(X(1,1))
           ICAMIN=I
           IF(SMIN .EQ. 0.0) RETURN
 10     CONTINUE
        RETURN
        END
