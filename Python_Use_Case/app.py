
price_chart = {
    "ECONOMY": 10,
    "PREMIUM": 18,
    "SUV": 25
}


def calculate_fare(distance, vehicle, hour_of_trip):

    rate_per_km = price_chart[vehicle]
    normal_fare = distance * rate_per_km

    surge_rate = 1

   
    if 17 <= hour_of_trip <= 20:
        surge_rate = 1.5

    final_amount = normal_fare * surge_rate

    return normal_fare, surge_rate, final_amount
print("Available Vehicles:")
for item in price_chart:
    print("-", item)

try:
    km_value = float(input("\nEnter distance to travel (km): "))
    if km_value <= 0:
        raise ValueError("Distance should be greater than 0.")

    vehicle_choice = input("Choose vehicle type: ").upper()
    if vehicle_choice not in price_chart:
        raise ValueError("Vehicle not available.")

    travel_hour = int(input("Enter travel hour (0-23): "))
    if travel_hour < 0 or travel_hour > 23:
        raise ValueError("Hour must be between 0 and 23.")

    base_fare, surge_value, final_fare = calculate_fare(km_value, vehicle_choice, travel_hour)

  
    print("Vehicle       :", vehicle_choice)
    print("Distance      :", km_value, "km")
    print("Rate per km   : ₹", price_chart[vehicle_choice])
    print("Base Fare     : ₹", round(base_fare, 2))

    if surge_value > 1:
        print("Surge Pricing : Applied (Peak Hour)")
    else:
        print("Surge Pricing : No")

    print("Final Fare    : ₹", round(final_fare, 2))


except ValueError as e:
    print("\nInput Error:", e)

except Exception as e:
    print("\nUnexpected Error:", e)