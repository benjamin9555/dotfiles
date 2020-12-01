try:
    import torch
    print("Imported torch.")
except ModuleNotFoundError:
    print("Torch not available in current environment.")
