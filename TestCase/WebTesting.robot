*** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/WebTestingKeyword.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]    This is example of Web Testing
    [Tags]  Smoke
    Common.Begin Web Test
    WebTestingKeyword.Login Page

    Common.Close Web Test



