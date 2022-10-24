x = 4
y = 3
# Arithmetic Operators

x + y  # returns 7
x - y  # returns 1
x * y  # returns 12
x ** y  # returns 64
x / y  # returns 1.333
x // y  # returns 1
x % y  # returns 1

# Assignment Operators

x += 4  # x is 8
x -= 4  # x is 0
x *= 4  # x is 16
x /= 4  # x is 1.0
x %= 4  # x is 0

#Comparison Operators
x = 4
y = 3

x == y  # returns False
x != y  # returns True
x > y  # returns True
x < y  # returns False
x >= y  # returns True
x <= y  # returns False

#Logical Operators
x = 4
y = 3

x > 2 and y > 1      # returns True
x > 5 or y <= 3      # returns True
not(x > 2 and y > 1)  # returns False


x = 5
y = 2

print('arithmetic operator (x + y): ', x + y)
print('assignment operator (x += 4): ', x)
print('comparison operator (x >= y): ', x >= y)
print('logical operator (x == y or x > y): ', x == y and x > y)
