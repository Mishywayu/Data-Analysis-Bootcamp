number = 0

print("While Loop")
while number < 5:
    print(number)
    number = number + 1



# break statement
number = 0

print("The Break Statement")
while number < 5:
    print(number)
    if number == 3:
        break
    number = number + 1



# else statement
number = 0

print("The Else Statement")
while number < 5:
    print(number)
    number = number + 1
else:
    print ("No longer less than 5")



# continue statement
# number = 0

# print("The continue Statement (1)")
# while number < 5:
#     print(number)
#     if number == 3:
#         continue
#     number = number + 1
# else:
#     print("No longer < 5")

number = 0

print("Continue Statement (2)")
while number < 5:
    number = number + 1
    if number == 3:
        continue
    print(number)