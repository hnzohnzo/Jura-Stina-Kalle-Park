from datetime import datetime, timedelta

def get_next_weekend_date():
    """Returns the next available Saturday or Sunday in YYYY-MM-DD format."""
    today = datetime.today()
    
    # Find the next Saturday (weekday=5) or Sunday (weekday=6)
    days_until_saturday = (5 - today.weekday()) % 7  
    next_saturday = today + timedelta(days=days_until_saturday)

    return next_saturday.strftime("%Y-%m-%d")  # Format: YYYY-MM-DD

# Explicitly register the function as a Robot Framework keyword
def Get_Next_Weekend_Date():
    return get_next_weekend_date()
