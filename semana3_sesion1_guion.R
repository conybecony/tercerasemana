# =============================================================================
# GUION DE CLASE — Semana 3 · Sesión 1: Tipos de Datos
# Fundamentos de Programación para Análisis Económico · UdeC-EAN
#
# Nombre: Constanza Pinilla     Fecha: 25-08-2026
#
# CÓMO USAR ESTE ARCHIVO (síguelo junto al profesor):
#   - Ubica cada bloque por su título: vamos en el mismo orden que las slides.
#   - Corre cada línea con  Cmd+Enter (Mac) / Ctrl+Enter (Windows).
#   -  🔵 CORRE Y OBSERVA  -> ya está escrito; córrelo y anota lo que ves.
#   -  ✏️ COMPLETA          -> reemplaza los ____ antes de correr.
#   -  🔮 PREDICE           -> escribe tu respuesta ANTES de ejecutar.
#   -  🟢 TU TURNO          -> mini-reto que resuelves solo/a (2 min).
#   -  ✅ Deberías ver      -> output esperado, para confirmar que vas bien.
#   - Escribe tus dudas como comentarios  # ASÍ  para no perderlas.
# =============================================================================


# -----------------------------------------------------------------------------
# BLOQUE A — El tipo decide qué se puede hacer
# -----------------------------------------------------------------------------
# Cada valor en R tiene un TIPO, y el tipo determina qué operaciones son válidas.

# 🔮 PREDICE: ¿qué entrega cada una de estas tres líneas? (escríbelo aquí abajo)
#   2000 + 500   ->
#   "Ñuble" + 1  ->
#   TRUE + TRUE  ->

# 🔵 CORRE Y OBSERVA: ahora ejecútalas y compara con tu predicción.
2000 + 500        # numeric + numeric
"Ñuble" + 1       # ¿qué pasa al sumar texto + número?
TRUE + TRUE       # un logical se trata como 1/0

# ✅ Deberías ver: 2500 ... un Error ... y 2
# 💡 Idea clave: TRUE = 1 y FALSE = 0. Por eso podremos CONTAR con condiciones.


# -----------------------------------------------------------------------------
# BLOQUE B — Los cinco tipos fundamentales
# -----------------------------------------------------------------------------

## B.1  numeric — la columna vertebral del análisis ---------------------------
# 🔵 CORRE Y OBSERVA
salario <- 850000
ipc     <- 1.043
salario / ipc        # salario real (ajustado por inflación)
log(salario)         # log-ingreso (uso típico en econometría)

# 🟢 TU TURNO: crea `tasa_crecimiento <- 0.032` y calcula el PIB de 12000 mil
#    millones creciendo a esa tasa (pista: pib * (1 + tasa)).



## B.2  character — texto y etiquetas -----------------------------------------
# El texto SIEMPRE va entre comillas. No se suma; se manipula.
# 🔵 CORRE Y OBSERVA
region <- "Ñuble"
sector <- "Agricultura"
paste(sector, "-", region)    # pega textos
nchar(region)                 # cuenta caracteres

# ✏️ COMPLETA: pon en mayúsculas el nombre de la región (pista: toupper()).
____(region)


## B.3  logical — verdadero/falso y el poder de contar ------------------------
# Nacen de comparaciones: >  <  ==  !=  >=
# 🔵 CORRE Y OBSERVA
ingreso       <- c(120000, 480000, 350000, 90000)
linea_pobreza <- c(216000)
ingreso < linea_pobreza        # un TRUE/FALSE por persona (TRUE = bajo la línea)
ingreso > linea_pobreza 
ingreso == linea_pobreza  # igual
ingreso != linea_pobreza  # diferente
ingreso <= linea_pobreza # menor igual

# 🔮 PREDICE: ¿cuánto darán estas dos líneas?  sum(...) ->     mean(...) ->
sum(ingreso < linea_pobreza)   # ¿cuántos bajo la línea?
mean(ingreso < linea_pobreza)  # ¿qué proporción? (= tasa de pobreza)

# ✅ Deberías ver: 2  y  0.5
# 💡 El patrón sum()/mean() de una condición es de los MÁS usados en economía.


## B.4  factor — categorías con orden -----------------------------------------
# Para categorías con niveles finitos y conocidos. Puede tener ORDEN.
# 🔵 CORRE Y OBSERVA
niveles <- c("media", "superior", "básica", "media", "básica")
educ <- factor(niveles,
               levels  = c("básica", "media", "superior"),
               ordered = TRUE)
levels(educ)         # las categorías posibles, en orden
educ < "superior"    # el orden permite comparar
sum(educ< "superior")
mean(educ< "superior")*100
paste(mean(educ< "superior")*100, "%")
# 🟢 TU TURNO: crea un factor ordenado `nse` con niveles "bajo","medio","alto"
#    para el vector c("medio","alto","bajo","alto").



## B.5  Date — el tiempo como dato --------------------------------------------
# Las fechas NO son texto: R las entiende como días -> se pueden restar y ordenar.
# 🔵 CORRE Y OBSERVA
# Primero le decimos a R que muestre los meses en español:
suppressWarnings(Sys.setlocale("LC_TIME", "es_ES.UTF-8"))   # Windows: "Spanish"

fecha <- as.Date("2026-03-31")
class(fecha)                     # "Date"
fecha - as.Date("2026-01-01")    # diferencia en días
format(fecha, "%B %Y")           # "marzo 2026"  (gracias al locale de arriba)

# ✏️ COMPLETA: ¿cuántos días faltan desde hoy hasta el 2026-12-31?
as.Date("2026-12-31") - Sys.Date()   # pista: Sys.Date() entrega la fecha de hoy


# -----------------------------------------------------------------------------
# BLOQUE C — Conversión entre tipos (as.*)
# -----------------------------------------------------------------------------
# Convertir ("castear") = pasar un valor de un tipo a otro de forma EXPLÍCITA.

estado_civil <- c("casado", "viudo", "casado", "soltero", "soltero", "soltero")
civil_factor <- factor(estado_civil,
                       levels = c("soltero", "casado", "viudo"))
as.factor(estado_civil)
class(as.factor(estado_civil))


# 🔵 CORRE Y OBSERVA
poblacion <- "480609"            # ojo: es TEXTO (entre comillas)
as.numeric(poblacion) + 1        # primero convierto, luego sumo

# 🔮 PREDICE: ¿qué entrega esta línea? ¿saldrá error o algo más?
as.numeric(c("12", "x", "30"))

# ✅ Deberías ver: 12  NA  30  + un warning (la "x" no es número -> NA)
# 💡 Convertir texto no-numérico NO da error: da NA. Hay que anticiparlo.

# Caso real (CASEN/encuestas): separadores y códigos de "no responde"
# 🔮 PREDICE: ¿qué pasa con "s/i" y con "90.000"? (¡ojo, NO les pasa lo mismo!)
ingresos_crudos <- c("120000", "350000", "s/i", "90.000")
class(ingresos_crudos)
as.numeric(ingresos_crudos)
# ✅ Deberías ver: 120000 350000 NA 90  -> "s/i" se vuelve NA, pero "90.000"
#    se vuelve 90 (¡no NA!): R lee el "." como decimal. Error SILENCIOSO.

# Coerción automática: en un vector TODO comparte un solo tipo.
# 🔮 PREDICE: ¿de qué tipo queda cada vector?
c(1, 2, "tres")                  # -> texto
c(TRUE, 5, 10)                   # -> numeros
# 💡 Por eso UNA celda de texto vuelve TODA la columna texto.


# -----------------------------------------------------------------------------
# BLOQUE D — Verificación: pregúntale a R qué tipo es
# -----------------------------------------------------------------------------
# Hábito profesional: ANTES de operar, verifica el tipo.
# 🔵 CORRE Y OBSERVA
x <- c(120000, 480000, 350000)
class(x)        # tipo de alto nivel (lo que normalmente importa) numerica,  categorica
typeof(x)       # representación interna dentro de la categoria double o entero
is.numeric(x)   # pregunta sí/no, ideal para chequeos
str(x)          # resumen compacto

# 🟢 TU TURNO: usa class() y is.* para verificar el tipo de `region`, `educ`
#    y `fecha` que creaste más arriba.



# -----------------------------------------------------------------------------
# CIERRE — en una línea: "el tipo decide qué puedes hacer; verifica antes de calcular."
#
# Próxima sesión: VECTORES y SUBSETTING (juntar estos valores en colecciones).
# A1 (formativa, sin nota): script con vectores creados, manipulados y documentados.
# =============================================================================
