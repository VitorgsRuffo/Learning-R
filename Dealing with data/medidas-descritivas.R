#Calculando medidas descritivas para um conjunto de dados:

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
    variancia =  variancia + ((conjuntoDeDados[i] - media)^2)
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

#Exercicio 2:

#conjuntoDeDados1 = runif(100, 73.5, 78.5)
conjuntoDeDados1 = c(1.8, 1.1, 3.2, 1.4, 
                     2.5, 1.7, 15.1, 1.8,
                     0.4, 1.2, 2.1, 2.0,
                     1.9, 2.3, 1.4, 1.1, 
                     4.4, 1.9, 0.5, 1.0, 
                     2.2, 0.8, 0.9, 0.8, 
                     3.5, 1.5, 1.7, 0.2, 
                     1.7, 0.5, 0.9, 1.4, 
                     0.8, 1.4, 2.1, 3.7)

conjuntoDeDados1 = sort(conjuntoDeDados1)
cat("Conjunto de dados 1:", conjuntoDeDados1)

media1 = calcularMedia(conjuntoDeDados1)
cat("\nmedia 1:", media1)

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
    "\nquartil do meio 1: ", quartilMeio1)