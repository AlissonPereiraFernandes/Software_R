base = read.csv('credit_data.csv') # carregando dados
base$clientid = NULL # apagar variável
summary(base) # toda parte descritiva da base de dados

# TRATAMENTO DOS VALORES INCONSISTENTES #
idade_invalida = base[base$age < 0 & !is.na(base$age), ] # !is.na trás todos os dados que não são nulos

# COMO TRATAR OS VALORES 'NA' #

# apagar a coluna inteira
base$age = NULL

# apagar somente os registros com problemas 
base = base[base$age > 0, ]

# preencher os dados manualmente

# CALCULAR A MÉDIA DE IDADE #
mean(base$age, na.rm = TRUE)
media_dados = mean(base$age[base$age >0], na.rm = TRUE)

# CONDICIONAL PARA CETAR A MÉDIA EM VALORES NEGATIVOS #
base$age = ifelse(base$age < 0, 40.92, base$age)

# TRATANDO OS VALORES 'NA' #
base[is.na(base$age), ]
base$age = ifelse(is.na(base$age), media_dados, base$age)
base[is.na(base$age), ]


# ESCALONAMENTO DE ATRIBUTOS #
base[, 1:3] = scale(base[, 1:3])

# INSTALAÇÃO DO PACOTE PARA DIVISÃO DOS DADOS #
install.packages('caTools')
library(caTools)
set.seed(1)

divisao = sample.split(base$default, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)
