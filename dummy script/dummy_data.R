# Este script gera 3 datasets: info agências, faixas de incentivos e registro de receitas.
# Os dados gerados aqui são apenas simulações para permitir a criação de gráficos e dashboard de forma preliminar.
# Esses dados utilizam valores aleatórios dentro de distribuições realistas, quando possível.
set.seed(1)

# Informações de Agência
# Campos: agência, cliente, anúncio (chave)
n <- 1000
agencia <- sample(LETTERS[1:10],n, replace = TRUE)
cliente <- sample(1:50,n, replace = TRUE)
anuncio <- seq(1000, 1999, by=1)
info_agencia <- data.frame(agencia,cliente,anuncio)
write.csv(info_agencia,"info_agencia.csv",row.names=FALSE)

# Faixas de Incentivos
# Campos: agência, limite inferior, limite superior, índice
faixa_incentivos <- data.frame()
for (item in unique(agencia)) {
  faixas <- sample(3:10,1)
  max_indice <- runif(1,min=10,max=20)
  limite_inferior <- seq(1, 100, length.out=faixas)
  limite_superior <- append(seq(1, 100, length.out=faixas)[-1],999)
  indices <- seq(sample(1:3,1), max_indice, length.out=faixas)
  tmp <- data.frame(item,limite_inferior,limite_superior,indices)
  faixa_incentivos <- rbind(faixa_incentivos,tmp)
}
write.csv(faixa_incentivos,"faixa_incentivos.csv",row.names=FALSE)

# Registro de Receitas
# Campos: anúncio (chave), plataforma, data, receita
receita_media <- 1000000
plataforma <- sample(c("X","Y","Z"),n,replace = TRUE)
receita <- rnorm(n,mean=1000000,sd=500000)
data_mes <- sample(month.name,n,replace = TRUE)
data_ano <- sample(c("2021","2022"),n,replace=TRUE)
registro_receitas <- data.frame(anuncio,plataforma,data_mes,data_ano,receita)
write.csv(registro_receitas,"registro_receitas.csv",row.names=FALSE)