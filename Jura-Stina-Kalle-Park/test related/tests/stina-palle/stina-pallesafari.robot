*** Settings ***
Documentation    User 2 booking their safari
Library    SeleniumLibrary
Resource    ../../resources/common.robot
Resource    ../../resources/stina-palle.robot
Variables    ../../resources/variables.py
Test Setup
Test Teardown

*** Test Cases ***
Book Herbivore Tour successful
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
    Set Select Safari Type to Herbivore Tour
    Click button "Add to Cart"
    Go to Cart
    If cart contains 1 Regular Adult ticket 
    and 1 Herbivore Tour on 2025-03-17
    and total = $200
    Click button "Proceed to Checkout"
    Verify Checkout Summary 
    Click button OK

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
