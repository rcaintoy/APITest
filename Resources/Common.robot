*** Settings ***
Documentation    This is common file
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    open browser    https://www.amazon.com/   headlesschrome


Close Web Test
    close browser
