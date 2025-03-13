*** Settings ***
Documentation    [created_by:MoaRosvall] All test cases where user 2 (Stina-Palle) buys tickets and books safaris
Resource    ${EXECDIR}/resources/keyword_files/stina-palle_keywords.robot
Test Setup    Open Browser and Register User
Test Teardown    Close Browser

*** Test Cases ***
2.1 Stina-Palle buys a regular admission adult ticket
    Given the user is logged into the system
    and has put a regular admission ticket in their cart
    When the user goes to view their cart
    #Then the ticket is in the cart <-this is the assertion
    Then the user can check out
    
2.2 Stina-Palle tries to buy a ticket without logging in
    Given the user goes to buy a ticket without logging in
    When the user tries to add the ticket to their cart
    Then an error alert pops up
    #is there another assertion to make here?

3.1, 3.2 Stina-Palle books herbivore safari and T-Rex safari on a weekday
    Given the user is logged into the system
    and has put a regular admission ticket in their cart
    When the user books their safaris on a weekday
    and the user goes to view their cart
    Then the user can check out
    #Then their tickets and safaris are visible in the cart
    #and the user can check out

3.3 Stina-Palle tries to book a safari without a ticket
    Given the user is logged into the system
    When the user books their safari without a ticket
    Then an error message is visible, telling the user to get a ticket

3.4 Stina-Palle tries to book a safari on a weekend with a regular admission ticket
    Given the user is logged into the system
    and has put a regular admission ticket in their cart
    When the user books their safari on a weekend
    Then an error message is visible, telling the user they need a VIP ticket