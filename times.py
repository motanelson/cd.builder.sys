from datetime import datetime
then = datetime(2026, 1, 1, 0, 0, 0) 
now = datetime.now() # Now
print("\033[43;30m\n")
duration = now - then # For build-in functions
duration_in_s =int( duration.total_seconds()/(60*60*24*(30.5)))
print(duration_in_s)
