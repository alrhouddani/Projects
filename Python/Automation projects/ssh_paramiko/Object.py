class Dog:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def get_name(self):
        return self.name

    def add_one(self, x):
        return x + 1

    def meow(self):
        return "meow"

    def bark(self):
        print("bark")


d = Dog("tim")
ds = Dog("bill")
print(d.name)
print(ds.name)
