*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    Collections
Resource    ../Resources/PageObjects/LandingPage.robot
Resource    ../Resources/PageObjects/ProductInfo.robot
Resource    ../Resources/Common.robot

*** Keywords ***
Login Page
    [Documentation]    Login Page
    ${file}    load json from file    TestData/TestData.json
    ${json_login_username}    get value from json    ${file}    $.login_username
    ${json_login_password}    get value from json    ${file}    $.login_password

    click element    ${UserName}
    input text    ${UserName}     ${json_login_username[0]}
    click element    ${Password}
    input text    ${Password}     ${json_login_password[0]}
    click element    ${LoginBtn}



ProductInformation
    page should contain element    ${Product}
    click element    ${Checklist}


















