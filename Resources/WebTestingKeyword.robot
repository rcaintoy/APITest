*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PageObjects/LandingPage.robot

*** Keywords ***


Login Page
    click element    ${UserName}
    input text    ${UserName}    Admin
    click element    ${Password}
    input text    ${Password}    admin123




