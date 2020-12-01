try:
    import gunpowder as gp
    print("Imported gunpowder.")
except ModuleNotFoundError:
    print("Gunpowder not available in current environment.")

try:
    import daisy
    print("Imported daisy.")
except ModuleNotFoundError:
    print("Daisy not available in current environment.")
