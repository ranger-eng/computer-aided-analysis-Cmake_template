        DOUBLE PRECISION FUNCTION DAMAX(N,X,INCX)
        INTEGER   N,INCX
        DOUBLE PRECISION X(INCX,1)
C
C THIS FUNCTIONS RETURNS THE MAGNITUDE OF THE COMPONENT
C OF X HAVING MAXIMUM MAGNITUDE. ONLY EVERY INCXTH
C COMPONENT OF X IS CONSIDERED.
C
        DAMAX=0.0
        IF(N.EQ.0) RETURN
C/6S
        IF(N.LT.0)CALL SETERR(12HDAMAX-N.LT.0,12,1,2)
        IF (INCX.LT.1) CALL SETERR(15HDAMAX-INCX.LT.1,15,2,2)
C/7S
C       IF(N.LT.0)CALL SETERR('DAMAX-N.LT.0',12,1,2)
C       IF (INCX.LT.1) CALL SETERR('DAMAX-INCX.LT.1',15,2,2)
C/
        DO 10 I=1,N
           IF(DAMAX.LT.DABS(X(1,I)))DAMAX=DABS(X(1,I))
 10     CONTINUE
        RETURN
        END
