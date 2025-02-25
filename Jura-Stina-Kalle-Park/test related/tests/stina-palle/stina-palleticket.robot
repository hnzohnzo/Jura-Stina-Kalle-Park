*** Settings ***
Documentation    User 2 buying their ticket
Library    SeleniumLibrary
Resource    ../../resources/common.robot
Resource    ../../resources/stina-palle.robot
Variables    ../../resources/variables.py
Test Setup    Open Browser To Page    ${url_jura}    ${browser_jura}    ${title_jura}
Test Teardown    Close Browser

*** Test Cases ***
Buy ticket successful
    Set Selenium Speed    0.2s
    Wait Until Element Is Visible    ${registration_element} 
    Click Element    ${registration_element}
    Type In Wanted Username    ${username_registration_id}    ${username}
    Type In Wanted Password    ${password_registration_id}    ${password}
    Click Button    
    
     
    

Next test
    
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
    Verifiera meddelande "Item added to cart!"
    Click button OK
    Go to Cart
    If cart contains 1 Regular Adult ticket
    and total = $50
    Click button "Proceed to Checkout"


