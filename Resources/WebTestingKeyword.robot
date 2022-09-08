*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PageObjects/LandingPage.robot

*** Keywords ***


Search for Products
    input text     ${searchfield}    ${Searchproduct}
    click button    //input[@id='nav-search-submit-button']
    wait until page contains    RESULTS

Select Products from the search results
    click element   (//div[@class='a-section aok-relative s-image-fixed-height'])[1]
    wait until page contains   Add to Cart

Add Product to Cart
    click element    //input[@id='add-to-cart-button']
    page should contain element    //div[@class='a-section a-padding-medium sw-atc-message-section']

Begin Checkout
    click element    //input[@name='proceedToRetailCheckout']
    page should contain    Sign in
    element text should be    //h1[@class='a-spacing-small']    Sign in



