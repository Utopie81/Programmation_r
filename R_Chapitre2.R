install.packages(c("httr", "jsonlite"))


library(httr)
library(jsonlite)

base_url <- "https://data.ademe.fr/data-fair/api/v1/datasets/dpe-v2-logements-existants/lines"
# Paramètres de la requête
params <- list(
  page = 1,
  size = 10000,
  q = "69360",
  q_fields = "Code_postal_(BAN)"
  #qs = "Date_réception_DPE:[2024-01-01 TO 2024-01-31]"
) 

# Encodage des paramètres
url_encoded <- modify_url(base_url, query = params)
print(url_encoded)

# Effectuer la requête
response <- GET(url_encoded)

# Afficher le statut de la réponse
print(status_code(response))

# On convertit le contenu brut (octets) en une chaîne de caractères (texte). Cela permet de transformer les données reçues de l'API, qui sont généralement au format JSON, en une chaîne lisible par R
content = fromJSON(rawToChar(response$content), flatten = FALSE)

# Afficher le nombre total de ligne dans la base de données
print(content$total)

# Afficher les données récupérées
df <- content$result
dim(df)
View(df)

Rhone69_moins10000 = c(69790, 69170, 69250, 69380, 69004, 69780, 69360, 69124, 69580, 69720, 69960, 69320, 69800, 69140, 69330, 69970, 69730, 69740, 69150, 69680, 69510, 69390, 69910, 69640,
                       69770, 69430, 69820, 69460, 69120, 69420, 69670, 69890, 69620, 69240, 69160, 69220, 69440, 69490, 69700, 69560, 69590, 69270, 69870, 69210, 69850, 69930, 69690, 69550, 
                       69650, 69830, 69290, 69230, 69610, 69110, 69190, 69450, 69370, 69280, 69470, 69480, 69530, 69310, 69600, 69350, 69860, 69760, 69840, 69540, 69520, 69340, 69130, 69570, 
                       69660, 69115, 69260, 69410, 69630, 69300, 69500, 69126)

Rhone69_plus10000 = 69200, 69400, 69100, 69003, 69002,69001,69005,69007,69006,69008,69009,


