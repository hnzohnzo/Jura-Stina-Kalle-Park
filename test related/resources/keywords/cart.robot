*** Keywords ***
Navigate To Cart Page
    Click Element    css=a[data-section="cart-section"]
    Wait Until Element Is Visible    id=cart-details    timeout=10s

Proceed To Checkout
    Click Button    id=checkout-button

Verify Checkout Success
    Wait Until Element Is Visible    id=confirmation-message    timeout=10s
    Element Should Contain    id=confirmation-message    Your purchase was successful