import matplotlib.pyplot as plt
import numpy as np
import math

def mysteryFractal(n, big):
  if big==n:
    fix, ax = plt.subplots(figsize=(50, 50))
  if n==0:
    return
  else:
    for i in range(1, 2**n):
      plt.plot([i*(2**(-n)), i*(2**(-n))], [0, 2**(-n)], linewidth=.8)
    mysteryFractal(n-1, big)
mysteryFractal(13, 13)
plt.show()