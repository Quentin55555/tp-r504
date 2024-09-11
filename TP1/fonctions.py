def puissance(a, b):
    # Vérification que les deux arguments sont des entiers
    if not isinstance(a, int) or not isinstance(b, int):
        raise TypeError("Only integers are allowed")

    # Calcul de la puissance
    return a ** b




