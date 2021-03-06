      SUBROUTINE GECE(N, A, IA, INTER, COND)
      INTEGER IA, N, INTER(N)
      REAL A(IA, N), COND
      COMMON /CSTAK/ D
      DOUBLE PRECISION D(500)
      INTEGER  NERR, ISTKGT, NERROR, I,  IWORK
      REAL AMAX1, R(1000), SASUM, SNORM, R1MACH
      EQUIVALENCE (R(1), D(1))
C THIS SUBROUTINE CALLS THE DECOMPOSITION ROUTINE AND DETERMINES
C AN ESTIMATE OF THE CONDITION NUMBER OF A REAL GENERAL MATRIX
C INPUT PARAMETERS
C    N        ORDER OF THE PROBLEM
C    A        MATRIX WHOSE CONDITION NUMBER IS REQUIRED
C    IA       ROW DIMENSION OF A
C OUTPUT PARAMETERS
C    A        CONTAINS THE LU DECOMPOSITION OF THE A MATRIX
C    INTER    PIVOT VECTOR PRODUCED BY THE DECOMPOSITION
C    COND     AN ESTIMATE OF THE CONDITION NUMBER OF THE MATRIX A
C EXTRA STORAGE ALLOCATED : N REAL LOCATIONS
C THE SUBROUTINES SASUM, GELU, AND G4ECE ARE CALLED
C ERROR CONDITIONS-
C    1     N.LT.1       FATAL
C    2    IA.LT.N       FATAL
      CALL ENTER(1)
C/6S
      IF (N .LT. 1) CALL SETERR(13H GECE-N.LT.1 , 13, 1, 2)
      IF (IA .LT. N) CALL SETERR(13H GECE-IA.LT.N, 13, 2, 2)
C/7S
C     IF (N .LT. 1) CALL SETERR(' GECE-N.LT.1 ', 13, 1, 2)
C     IF (IA .LT. N) CALL SETERR(' GECE-IA.LT.N', 13, 2, 2)
C/
      SNORM = 0.0
      DO  1 I = 1, N
         SNORM = AMAX1(SNORM, SASUM(N, A(1, I), 1))
   1     CONTINUE
      CALL GELU(N,A,IA,INTER,0.0)
      IF (NERROR(NERR) .EQ. 0) GOTO 2
         COND = R1MACH(2)
C/6S
         CALL N5ERR(21H GECE-SINGULAR MATRIX,21,NERR,1)
C/7S
C        CALL N5ERR(' GECE-SINGULAR MATRIX',21,NERR,1)
C/
         GOTO  3
   2     IWORK = ISTKGT(N,3)
         CALL G4ECE(N,A,IA,SNORM,COND,INTER,R(IWORK))
   3  CALL LEAVE
      RETURN
      END
