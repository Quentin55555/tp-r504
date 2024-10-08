# prog1.py
import fonctions as f  # Importation du module contenant la fonction puissance

# Saisie des valeurs de a et b par l'utilisateur
a = input("Veuillez entrer la valeur (a) : ")
b = input("Veuillez entrer l'exposant (b) : ")

try:
    # Convertir les valeurs saisies en entiers
    a = int(a)
    b = int(b)

    # Appel de la fonction puissance à partir du module 'fonctions'
    res = f.puissance(a, b)

    # Affichage du résultat
    print(f"Le résultat de {a} à la puissance {b} est {res}.")

except ValueError:
    # Gestion de l'erreur si la conversion en entier échoue
    print("Erreur : Les valeurs doivent être des entiers.")

except TypeError as e:
    # Gestion de l'erreur si la fonction puissance lève une exception TypeError
    print(f"Erreur : {e}")

