*** Settings ***
Documentation    [Moa, Grupp 5] User 2 (Stina-Palle) buying their ticket.
Library    SeleniumLibrary
Resource    ../../resources/stina-palle_keywords.robot
Variables    ../../resources/stina-palle_variables.py
Test Setup    Open Browser To Page    ${url_jura}    ${browser_jura}    ${title_jura}
Test Teardown    Close Browser

*** Test Cases ***
2.1 Stina-Palle köper en standard vuxenbiljett
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
    Select From List By Value    XPATH=//*[@id="ticket-type"]    Adult
    Select From List By Value    XPATH=//*[@id="ticket-category"]    Regular
    Type In Quantity    ${ticket_quantity_element}    ${1}
    Click Element    ${add_tickets_to_cart_button}
    Handle Alert
    Click Element    ${cart_element}
    Sleep    2s    Wait for page to load
    Click Button    ${checkout_button}
    Handle Alert

2.2 Stina-Palle försöker köpa biljetter utan att vara inloggad
    Set Selenium Speed    0.2s
    Wait Until Element Is Visible    ${registration_element} 
    Click Element    ${registration_element}
    Type In Wanted Username    ${username_registration_id}    ${username}
    Type In Wanted Password    ${password_registration_id}    ${password}
    Click Element    ${register_button}    
    Sleep    3s    Wait for page to load
    Click Element    ${buy_tickets_element}
    Sleep    3s    Wait for page to load
    Select From List By Value    XPATH=//*[@id="ticket-type"]    Adult
    Select From List By Value    XPATH=//*[@id="ticket-category"]    Regular
    Type In Quantity    ${ticket_quantity_element}    ${1}
    Click Element    ${add_tickets_to_cart_button}
    Handle Alert
    
                
    
    
      
    


