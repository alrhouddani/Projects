import  sys
import clipboard
import json

#data = clipboard.paste()
#clipboard.copy("test")
#print(data)
#print(sys.argv)
#print(sys.argv)
#print(sys.argv[1:])

#save JSon

save_data = "clipboard.json"

def save_items(filepath, data):
    with open(filepath, "w") as f:
        json.dump(data, f)


#read Json

def load_items(filepath):
    try:
        with open(filepath, "r") as f:
             data = json.load(f)
             return data
    except:
        return{}


if len(sys.argv) == 2:
    command = sys.argv[1]
    data = load_items(save_data)
    
    if command == "save":
        key = input("Enter a key: ")
        data[key] = clipboard.paste()
        save_items(save_data, data )
        print("Data saved!!")
    elif command == "load":
          key = input("Enter a key: ")
          if key in data:
              clipboard.copy(data[key])
              print("Data is copied to clipboard")
    elif command == "list":
        print(data)
    else:
        print("unknown command")
else:
    print("Please type something else")

