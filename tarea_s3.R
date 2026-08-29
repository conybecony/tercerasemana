# Autor:Constanza Pinilla
# Fecha:Agosto 2026
# Qué hace: ver la proporcion de cuánto ingreso se va en arriendo

# 1
ingreso <- c( 500000, 600000, 700000, 1000000) # ingreso mensual
arriendo <- c( 100000, 250000, 300000, 400000) # arriendo mensual
anio <- c( 2020, 2021, 2022, 2023) # rango de años 
class(ingreso) # verificar que sea número "numeric"
class(arriendo) # verificar que sea número "numeric"
class(anio) # verificar que sea número "numeric"
length(ingreso) # verificar la extensión del vector 4
length(arriendo) # verificar la extensión del vector 4
length(anio) # verificar la extensión del vector 4

#2
ingreso[3] # tercer elemento del vector ingreso 
anio[c(1, 2, 4)] # primer, segundo y cuarto elemento del vector anio
arriendo[-1] # todos los elementos menos el primero

#3
ingreso >= 700000 # FALSE FALSE  TRUE  TRUE
sum(ingreso >= 700000) # 2
mean(ingreso >= 700000) # 0.5

#4
proporcion_arriendo_mensual <- (arriendo/ingreso) *100


#5  
mean(proporcion_arriendo_mensual) # el promedio de cuánto del ingreso se va al arriendo es de 36.13095% 
median(proporcion_arriendo_mensual) # la mediana de cuánto del ingreso se va al arriendo es de 40.83333% 
sd(proporcion_arriendo_mensual)  # la desviación estándar de cuánto del ingreso se va al arriendo es de 10.81762% 
quantile(proporcion_arriendo_mensual) # en q1, el 25% gasta entre 20% y el 35% de su ingreso en arriendo, el q2, el 50%, gasta hasta el 40.83333% en arriendo, etc. 

#6
# En el bloque 1 se crean tres vectores relacionados, cada arriendo 
# se paga con ingresos en el año, además se verifica la clase y longitud 
# porque es necesario comprobar que los datos tienen la categoría correcta y 
# que todas las variables contienen la misma cantidad de observaciones.

# En el bloque 2 se seleccionan posiciones ya que permite revisar casos concretos.

# En el bloque 3 se identifica qué números son en el ingreso superior o igual a ese nivel dentro de la muestra
# y esto da valores de verdadero y falso, además de con los demás comandos podemos ver el promedio y la suma de esos true or false.

# En el bloque 4 se calcula la proporción de cuanto es el porcentaje de ingreso que se gasta en arriendo
# porque conocer el porcentaje permite interpretar el resultado de lo que investigamos.

# En el bloque 5 calculamos la media para concer el promedio, la mediana para el valor de al medio,
# desviación estándar, qué tan dispersos está la proporción respecto al promedio 
# y cuartiles porque queremos conocer cómo se distribuyen los valores que 
# representan al 25%, 50% y 75% de la muestra.
# todo eso permite obtener una visión más completa de la situación económica.


















