setwd("L:/BUT/SD/Promo 2023/ahouy/Année 2/R-Projets")

#importation des fichiers
base1 = read.csv(file = "dpe-v2-logements-existants.csv", sep = ",",header = TRUE, dec = ".")
base2 = read.csv(file = "dpe-v2-logements-neufs.csv", sep = ",",header = TRUE, dec = ".")


#dimension des tableaux
dim(base1)
dim(base2)

#ajoute nouvelle colonne
base1$logement = "Ancien"
base2$logement = "Neuf"

base2$Année_construction = 2024

#fusion des tableaux avec les colonnes communes

col_communes=intersect(names(base1),names(base2))
base1=base1[  ,col_communes]
base2=base2[  ,col_communes]

base3=rbind(base1,base2)

#permet de recuperer les 4 premiers carractère de date reception
base3$Année = substr(base3$Date_réception_DPE,1,4) 


base3$Coût_total_des_usages= base3$Coût_chauffage + base3$Coût_éclairage + base3$Coût_refroidissement + base3$Coût_refroidissement + base3$Coût_auxiliaires

base3$Coût_total_des_usages == base3$Coût_total_5_usages

base3$Coût_chauffage_en_pourcent = (base3$Coût_chauffage/base3$Coût_total_5_usages)*100

base3$Periode_construction=ifelse(base3$Année_construction<= 1960 ,"Avant 1960",)

#creer une colonne avec des intervalles
base3$Periode_construction = cut(base3$Année_construction, breaks = c(1900,1960,1970,1980,1990,2000,2010,2100),
                                         labels = c("Avant 1960", "1961 - 1970", "1971 - 1980","1981 - 1990","1991 - 2000","2001 - 2010","Après 2010"))

head(base3$Année_construction)
head(base3$Periode_construction)

 repartition <- table(base3$Etiquette_DPE)

# Afficher les résultats
print(repartition)

# Calculer le pourcentage de chaque type de logement
pourcentage <- prop.table(repartition) * 100
print(pourcentage)

#filtre

appartements <- subset(base3, Type_bâtiment == "appartement")

print(appartements)

etiquette = subset(base3, base3$Etiquette_DPE == c("D","E","F","G"))



#Agrégation

aggregate(base3$Coût_chauffage ~ base3$Etiquette_DPE, base3 =base3, FUN=mean)

