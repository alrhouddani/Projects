import requests

API_key = "33a8676d320b3b440b712b206d380d6d"
base_url = "https://api.openweathermap.org/data/2.5/weather"
city = input ("Enter a city name?  ")
request_url = f"{base_url}?appid={API_key}&q={city}"
response = requests.get(request_url)

if response.status_code == 200:
    data = response.json()
    weather = data['weather'][0]['description']
    temp = round(data['main']['temp'] -273.15, 2)
    print("Weather:", weather)
    print("Temperature:", temp, "Celsius")
    
else:
    print("An error occurred.")
    
    