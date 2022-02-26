       SUBROUTINE DAXPY(N,A,X,INCX,Y,INCY)
C
C THIS SUBROUTINE MULTIPLIES THE X VECTOR BY A AND
C ADDS THE RESULT TO THE Y VECTOR
C ONLY EVERY INCXTH COMPONENT OF X AND EVERY INCYTH
C COMPONENT OF Y ARE CONSIDERED
       DOUBLE PRECISION X(INCX,1),Y(INCY,1),A
       IF (N.EQ.0) RETURN
C/6S
       IF(N.LT.0) CALL SETERR(12HDAXPY-N.LT.0,12,1,2)
       IF(INCX.LT.1) CALL SETERR(15HDAXPY-INCX.LT.1,15,2,2)
       IF(INCY.LT.1) CALL SETERR(15HDAXPY-INCY.LT.1,15,3,2)
C/7S
C      IF(N.LT.0) CALL SETERR('DAXPY-N.LT.0',12,1,2)
C      IF(INCX.LT.1) CALL SETERR('DAXPY-INCX.LT.1',15,2,2)
C      IF(INCY.LT.1) CALL SETERR('DAXPY-INCY.LT.1',15,3,2)
C/
       DO 10 I=1,N
          Y(1,I)=Y(1,I)+A*X(1,I)
 10    CONTINUE
       RETURN
       END