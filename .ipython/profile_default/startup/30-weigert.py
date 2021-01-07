try:
    import gputools
    print("Imported gputools.")
except ModuleNotFoundError:
    print("Gputools not available in current environment.")

try:
    import stardist
    print("Imported stardist.")
except ModuleNotFoundError:
    print("Stardist not available in current environment.")
