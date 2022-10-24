

class Text(str):
    def duplicate(self):
        return self + self


text = Text("Python")
print(text.duplicate())


class TackableList(list):
    def append(self, object):
        print("Append called")
        super().append(object)


list = TackableList()
list.append("1")
