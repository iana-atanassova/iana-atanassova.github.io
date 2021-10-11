# coding: utf8

# Un script qui permet de traiter un fichier .bbl et rendre tous les noms
# d'un auteur en gras. 

# NOM DU FICHIER
fname = "cv-07.bbl"

# LISTE DES NOMS DE L'AUTUER A METTRE EN GRAS
noms_gr = ["Iana", "Atanassova"]

# LISTE DES NOMS DE L'AUTUER A SOULIGNER
noms_soul = ["Youcef", "Morsi", "François-C.", "Rey", "Inés", "Hatira", "Camélia", "El Cadi"]

# lecture du fichier
f = open(fname)
txt = f.read()
f.close()

# remplacement des occurrences
for n in noms_gr :
	txt = txt.replace("family={" + n + "}", "family={\\textbf{" + n + "}}")
	txt = txt.replace("given={" + n + "}", "given={\\textbf{" + n + "}}")

for n in noms_soul :
	txt = txt.replace("family={" + n + "}", "family={\\underline{" + n + "}}")
	txt = txt.replace("given={" + n + "}", "given={\\underline{" + n + "}}")

# ecriture du fichier
f = open(fname, "w")
f.write(txt)
f.close()


