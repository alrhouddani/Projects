battery = psutil.sensors_battery()
percent = battery.percent

if battery.percent == 100:
    print("battry is chanrged")
