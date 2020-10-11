#Nome: Vitor G. S. Ruffo

#Exercicio 1:

#observacoesPorClasse: vetor onde cada posicao representa uma classe e o 
#valor de cada posicao representa o numero de observacoes para aquela classe.
calcularFrequenciasRelativasAcumuladas = function(observacoesPorClasse, 
                                                  totalDeObservacoes){
  numeroDeClasses = length(observacoesPorClasse)
  
  #a primeira coluna vai conter as frequencias relativas acumuladas
  #em sua forma numerica. Ja a segunda coluna vai conter esses 
  #mesmos valores representados em porcentagem:
  frequenciasRelativasAcumuladas = 
    matrix(0, nrow=numeroDeClasses, ncol=2)
  
  for(i in 1:numeroDeClasses){
    
    if(i-1 > 0){
      frequenciasRelativasAcumuladas[i, 1] = frequenciasRelativasAcumuladas[i-1, 1] + observacoesPorClasse[i]
      frequenciasRelativasAcumuladas[i, 2] = frequenciasRelativasAcumuladas[i-1, 2] + ((observacoesPorClasse[i] / totalDeObservacoes) * 100)
      
    }else{
      frequenciasRelativasAcumuladas[i, 1] = observacoesPorClasse[1]
      frequenciasRelativasAcumuladas[i, 2] = (observacoesPorClasse[1] / totalDeObservacoes) * 100
    }
  }
  
  return(frequenciasRelativasAcumuladas)
}

#Para o seguinte conjunto de dados: {4.3, 5.1, 5.7, 6.1, 6.3, 7.1, 7.6}
#e para as seguintes classes: 4|-5; 5|-6; 6|-7; 7|-8
#podemos chamar a funcao acima do seguinte modo:

observacoesPorClasse = c(1, 2, 2, 2)
totalDeObservacoes = 7

frequenciasRelativasAcumuladas = 
  calcularFrequenciasRelativasAcumuladas(observacoesPorClasse, 
                                         totalDeObservacoes)

cat("Saida exercicio 1: \n\n")
print(frequenciasRelativasAcumuladas)


#Exercicio 2:

#Funcoes para o calculo de medidas descritivas:

calcularMedia = function(conjuntoDeDados){
  tamanhoDoConjuntoDeDados = length(conjuntoDeDados)
  media = 0;
  
  for(i in 1:tamanhoDoConjuntoDeDados){
    media = media + conjuntoDeDados[i]
  }
  media = media / tamanhoDoConjuntoDeDados
  
  return(media)
}

calcularDesvioPadrao = function(conjuntoDeDados, media){
  tamanhoDoConjuntoDeDados = length(conjuntoDeDados)
  variancia = 0;
  
  for(i in 1:tamanhoDoConjuntoDeDados){
    variancia =  variancia + (conjuntoDeDados[i] - media)^2
  }
  variancia =  variancia / (tamanhoDoConjuntoDeDados - 1)
  
  desvioPadrao = sqrt(variancia)
  return(desvioPadrao)
}

calcularPosicaoQuartilInferior = function(tamanhoDoConjuntoDeDados){
  posicao = (tamanhoDoConjuntoDeDados + 1) / 4
  return(posicao)
}

calcularPosicaoQuartilSuperior = function(tamanhoDoConjuntoDeDados){
  posicao = (3 * (tamanhoDoConjuntoDeDados + 1)) / 4
  return(posicao)
}

calcularPosicaoQuartilMeio = function(tamanhoDoConjuntoDeDados){
  posicao = (tamanhoDoConjuntoDeDados + 1) / 2
  return(posicao)
}

calcularQuartil = function(conjuntoDeDados, calcularPosicaoQuartil){
  tamanhoDoConjuntoDeDados = length(conjuntoDeDados)
  posicao = calcularPosicaoQuartil(tamanhoDoConjuntoDeDados)
  decimal = posicao %% 1
  
  mediana = 0;
  if(decimal == 0){ #resultado da divisao nao e fracionario
    mediana = conjuntoDeDados[posicao]
    
  }else{ #divisao é um numero real, portanto, a mediana sera a media entre os dois valores cujas posicões são vizinhas a essa posicao fracionaria que encontramos.
    posicaoAnterior = floor(posicao)
    posicaoPosterior = ceiling(posicao)
    
    valoresVizinhos = c(conjuntoDeDados[posicaoAnterior], conjuntoDeDados[posicaoPosterior])
    mediana = calcularMedia(valoresVizinhos)    
  }
  
  return(mediana)
}

conjuntoDeDados1 = runif(100, 73.5, 78.5)
conjuntoDeDados1 = sort(conjuntoDeDados1)

cat("\n\nSaida exercicio 2: ")
cat("\n\nConjunto de dados 1:\n", conjuntoDeDados1)

media1 = calcularMedia(conjuntoDeDados1)
cat("\n\nmedia 1:", media1)

desvioPadrao1 = calcularDesvioPadrao(conjuntoDeDados1, media1)
cat("\ndesvio padrao 1:", desvioPadrao1)

mediana1 = calcularQuartil(conjuntoDeDados1, calcularPosicaoQuartilMeio)
cat("\nmediana 1:", mediana1)

quartilInferior1 = calcularQuartil(conjuntoDeDados1, calcularPosicaoQuartilInferior)
quartilSuperior1 = calcularQuartil(conjuntoDeDados1, calcularPosicaoQuartilSuperior)
quartilMeio1 = mediana1

cat("\nquartil inferior 1: ", 
    quartilInferior1, 
    "\nquartil superior 1: ", 
    quartilSuperior1,
    "\nquartil do meio 1: ", mediana1)

par(mar=c(1,1,1,1))
par(mfrow = c(2,2))

hist(conjuntoDeDados1,
      main="Histograma para o conjunto de dados 1",
      xlab="temperatura do leite em graus celsius",
      ylab="frequência",
      xlim=c(73.5, 78.5),
      ylim=c(0, 50),
      breaks=c(73.5,74.5,75.5,76.5,77.5,78.5),
      col="darkmagenta")

boxplot(conjuntoDeDados1,
        main="Diagrama de caixas para o conjunto de dados 1",
        ylab="temperatura do leite em graus celsius",
        col = "chocolate",
        border = "black")

conjuntoDeDados2 = runif(1000, 73.5, 78.5)
conjuntoDeDados2 = sort(conjuntoDeDados2)
cat("\n\nConjunto de dados 2:\n", conjuntoDeDados2)

media2 = calcularMedia(conjuntoDeDados2)
cat("\n\nmedia 2:", media2)

desvioPadrao2 = calcularDesvioPadrao(conjuntoDeDados2, media2)
cat("\ndesvio padrao 2:", desvioPadrao2)

mediana2 = calcularQuartil(conjuntoDeDados2, calcularPosicaoQuartilMeio)
cat("\nmediana 2:", mediana2)

quartilInferior2 = calcularQuartil(conjuntoDeDados2, calcularPosicaoQuartilInferior)
quartilSuperior2 = calcularQuartil(conjuntoDeDados2, calcularPosicaoQuartilSuperior)
quartilMeio2 = mediana2

cat("\nquartil inferior 2: ", 
    quartilInferior2, 
    "\nquartil superior 2: ", 
    quartilSuperior2,
    "\nquartil do meio 2: ", mediana2)

informacoesConjuntoDeDados2 = hist(conjuntoDeDados2,
     main="Histograma para o conjunto de dados 2",
     xlab="temperatura do leite em graus celsius",
     ylab="frequência",
     xlim=c(73.5, 78.5),
     ylim=c(0, 500),
     breaks=c(73.5,74.5,75.5,76.5,77.5,78.5),
     col="darkmagenta")

boxplot(conjuntoDeDados2,
        main="Diagrama de caixas para o conjunto de dados 2",
        ylab="temperatura do leite em graus celsius",
        col = "chocolate",
        border = "black")


#Exercicio 3:

cat("\n\nSaida exercicio 3: ")
cat("\n\nPercentis do conjunto de dados 1: \n")
print(quantile(conjuntoDeDados1, seq(0.1,0.9,0.1)))


#Exercicio 4:

observacoesPorClasse = informacoesConjuntoDeDados2$counts
totalDeObservacoes = 1000

frequenciasRelativasAcumuladas = 
  calcularFrequenciasRelativasAcumuladas(observacoesPorClasse, 
                                         totalDeObservacoes)

cat("\n\nSaida exercicio 4:\n\n")
print(frequenciasRelativasAcumuladas)