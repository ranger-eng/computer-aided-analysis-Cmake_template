      SUBROUTINE EIGEN(NM,N,A,WR,WI,Z)
      COMMON/CSTAK/DSTAK(500)
C
      REAL A(NM,N),WR(N),WI(N),Z(NM,N)
      REAL RSTAK(1000)
C
      EQUIVALENCE (DSTAK(1),RSTAK(1))
C
C EIGEN FINDS THE EIGENVALUES AND EIGENVECTORS
C OF A REAL MATRIX (NOT IMAGINARY) BY
C CALLING THE SEQUENCE OF SUBROUTINES
C ORTHE,ORTRA, AND HQR2, WHICH, IN TURN, ARE
C THE EISPACK ROUTINES ORTHES, ORTRAN, AND HQR2,
C ADJUSTED FOR USE IN THE PORT LIBRARY.
C
C ON INPUT -
C
C   NM - AN INTEGER INPUT VARIABLE SET EQUAL TO
C        THE ROW DIMENSION OF THE TWO-DIMENSIONAL ARRAYS
C        A AND Z AS SPECIFIED IN THE DIMENSION STATEMENTS
C        FOR A AND Z IN THE CALLING PROGRAM.
C
C   N -  AN INTEGER INPUT VARIABLE SET EQUAL TO THE
C        ORDER OF THE MATRIX A.
C
C     N MUST NOT BE GREATER THAN NM.
C
C   A - THE MATRIX, A REAL TWO-DIMENSIONAL
C       ARRAY WITH ROW DIMENSION NM AND COLUMN
C       DIMENSION AT LEAST N.
C
C     A IS OVERWRITTEN.
C
C
C
C ON OUTPUT -
C
C   WR - A REAL ARRAY OF DIMENSION
C        AT LEAST N CONTAINING THE REAL PARTS OF THE EIGENVALUES
C
C   WI - A REAL ARRAY OF DIMENSION
C        AT LEAST N CONTAINING THE IMAGINARY PARTS OF THE EIGENVALUES.
C
C     THE EIGENVALUES ARE UNORDERED EXCEPT THAT
C     COMPLEX CONJUGATE PAIRS OF EIGENVALUES
C     APPEAR CONSECUTIVELY WITH THE EIGENVALUE HAVING
C     THE POSITIVE IMAGINARY PART FIRST.
C
C   Z - A REAL TWO-DIMENSIONAL ARRAY
C       WITH ROW DIMENSION NM AND COLUMN DIMENSION
C       AT LEAST N CONTAINING THE REAL AND IMAGINARY PARTS
C       OF THE EIGENVECTORS.
C
C       IF THE J-TH EIGENVALUE IS REAL, THE J-TH
C       COLUMN OF Z CONTAINS ITS EIGENVECTOR.
C
C       IF THE J-TH EIGENVALUE IS COMPLEX WITH
C       POSITIVE REAL PART, THE J-TH AND (J+1)-TH
C       COLUMNS OF Z CONTAIN THE REAL AND IMAGINARY
C       PARTS OF ITS EIGENVECTOR.
C
C       THE CONJUGATE OF THIS VECTOR IS THE
C       EIGENVECTOR FOR THE CONJUGATE EIGENVALUE.
C       THE EIGENVECTORS ARE NOT NORMALIZED.
C
C
C ERROR STATES -
C
C          1 - N IS GREATER THAN NM
C
C          K - THE K-TH EIGENVALUE COULD NOT BE COMPUTED
C              WITHIN 30 ITERATIONS.
C
C              THE EIGENVALUES IN THE WR AND WRI ARRAYS
C              SHOULD BE CORRECT FOR INDICES
C              K+1, K+2,...,N, BUT NO EIGENVECTORS ARE COMPUTED.
C
C
C
C
C CHECK FOR INPUT ERROR IN N
C
C/6S
      IF (N .GT. NM) CALL SETERR(
     1   29H EIGEN - N IS GREATER THAN NM,29,1,2)
C/7S
C     IF (N .GT. NM) CALL SETERR(
C    1   ' EIGEN - N IS GREATER THAN NM',29,1,2)
C/
C
C ALLOCATE A SCRATCH VECTOR
      IORT = ISTKGT(N,3)
C
      CALL ORTHE (NM,N,1,N,A,RSTAK(IORT))
      CALL ORTRA (NM,N,1,N,A,RSTAK(IORT),Z)
      CALL HQR2 (NM,N,1,N,A,WR,WI,Z,IERR)
C
      IF (IERR .NE. 0) GO TO 10
      CALL ISTKRL(1)
      RETURN
C/6S
  10  CALL SETERR(
     1   34H EIGEN - FAILED ON THAT EIGENVALUE,34,IERR,1)
C/7S
C 10  CALL SETERR(
C    1   ' EIGEN - FAILED ON THAT EIGENVALUE',34,IERR,1)
C/
C
      CALL ISTKRL(1)
      RETURN
      END
