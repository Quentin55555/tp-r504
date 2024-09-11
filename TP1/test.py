import pytest
import fonctions as f

def test_1():
    # Tests avec des valeurs positives
    assert f.puissance(2, 3) == 8
    assert f.puissance(2, 2) == 4

def test_2():
    # Tests avec des valeurs négatives
    assert f.puissance(-2, 3) == -8   # -2^3 = -8
    assert f.puissance(-2, 2) == 4    # -2^2 = 4
    assert f.puissance(2, -3) == 0.125 # 2^-3 = 1/8 = 0.125
    assert f.puissance(-2, -2) == 0.25 # -2^-2 = 1/4 = 0.25



