
from timeit import timeit
from pprint import pprint
from array import array
from collections import deque
from ast import Lambda
from audioop import reverse
import math
from operator import index
import py_compile
from re import U
from tkinter import Y
from unittest import result
from xml.sax import xmlreader


x = 5 * 17
print(x)
# python -m py_compile all11.py

m = U

x = 10
y = 15
print(y > x)
print("th")

# ----
studnes = 1000
course = "python for everyone"
print(len(course))
course[0:]
# /""
# /"
# //
# /n new line
z = "thi is a /'tesr"

first = "abdellah"
last = " Rhouddani"
full = first + last
print(full)
full = first + " " + last
full = f"{first} {last}"
# ep 6 folder 2
course = "   python programming    "
print(course.upper())
print(course.capitalize())
print(course.lower())
print(course.title())
print(course.strip())
print(course.find("pro"))
print(course.replace("p", "j"))
print("pro" in course)
print("swift" not in course)
# ep 7 forlder 2
x = 1
x = 1.1
x = 1 + 2j
print(10 + 3)
print(10 - 3)
print(10 * 3)
print(10 / 3)
print(10 // 3)
print(10 % 3)
print(10 ** 3)
x = 10
x = x+3
x += 3
# ep 8 folder 2
round
print(round(2.6))
print(abs(-2.9))
print(math.ceil(2.2))
print(math.comb(2.2))
# https://docs.python.org/3/library/math.html
# ep 9 folder 2

x = input("x: ")
y = int(x)+1
# print(f"x: {x}, y: {y}"1))
# ep1 folder 3
10 > 3
10 < 3
10 <= 3
10 >= 3
10 == 3
10 != "10"
ord("b")
ord("B")
# ep2 folder 3
temp = input("What is the temp ")
if int(temp) > 30:
    print("its hot")
    print("drink water")
elif int(temp) > 20:
    print("Its nice")
else:
    print("Its So Cold")
# ep 3 folder 3

age = 22
if age >= 18:
    print("Eligible")
else:
    print("Not eligible")

age = 12
massage = "Eligible" if age >= 18 else "Not eligible"
print(massage)
# ep 4 folder 3
# and
# or
# not
high = False
good_credit = True
if high and good_credit:
    print("Eligible")
else:
    print("not Eligible")


high = False
good_credit = True
if high or good_credit:
    print("Eligible")
else:
    print("not Eligible")

high = False
good_credit = True
studnet = True
if not studnet:
    print("Eligible")
else:
    print("not Eligible")

high = False
good_credit = True
studnet = True
if (high or good_credit) and not studnet:
    print("Eligible")
else:
    print("not Eligible")
# ep 5 folder 3

high = False
good_credit = True
studnet = True
if (high and good_credit) and not studnet:
    print("Eligible")
else:
    print("not Eligible")

high = False
good_credit = True
studnet = True
if (high or good_credit) or not studnet:
    print("Eligible")
else:
    print("not Eligible")
# ep 6 folder 3
age = 22
# if age >= 18 and age <65:
if 18 <= age < 65:
    print("Eligible")

# ep 8 forlder 3
print("sending a message")

for number in range(3):
    print("Attempt", number + 1.)

 # ep 9 forlder 3
successful = True
for number in range(3):
    print("attempt")
    if successful:
        print("Successful")
        break
else:
    print("attempted 3 times but failed")

# ep 10 folder 3
for x in range(5):
    for y in range(3):
        print(f"({x}, {y})")

# Ep 1 folder 4


def greet():
    print("Hi There")
    print("welcome aboard")


greet()
# ep 2 Folder 4


def greet(first_name, last_name):
    print("Hi There " + first_name + last_name)
    print("welcome aboard")


greet("Abbi", " Rhouddani")

# ep 3 folder 4


def greet(name):
    print(f"Hi {name}")


greet("Abby")
# 1 perform a task
# 2 return a value


def get_greeting(name):
    return f"Hi {name}"


message = get_greeting("Abbi")
print(message)

file = open("content.txt", "w")
file.write(massage)
# ep 4 Folder 4


def increment(number, by):
    return number + by


print(increment(2, 1))
print(increment(2, by=1))
# ep 5 folder 4


def increment(number, by=1):
    return number + by


print(increment(2))
# ep 6 folder 4


def multiply(x, y):
    return x * y


multiply(2, 4)
print(multiply(2, 4))


def multiply(*numbers):
    print(numbers)


multiply[2, 3, 3, 4]


def multiply(*numbers):
    total = 1
    for number in numbers:
        total *= number
    return total


print(multiply(2, 3, 4, 5))
# ep 7 folder 4


def save_user(**user):
    print(user)


save_user(id=1, name="John", age=22)


def save_user(**user):
    print(user["id"])


save_user(id=1, name="John", age=22)

# ep 8 folder 4


def greed():
    message = "a"
# ep9 folder 4
# ep12 folder 4


def fizz_buzz(input):
    if input % 3 == 0:
        result = "Fizz"
    else:
        result = "buzz"


print(fizz_buzz(5))
# ep 1 folder 5
letters = ["a", "b", "c"]
matrix = [[0, 1], [2, 3]]
zeros = [0] * 5
combined = zeros = letters
numbers = list(range(20))
chars = list("Hello world")
print(chars)
print(len(chars))
# ep 2 folder 5
# ep 3 foldr 5
number = [1, 2, 3]
first, second, third = number
# or
first = number[1]
second = number[2]
third = number[3]

numbers = [1, 2, 3, 4, 5, 6]
first, second, *others = numbers
print(first)
print(others)
# ep 4 folder 5
letters = ["a", "b", "c", "d"]
for letter in letters:
    print(letter)

letters = ["a", "b", "c", "d"]
for letter in enumerate(letters):
    print(letter)

# ep 5 folder 5
letters = ["a", "b", "c", "d"]
# add
letters.append("e")
# add at an item at a location in the list
letters.insert(0, "_")
print(letters)

# remove an item.
letters = ["a", "b", "c", "d"]
letters.pop(0)
print(letters)
letters.remove("c")
del letters[0:3]
print(letters)
# remove all items
letters.clear

# ep 6 folder 5
letters = ["a", "b", "c", "d"]
print(letters.count("d"))


if "d" in letters:
    print(letters.index("d"))

print(letters.index("a"))

# ep 7 folder 5

numbers = [3, 51, 2, 8, 6]
numbers.sort()

numbers.sort(reverse=True)
print(sorted(numbers))
print(sorted(numbers, reverse=True))
print(numbers)


items = [
    ("product1", 10),
    ("product2", 9),
    ("product3", 12),
]


def sort_item(item):
    return item[1]


items.sort(key=sort_item)
print(items)

# better way
items = [
    ("product1", 10),
    ("product2", 9),
    ("product3", 12),
]

items.sort(key=lambda item: item[1])
print(items)

# ep 9 folder 5

items = [
    ("product1", 10),
    ("product2", 9),
    ("product3", 12),
]

prices = []
for item in items:
    prices.append(item[1])

print(prices)

# better way

items = [
    ("product1", 10),
    ("product2", 9),
    ("product3", 12),
]
x = map(lambda item: item[1], items)
for item in x:
    print(item)
items = [
    ("product1", 10),
    ("product2", 9),
    ("product3", 12),
]
prices = list(map(lambda item: item[1], items))
print(prices)

# ep 10 folder 5
items = [
    ("product1", 10),
    ("product2", 9),
    ("product3", 12),
]
filter(lambda item: item[1] >= 10, item)


# 11- List Comprehensions
items = [
    ("product1", 10),
    ("product2", 9),
    ("product3", 12),
]
prices = [item[1] for item in items]
filterd = filter(lambda item: item[1] >= 10, item)
filterd = [item for item in items if item[1] >= 10]
# ep 12 folder 5
list1 = [1, 2, 3]
list2 = [10, 20, 30]
print(list(zip(list1, list2)))

# ep 13 folder 5
[1, 2, 3]
browsing_session = []
browsing_session.append(1)
browsing_session.append(2)
browsing_session.append(3)
print(browsing_session)
last = browsing_session.pop()

print(last)

# ep 14 folder 5
queue = deque([])
queue.append(1)
queue.append(2)
queue.append(3)
queue.popleft()
print(queue)
if not queue:
    print("empty")

# ep 15 folder 5
point = 1, 2
print(type(point))
# ep 17 folder 5


numbers = array("i", [1, 2, 3])
number[0]

# ep 18 folder 5

numbers = [1, 2, 3, 3, 2]
uni = set(numbers)
print(uni)

first = set(numbers)
second = {1, 5}
print(first | second)
print(first & second)
print(first - second)
print(first ^ second)
if 1 in first:
    print("yes")

pprint("hello world", width=1)

# ep 1 & 2 folder 6
age = int(input("age: "))

try:
    age = int(input("age: "))
except ValueError:
    print("Please enter a valid age")
else:
    print("Age is valid")
print("Execution Continues")

# ep 3 folder 6
try:
    file = open("app.py")
    age = int(input("age: "))
    xfactor = 10/age
    # file.close()
except (ValueError, ZeroDivisionError):
    print("You didnt enter a valid age")
else:
    print("No execption were thrown.")
    # file.close()
finally:
    file.close()

# ep 4 folder 6
try:
    with open("app.py") as file:
        print("file is open")
        # file.__enter__
        # file.__exit__
    age = int(input("age: "))
    xfactor = 10/age
    # file.close()
except (ValueError, ZeroDivisionError):
    print("You didnt enter a valid age")
else:
    print("No execption were thrown.")
# ep 5 folder 6


def calculate_xfactor(age):
    if age <= 0:
        raise ValueError("Age cannot be 0 or less.")
    return 10/age


try:
    calculate_xfactor(-1)
except ValueError as error:
    print(error)
# ep 6 folder 6
code1 = """"
def calculate_xfactor(age):
    if age <= 0:
        raise ValueError("Age cannot be 0 or less.")
    return 10/age

try:
    calculate_xfactor(-1)
except ValueError as error:
    print(error)
"""
timeit("First code", code1, number=10000)

#from timeit import timeit

code1 = """
def calculate_xfactor(age):
    if age <= 0:
        raise ValueError("Age cannot be 0 or less.")
    return 10 / age


try:
    calculate_xfactor(-1)
except ValueError as error:
   pass
"""
print("first code=", timeit(code1, number=10000))
# first code= 12.783730200026184
# first code= 0.005300699966028333

code2 = """
def calculate_xfactor(age):
    if age <= 0:
        return None
    return 10 / age

xfactor =  calculate_xfactor(-1)
if xfactor ==None:
    pass
"""
print("second code=", timeit(code2, number=10000))

####
# ep 1 folder 7
#number = [1, 2]
x = 1
print(type(x))
# class : blueprint for creating new objects
# object : instance of a class
# classe: human
# object: John, Mary, Jack,
# ep 2 folder 7 Creating a classe


class Point:
    def draw(self):
        print("draw")


point = Point()
print(type(point))
print(isinstance(point, Point))

# ep 3 folder 7
