base = read.csv('risco_credito.csv')

install.packages('e1071')
library(e1071)

classificador = naiveBayes(base[-5], y=base$risco)
print(classificador)

# historia: boa, divida: alta, garantia: nenhuma, renda: >35
# histora: ruim, divida: alta, garantia: adequada, renda: <15

prever_risco = function(classificador, historia, divida, garantia, renda) {
  df = data.frame(
    historia = historia,
    divida = divida,
    garantia = garantia,
    renda = renda
  )
  previsao = predict(classificador, newdata = df, type = 'raw')
  return(previsao)
}

previsao_1 = prever_risco(classificador, 'boa', 'alta', 'nenhuma', 'acima_35')
print(previsao_1)

# historia = c('boa')
# divida = c('alta')
# garantia = c('nenhuma')
# renda = c('acima_35')
# df = data.frame(historia, divida, garantia, renda)
# 
# previsao = predict(classificador, newdata = df, 'raw')
# print(previsao)
# 
# historia = c('ruim')
# divida = c('alta')
# garantia = c('adequada')
# renda = c('0_15')
# df_2 = data.frame(historia, divida, garantia, renda)
# 
# previsao_2 = predict(classificador, newdata = df_2, 'raw')
# print(previsao_2)
