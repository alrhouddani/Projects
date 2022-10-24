import sales
import sys

# Here we are importing the sales modules. When Python sees this it will look for a file names sales.py in the current folder.
# If it is not found it will look in other predetermined folders that come with Python installation.

# Here we can return the list of directories where Python will look for a module.
print(sys.path)
