# 19 Polymorphism

from abc import ABC, abstractmethod


class UIControl(ABC):
    @abstractmethod
    def draw(self):
        pass


class TextBox(UIControl):
    def draw(self):
        print("TextBox")


class DropDownList(UIControl):
    def draw(self):
        print("DropDownList")


ddl = DropDownList()
print(isinstance(ddl, UIControl))

tb = TextBox()
print(isinstance(tb, UIControl))


def draw(controls):
    for control in controls:
        control.draw()


draw([ddl, tb])
