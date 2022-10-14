*** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/WebTestingKeyword.robot




*** Test Cases ***
User must sign in to check out
    [Documentation]    This is example of Web Testing
    [Tags]  Smoke
    Common.Begin Web Test
    WebTestingKeyword.Login Page
    WebTestingKeyword.ProductInformation
    Common.Close Web Test
   



