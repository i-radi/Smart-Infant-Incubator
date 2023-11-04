import random
class Ventilation:
    def Temp():
        TempAndHumidity = [[21,80],[24,65],[23,70],[25,85],[22,75]]
        temperature = random.choice(TempAndHumidity)
        return temperature[0]
    def Hum():
        HumidityAndTemp = [[21,80],[24,65],[23,70],[25,85],[22,75]]
        humidity = random.choice(HumidityAndTemp)
        return humidity[1]
    def Wei():
        weight = ["1000","1500","2500","2000","3000"]
        return random.choice(weight)
    def HtRate():
        heartRate = ["22.5","12.5","2.25","30.5","33.5"]
        return random.choice(heartRate)
