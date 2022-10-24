
print("Welcome to my Quiz Game")
playing = input("Do you want to play? ")

score = 0
if playing.lower() != "yes":
    quit()
print("okay.!! Lets Play :) ")
answer = input("What does CPU stand for? ")
if answer.lower() == "central processing unit":
    print('Correct!!')
    score += 1
elif answer.lower() == "cpu":
    print("correct !!")
    score += 1
else:
    print("Incorrect!! Think again idiot ¯\_(ツ)_/¯ !!! ")

answer = input("What does GPU Stand for? ")
if answer.lower() == "Graphics processing unit":
    print('Correct!!')
    score += 1
else:
    print("Incorrect!! Think again idiot ¯\_(ツ)_/¯ !!! ")

answer = input("What does RAM stand for? ")
if answer.lower() == "Rondom access memory":
    print('Correct!!')
    score += 1
else:
    print("Incorrect!! Think again idiot ¯\_(ツ)_/¯ !!! ")


answer = input("What does PSU stands for ? ")
if answer.lower == "Power supply":
    print('Correct!!')
    score += 1
else:
    print("Incorrect!! Think again idiot ¯\_(ツ)_/¯ !!! ")

print("You Got " + str(score) + " questions correct ")
print("You Got " + str((score / 4) * 100) + "%")
