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
# se paga con ingresos en el añio, además se verifica la clase y longitud 
# porque es necesario comprobar que los datos tienen la categoría correcta y 
# que todas las variables contienen la misma cantidad de observaciones.

# En el bloque 2 se seleccionan posiciones ya que permite revisar casos concretos.

# En el bloque 3 se identifica qué proporción en el ingreso superior o igual a ese nivel dentro de la muestra.

# En el bloque 4 se calcula la proporción además de la cantidad porque conocer el porcentaje
# permite interpretar el resultado en relación con el total de trabajadores.

# Se calcula el salario real porque el salario nominal no considera los efectos
# de la inflación y, por lo tanto, puede sobreestimar el poder adquisitivo.

# Se calculan distintas estadísticas porque el promedio por sí solo no permite
# conocer completamente cómo están distribuidos los salarios.

# Se utiliza la media para conocer el nivel salarial promedio de la muestra,
# mientras que la mediana permite identificar el valor central sin que los
# salarios muy altos influyan tanto en el resultado.

# Se calcula la desviación estándar porque permite evaluar qué tan diferentes
# son los salarios entre los trabajadores respecto del promedio.

# Se calculan los cuantiles porque permiten observar la distribución de los
# salarios y comparar los niveles de ingreso entre distintos grupos de la muestra.



















