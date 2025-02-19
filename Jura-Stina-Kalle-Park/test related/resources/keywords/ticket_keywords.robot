*** Keywords ***
Navigate To Tickets Page
    Click Element    css=a[data-section="tickets-section"]
    Wait Until Element Is Visible    id=ticket-form    timeout=10s

Select Ticket Type
    [Arguments]    ${type}    ${category}    ${quantity}
    Select From List By Value    id=ticket-type    ${type}
    Select From List By Value    id=ticket-category    ${category}
    Input Text    id=ticket-quantity    ${quantity}

Add Tickets To Cart
    Click Button    css=button[type="submit"]

Verify Ticket Added To Cart
    Wait Until Element Is Visible    id=cart-nav    timeout=10s
    Element Should Be Visible    id=cart-nav

Verify Ticket Purchase Error
    [Arguments]    ${error_message}
    Wait Until Element Is Visible    id=ticket-message    timeout=10s
    Element Should Contain    id=ticket-message    ${error_message}