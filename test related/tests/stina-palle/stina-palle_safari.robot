*** Settings ***
Documentation    [created_by:MoaRosvall] All test cases where user 2 is booking safaris  
Resource    ../../resources/keywords/stina-palle_keywords.robot
Variables    ../../resources/variables/stina-palle_variables.py
Test Setup    Open Browser To Page    ${url_jura}    ${browser_jura}    ${title_jura}
Test Teardown    Close Browser

*** Test Cases ***
3.1, 3.2 Stina-Palle books herbivore safari and T-Rex safari on a weekday
    Maximize Browser Window
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
    Type In Date    ${date_element_id}    ${weekday}
    Select From List By Value    id=safari-type    T-Rex Rumble
    Click Element    ${add_safaris_to_cart_button}
    Handle Alert
    Click Element    ${cart_element}
    Sleep    2s    Wait for page to load
    Click Button    ${checkout_button}
    Handle Alert

3.3 Stina-Palle tries to book a safari without a ticket
    Maximize Browser Window
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
    Click Element    ${book_safari_element}
    Type In Date    ${date_element_id}    ${weekday}
    Select From List By Value    id=safari-type    Herbivore Tour
    Click Element    ${add_safaris_to_cart_button}
    Message Should Be Visible    ${safari_error_message_element}    ${safari_no_ticket_text}    ${standard_timeout}
    
3.4 Stina-Palle tries to book a safari on a weekend with a regular admission ticket
    Maximize Browser Window
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
    Type In Date    ${date_element_id}    ${weekend}
    Select From List By Value    id=safari-type    Herbivore Tour
    Click Element    ${add_safaris_to_cart_button}
    Message Should Be Visible    ${safari_error_message_element}    ${safari_vip_ticket_text}    ${standard_timeout}
   


