import logging
import os
from IPython import get_ipython

ipython = get_ipython()
ipython.magic("load_ext autoreload")
ipython.magic("autoreload 2")

print()

try:
    import numpy as np
    print("Imported numpy as np.")
except ModuleNotFoundError:
    print("Numpy not available in current environment.")
