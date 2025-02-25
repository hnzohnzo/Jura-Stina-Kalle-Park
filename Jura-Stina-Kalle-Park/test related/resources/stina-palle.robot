*** Settings ***
Documentation    Keywords för User 2 Stina-Palle
Library    SeleniumLibrary

*** Keywords ***
Type In Wanted Username
    [Arguments]    ${id_reg-username_element}    ${username}
    Input Text    ${id_reg-username_element}    ${username}

Type In Wanted Password
    [Arguments]    ${id_reg-password_element}    ${password}
    Input Text    ${id_reg-password_element}    ${password}

Type In Quantity
    [Arguments]    ${id_quantity_element}    ${quantity}
    Input Text    ${id_quantity_element}    ${quantity}

Type In Date
    [Arguments]    ${id_date_element}    ${date}
    Input Text    ${id_date_element}    ${date}    