#coloque no vetor abaixo as raizes do polinômio a ser encontrado:
raizes = c(2, -3, 3)
n = length(raizes)
cat("Raizes: ", raizes, "\n")

#encontrando o termo independente a0 do polinomio:
raizes = -1 * raizes
a0 = 1
for(i in 1:n){
  a0 = a0 * raizes[i]
}
cat("Termo independente do polinômio: ", a0, "\n\n")

#encontrando o matriz de coeficientes do sistema linear onde as incognitas sao os coeficientes do polinomio. Essa matriz sera formada pela substituição das raizes no lugar de x do polinomio, uma raiz em cada linha:
raizes = -1 * raizes
A = matrix(0, nrow=n, ncol=n, byrow=TRUE)
for(i in 1:n){
  k = n
  for(j in 1:n){
    A[i,j] = raizes[i]^k
    k = k - 1
  }
}
cat("Matriz com as raizes substituidas no x do polinomio, uma raiz em cada linha:", "\n\n")
print(A)

#encontraremos os coeficientes do polinomio ao resolver o sistema A * a = Te, onde R é a matriz acima. A é o vetor dos coeficientes do polinômio. Te é o vetor com n copias do termo independete a0 do polinômio, que passou para a direita da equação com o sinal trocado.
Te = matrix(-a0, nrow=n, ncol=1)
a = solve(A, Te)
cat("\n","Coeficientes do polinômio:", "\n\n")
print(a)
cat("\n","Polinômio:", "\n\n")
k = n
for(i in 1:n){
  cat("(",a[i,1],")","x ^",k,"+ ")
  if(i == n){
    cat("(",a0,") = 0")
  }
  k = k - 1
}