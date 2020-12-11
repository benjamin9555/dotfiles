import logging
import os

print()

try:
    import numpy as np
    print("Imported numpy.")
except ModuleNotFoundError:
    print("Numpy not available in current environment.")
