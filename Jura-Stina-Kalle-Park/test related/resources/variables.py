import os
 
current_directory = os.getcwd().replace('\\', '/')

# Invalid Credentials
invalid_username = "woopdiwoop"
invalid_password = "soupdisoup"

# Timeouts
standard_timeout = "10s"
 
# Jura specific
browser_jura = "chrome"
url_jura = f"file:///{current_directory}/webpages/jurap.html"
title_jura = "Jura-Stina-Kalle Park"

username_input_id_demo = "id=username"
password_input_id_demo = "id=password"
login_button_demo = "id=login-button"

valid_username_demo = "test"
valid_password_demo = "test"

error_message_element_demo = "class=error-message"
error_message_demo = "Invalid username or password"

successful_message_element_demo = "id=login-successful-message"
successful_message_demo = "Welcome test!"