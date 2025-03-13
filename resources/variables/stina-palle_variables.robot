## created_by:MoaRosvall 
## Variables for stina-palle_ticket.robot and stina-palle_safari.robot

*** Variables ***
# Timeouts
${standard_timeout}    10s
 
# Setup
${browser_jura}    headlesschrome
${url_jura}    file:///${EXECDIR}/website/jurap.html
${title_jura}     Jura-Stina-Kalle Park
${CHROME_OPTIONS}    --user-data-dir=/tmp/chrome-profile-${RANDOM}
${RANDOM}

# Tabs
${registration_element}    XPATH=/html/body/header/div/nav/ul/li[2]/a
${buy_tickets_element}    XPATH=//*[@id='tickets-nav']/a
${book_safari_element}    XPATH=//*[@id='safari-nav']/a
${cart_element}    XPATH=//*[@id='cart-nav']/a

# Credentials
${username}    Stina-Palle
${password}    Paleontologen

# Registration
${username_registration_id}    id=reg-username
${password_registration_id}    id=reg-password
${register_button}    XPATH=//*[@id='register-form']/button

# Login
${username_login_id}    id=login-username
${password_login_id}    id=login-password
${login_button}    XPATH=//*[@id='login-form']/button

# Tickets
${ticket_quantity_element}    XPATH=//*[@id='ticket-quantity']
${add_tickets_to_cart_button}    XPATH=//*[@id='ticket-form']/button

# Safari
${date_element_id}    id=safari-date
${weekday}    002025-06-25
${weekend}    002025-06-28
${add_safaris_to_cart_button}    XPATH=//*[@id='safari-form']/button

# Checkout
${cart_total}    id=cart-total
${checkout_button}    id=checkout-button

# Errors
${safari_error_message_element}    id=safari-message
${safari_no_ticket_text}    You must purchase a general admission ticket before booking a safari.
${safari_vip_ticket_text}    VIP tickets required to book safaris on weekends.