#Definindo a matriz que queremos encontrar a inversa:
A = matrix(c(25,5,1,64,8,1,144,12,1), nrow=3, ncol=3, byrow=TRUE)
D = dim(A)[1]
print("Matriz A:")
print(A)
#Fatorar A em LU:
L = matrix(c(1,0,0,2,1,0,2,2,1), nrow=3, ncol=3, byrow=TRUE)
#L tem a mesma dimensao que A.
#colocamos um valor qualquer (2) abaixo da diagonal principal de L (Depois sera substituido pelos multiplicadores)
U = A
fimI = D-1
for (i in 1:fimI){
  pivo = U[i, i]
  inicioJ = i+1
  for(j in inicioJ:D){
    multiplicador = (U[j, i])/pivo
    L[j, i] = multiplicador
    U[j, ] = U[j, ] - (multiplicador * U[i, ]) 
  }
}
#print(U)
#print(L)
#Encontrando a Inversa de A (B):
I = diag(D)
B = matrix(nrow=D, ncol=D)
for(i in 1:D){
  Ii = cbind(I[, i])
  Z = solve(L, Ii);
  B[, i] = solve(U, Z)
}
print("Inversa de A")
print(B)