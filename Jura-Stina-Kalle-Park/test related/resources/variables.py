import os
 
current_directory = os.getcwd().replace('\\', '/')

# Invalid Credentials
invalid_username = "woopdiwoop"
invalid_password = "soupdisoup"

# Timeouts
standard_timeout = "10s"
 
# Jura specific
browser_jura = "chrome"
url_jura = f"C:\\Users\\mlelo\\OneDrive\\Documents\\GitHub\\Jura-Stina-Kalle-Park\\Jura-Stina-Kalle-Park\\website\\jurap.html"
title_jura = "Jura-Stina-Kalle Park"

registration_element = "XPATH=/html/body/header/div/nav/ul/li[2]/a"

username = "Stina-Palle"
password = "Paleontologen"

username_registration_id = "id=reg-username"
password_registration_id = "id=reg-password"
login_button_demo = "id=login-button"

valid_username_demo = "test"
valid_password_demo = "test"

error_message_element_demo = "class=error-message"
error_message_demo = "Invalid username or password"

successful_message_element_demo = "id=login-successful-message"
successful_message_demo = "Welcome test!"