username = input("What is your name? ")
userage=input("How old are you? ")
userageint =int(userage)
print("Hello there" + username)
userage10= userageint * 10
print("Your age times ten is " + str(userage10))

if (userageint >= 18):
    print ("you are old enough to vote")
else:
    print("you cant vote yet")
    
 