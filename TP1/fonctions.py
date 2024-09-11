def puissance(a, b):
    
# Vérification que les deux arguments sont des entiers
    if not type(a) is int or not type(b) is int:
        raise TypeError("Only integers are allowed")

    # Calcul de la puissance
    return a ** b


