*** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/WebTestingKeyword.robot

*** Variables ***

*** Test Cases ***
User must sign in to check out
    [Documentation]    This is example of Web Testing
    [Tags]  Smoke
    Common.Begin Web Test
    WebTestingKeyword.Add Product to Cart
    WebTestingKeyword.Select Products from the search results
    WebTestingKeyword.Add Product to Cart
    WebTestingKeyword.Begin Checkout
    Common.Close Web Test



