import logging
import os

print()

try:
    import numpy as np
    print("Imported numpy as np.")
except ModuleNotFoundError:
    print("Numpy not available in current environment.")
