*** Keywords ***
Navigate To Safari Page
    Click Element    css=a[data-section="safari-section"]
    Wait Until Element Is Visible    id=safari-form    timeout=10s

Select Safari Date
    [Arguments]    ${date}
    Input Text    id=safari-date    ${date}

Select Safari Type
    [Arguments]    ${safari_type}
    Select From List By Value    id=safari-type    ${safari_type}

Add Safari To Cart
    Click Button    css=button[type="submit"]

Verify Safari Added To Cart
    Wait Until Element Is Visible    id=cart-nav    timeout=10s
    Element Should Be Visible    id=cart-nav

Verify Safari Booking Error
    [Arguments]    ${error_message}
    Wait Until Element Is Visible    id=safari-message    timeout=10s
    Element Should Contain    id=safari-message    ${error_message}