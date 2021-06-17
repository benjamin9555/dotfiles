import logging
import os
from IPython import get_ipython

logging.basicConfig(level=logging.INFO)

ipython = get_ipython()
ipython.magic("load_ext autoreload")
ipython.magic("autoreload 2")
ipython.magic("pylab")

print()

try:
    import numpy as np
    print("Imported numpy as np.")
except ModuleNotFoundError:
    pass
