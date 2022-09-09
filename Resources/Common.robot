*** Settings ***
Documentation    This is common file
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   headlesschrome
    sleep    10

Close Web Test
    close browser
