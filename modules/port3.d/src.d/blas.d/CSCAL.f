       SUBROUTINE CSCAL(N,A,X,INCX)
C
C THIS SUBROUTINE SCALES EVERY INCXTH COMPONENT OF X
C BY A
      COMPLEX A,X(INCX,1)
      IF(N.EQ.0) RETURN
C/6S
      IF(N.LT.0) CALL SETERR(12HCSCAL-N.LT.0,12,1,2)
      IF(INCX.LT.1)CALL SETERR(15HCSCAL-INCX.LT.1,15,2,2)
C/7S
C     IF(N.LT.0) CALL SETERR('CSCAL-N.LT.0',12,1,2)
C     IF(INCX.LT.1)CALL SETERR('CSCAL-INCX.LT.1',15,2,2)
C/
      DO 10 I=1,N
         X(1,I)=X(1,I)*A
 10   CONTINUE
      RETURN
      END
