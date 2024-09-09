print("COUCOU TOI")

# prog1.py
import fonctions as f

# Saisie des valeurs de a et b par l'utilisateur
a = int(input("Veuillez entrer la base (a) : "))
b = int(input("Veuillez entrer l'exposant (b) : "))

# Appel de la fonction puissance à partir du module 'fonctions'
res = f.puissance(a, b)

# Affichage du résultat
print(f"Le résultat de {a} à la puissance {b} est {res}.")





