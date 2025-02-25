*** Settings ***
Documentation    User 2 booking their safari
Library    SeleniumLibrary
Resource    ../../resources/common.robot
Resource    ../../resources/stina-palle.robot
Variables    ../../resources/variables.py
Test Setup    Open Browser To Page    ${url_jura}    ${browser_jura}    ${title_jura}
Test Teardown    Close Browser

*** Test Cases ***
3.1 Stina-Palle bokar herbivore - safari på en vardag
    Set Selenium Speed    0.2s
    Wait Until Element Is Visible    ${registration_element} 
    Click Element    ${registration_element}
    Type In Wanted Username    ${username_registration_id}    ${username}
    Type In Wanted Password    ${password_registration_id}    ${password}
    Click Element    ${register_button}    
    Sleep    3s    Wait for page to load
    Type In Wanted Username    ${username_login_id}    ${username}
    Type In Wanted Password    ${password_login_id}    ${password}
    Click Element    ${login_button}
    Sleep    3s    Wait for page to load
    Click Element    ${buy_tickets_element}
    Sleep    3s    Wait for page to load
    Select From List By Value    id=ticket-type    Adult
    Select From List By Value    id=ticket-category    Regular
    Type In Quantity    ${ticket_quantity_element}    ${1}
    Click Element    ${add_tickets_to_cart_button}
    Handle Alert
    Click Element    ${book_safari_element}
    Type In Date    ${date_element_id}    ${weekday}
    Select From List By Value    id=safari-type    Herbivore Tour
    Click Element    ${add_safaris_to_cart_button}
    Handle Alert
    Click Element    ${cart_element}
    Sleep    2s    Wait for page to load
    Click Button    ${checkout_button}
    Handle Alert

3.2 Palle-Stina bokar T-Rex safari på en vardag
    Set Selenium Speed    0.2s
    Wait Until Element Is Visible    ${registration_element} 
    Click Element    ${registration_element}
    Type In Wanted Username    ${username_registration_id}    ${username}
    Type In Wanted Password    ${password_registration_id}    ${password}
    Click Element    ${register_button}    
    Sleep    3s    Wait for page to load
    Type In Wanted Username    ${username_login_id}    ${username}
    Type In Wanted Password    ${password_login_id}    ${password}
    Click Element    ${login_button}
    Sleep    3s    Wait for page to load
    Click Element    ${buy_tickets_element}
    Sleep    3s    Wait for page to load
    Select From List By Value    id=ticket-type    Adult
    Select From List By Value    id=ticket-category    Regular
    Type In Quantity    ${ticket_quantity_element}    ${1}
    Click Element    ${add_tickets_to_cart_button}
    Handle Alert
    Click Element    ${book_safari_element}
    Type In Date    ${date_element_id}    ${weekday}
    Select From List By Value    id=safari-type    T-Rex Rumble
    Click Element    ${add_safaris_to_cart_button}
    Handle Alert
    Click Element    ${cart_element}
    Sleep    2s    Wait for page to load
    Click Button    ${checkout_button}
    Handle Alert


2Do
... 
    
    
    
    

Book T-Rex Rumble successful
    Open Browser to webpage
    Go to Register tab
    Type "Stina-Palle" in field Username
    Type "Paleontologen" in field Password
    Click button "Register"
    -> Login page
    Type in Registered Username ("Stina-Palle") in field Username
    Type in Registered Password ("Paleontologen") in field Password
    Click button "Login"
    Go to Buy Tickets
    Set Ticket Type to Adult
    Set Ticket Category to Regular Ticket
    Set Quantity to 1
    Click button "Add to Cart"
    Verify message "Item added to cart!"
    Click button OK
    Go to Book Safaris
    Set Select Safari Date to 2025-03-17
    Set Select Safari Type to T-Rex Rumble
    Click button "Add to Cart"
    Go to Cart
    If cart contains 1 Regular Adult ticket 
    and 1 T-Rex Rumble on 2025-03-17
    and total = $170
    Click button "Proceed to Checkout"
    Verify Checkout Summary 
    Click button OK
