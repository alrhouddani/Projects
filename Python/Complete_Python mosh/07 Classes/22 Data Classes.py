
from collections import namedtuple


class Point:
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z


p1 = Point(1, 2, 3)
p2 = Point(1, 2, 3)

Point_t = namedtuple("Point", ['x', "y", "z"])
p4 = Point_t(x=1, y=2, z=3)
p5 = Point_t(x=1, y=2, z=3)
print(p4 == p5)
print(p4)
print(p4.x)
