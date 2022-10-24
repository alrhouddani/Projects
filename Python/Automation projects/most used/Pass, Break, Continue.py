# pass
names = ['Joyce', 'Hannah', 'Manna', 'Manos', 'Ezekiel']

for name in names:
    if 'j' in name.lower():
        pass
    else:
        print(name)
# break
names = ['Joyce', 'Hannah', 'Manna', 'Manos', 'Ezekiel']

for name in names:
    if 'h' in name.lower():
        break
    else:
        print(name)
# Continue
names = ['Joyce', 'Hannah', 'Manna', 'Manos', 'Ezekiel']

for name in names:
    if 'm' in name.upper():
        continue
    else:
        print(name)
