print('Hello, Welcome to my coffe shop!!')
Name = input('What is your name? ')
print("Hello " + Name + " Thank you so much for coming.\n")
Menu = "Black coffe, Espresso, latte"
print(Name + " What would you like to drink from our Menu today.\n" + Menu)

Order = input("Please pick from the menu ")

print("Great Pick " + Name + " We will have your " + Order +
      " Ready in no time ")
Price = 2

Howmany = input('How many coffes would you like?\n')

Total = Price * int(Howmany)
print("Thank you for your order your " +
      Howmany + " orders will be ready soon")
print("Thank you for your total is $" + str(Total))

print("i am a hero")
