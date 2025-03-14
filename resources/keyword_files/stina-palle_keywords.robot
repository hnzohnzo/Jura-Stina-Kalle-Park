*** Settings ***
Documentation    [created_by:MoaRosvall] Keywords for all tests run in stina-palle_tickets.robot and stina-palle_safari.robot
Library    SeleniumLibrary
Resource    ${EXECDIR}/resources/variables/stina-palle_variables.robot

*** Keywords ***
#Setup
Open Browser and Register User
    [Tags]    setup
    Open Browser To Page    ${url_jura}    ${browser_jura}    ${title_jura}
    Maximize Browser Window
    Wait Until Element Is Visible    ${registration_element} 
    Click Element    ${registration_element}
    Type In Wanted Username    ${username_registration_id}    ${username}
    Type In Wanted Password    ${password_registration_id}    ${password}
    Click Element    ${register_button}    
    
Open Browser To Page
    [Tags]    setup
    [Arguments]    ${url}    ${browser}    ${title}
    Open Browser    ${url}    ${browser}
    Title Should Be    ${title}

#Gherkin
the user is logged into the system
    [Tags]    stina-palle-login
    Wait Until Element Is Visible    ${username_login_id}
    Type In Wanted Username    ${username_login_id}    ${username}
    Type In Wanted Password    ${password_login_id}    ${password}
    Click Element    ${login_button}
    Sleep    4s
        
Type In Wanted Username
    [Tags]    stina-palle-login
    [Arguments]    ${id_reg-username_element}    ${username}
    Input Text    ${id_reg-username_element}    ${username}

Type In Wanted Password
    [Tags]    stina-palle-login
    [Arguments]    ${id_reg-password_element}    ${password}
    Input Text    ${id_reg-password_element}    ${password}

has put a regular admission ticket in their cart
    [Tags]    stina-palle-ticket-keyword
    Sleep    2s
    Wait Until Element Is Visible    ${buy_tickets_element}
    Click Element    ${buy_tickets_element}
    Sleep    2s
    Select From List By Value    id=ticket-type    Adult
    Select From List By Value    id=ticket-category    Regular
    Type In Quantity    ${ticket_quantity_element}    ${1}
    Click Element    ${add_tickets_to_cart_button}
    Handle Alert    

Type In Quantity
    [Tags]    stina-palle-ticket-keyword
    [Arguments]    ${id_quantity_element}    ${quantity}
    Input Text    ${id_quantity_element}    ${quantity}

the user books their safaris on a weekday
    [Tags]    stina-palle-safari-keyword
    Wait Until Element Is Visible    ${book_safari_element}
    Click Element    ${book_safari_element}
    Wait Until Element Is Visible    ${date_element_id}
    Type In Date    ${date_element_id}    ${weekday}
    Select From List By Value    id=safari-type    Herbivore Tour
    Click Element    ${add_safaris_to_cart_button}
    Handle Alert
    Wait Until Element Is Visible    ${add_safaris_to_cart_button}
    Type In Date    ${date_element_id}    ${weekday}
    Select From List By Value    id=safari-type    T-Rex Rumble
    Click Element    ${add_safaris_to_cart_button}
    Handle Alert

Type In Date
    [Tags]    stina-palle-date
    [Arguments]    ${id_date_element}    ${date}
    Input Text    ${id_date_element}    ${date}

the user goes to view their cart
    [Tags]    stina-palle-cart
    Wait Until Element Is Visible    ${cart_element}
    Click Element    ${cart_element}
    
#their tickets and safaris are visible in the cart
    #Wait Until Element Is Visible(?)
    #Element Text Should be
    #Använda samma keyword som för errormessage(?)

the user can check out
    [Tags]    stina-palle-checkout
    Click Button    ${checkout_button}
    Handle Alert  

the user books their safari without a ticket
    [Tags]    stina-palle-safari-fail
    Sleep    2s
    Wait Until Element Is Visible    ${book_safari_element}
    Click Element    ${book_safari_element}
    Sleep    2s
    Type In Date    ${date_element_id}    ${weekday}
    Select From List By Value    id=safari-type    Herbivore Tour
    Click Element    ${add_safaris_to_cart_button}      

an error message is visible, telling the user to get a ticket
    [Tags]    stina-palle-safari-fail
    Sleep    2s
    Message Should Be Visible    ${safari_error_message_element}    ${safari_no_ticket_text}    ${standard_timeout}

Message Should Be Visible
    [Tags]    stina-palle-error
    [Arguments]    ${error_message_element}    ${error_message_text}    ${timeout}
    Wait Until Element Is Visible    ${error_message_element}    ${timeout}
    Element Text Should Be    ${error_message_element}    ${error_message_text}

the user books their safari on a weekend
    [Tags]    stina-palle-weekend-fail
    Wait Until Element Is Visible    ${book_safari_element}
    Click Element    ${book_safari_element}
    Wait Until Element Is Visible    ${date_element_id}
    Type In Date    ${date_element_id}    ${weekend}
    Select From List By Value    id=safari-type    Herbivore Tour
    Click Element    ${add_safaris_to_cart_button}

an error message is visible, telling the user they need a VIP ticket
    [Tags]    stina-palle-error
    Sleep    2s    
    Message Should Be Visible    ${safari_error_message_element}    ${safari_vip_ticket_text}    ${standard_timeout}  

#the ticket is in the cart
    #this is an assertion that needs some work 

the user goes to buy a ticket without logging in
    [Tags]    stina-palle-fail
    Sleep    4s
    Wait Until Element Is Visible    ${buy_tickets_element}
    Click Element    ${buy_tickets_element}
    Sleep    2s
    
the user tries to add the ticket to their cart
    [Tags]    stina-palle-ticket
    Wait Until Element Is Visible    ${ticket_quantity_element}
    Select From List By Value    id=ticket-type    Adult
    Select From List By Value    id=ticket-category    Regular
    Type In Quantity    ${ticket_quantity_element}    ${1}
    Click Element    ${add_tickets_to_cart_button}

an error alert pops up
    [Tags]    stina-palle-error
    Handle Alert  