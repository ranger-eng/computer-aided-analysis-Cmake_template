        REAL FUNCTION SASUM(N,X,INCX)
C
C THIS FUNCTION RETURNS THE SUM OF THE ABSOLUTE VALUES
C OF THE COMPONENTS OF X. ONLY EVERY INCXTH COMPONENT
C OF X IS CONSIDERED
       REAL X(INCX,1)
       SASUM=0.0
       IF(N.EQ.0) RETURN
C/6S
       IF (N.LT.0) CALL SETERR(12HSASUM-N.LT.0,12,1,2)
       IF(INCX.LT.1) CALL SETERR(15HSASUM-INCX.LT.1,15,2,2)
C/7S
C      IF (N.LT.0) CALL SETERR('SASUM-N.LT.0',12,1,2)
C      IF(INCX.LT.1) CALL SETERR('SASUM-INCX.LT.1',15,2,2)
C/
       DO 10 I=1,N
          SASUM=SASUM+ABS(X(1,I))
 10    CONTINUE
       RETURN
       END
