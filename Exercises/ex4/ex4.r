cat("Seja A uma matrix quadrada de dimensao 2. Calculando A^n:\n","*(n == 10)\n\n")
    
A = matrix(c(3, 1, 0, 2), nrow=2, ncol=2, byrow=TRUE)
cat("Transformacao A expressa no sistema padrao:\n")
print(A)

#convertendo a transformacao do sistema padrao para 
#um novo sistema que possui uma autobase (ou seja,
#essa transformacao apenas escala os vetores bases desse novo sistema):
    
    B = matrix(c(1, -1, 0, 1), nrow=2, ncol=2, byrow=TRUE)
    cat("Base do novo sistema expressa no sistema padrao\n",
        "(autovetores linearmente independentes de A):\n")
    print(B)
    
    
    invB = solve(B)
    cat("Base do sistema padrao expressa no novo sistema:\n")
    print(invB)
    
    
    C = invB %*% (A %*% B)
    cat("Transformaçao A expressa no novo sistema:\n")
    print(C)
  
#Aplicando a transformacao 10 vezes no novo sistema:
n = 10
elementoDiagonal1 = C[1,1]
elementoDiagonal2 = C[2,2]

elementoDiagonal1 = elementoDiagonal1^n;
elementoDiagonal2 = elementoDiagonal2^n;

D = diag(c(elementoDiagonal1, elementoDiagonal2))

#Convertendo a matriz A^n para o sistema padrao:
E = B %*% (D %*% invB)
cat("Transformacao A aplicada n vezes (A^10) expressa no sistema padrao:\n")
print(E)