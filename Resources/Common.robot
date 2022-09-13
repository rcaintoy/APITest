*** Settings ***
Documentation    This is common file
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}=  headlesschrome


*** Keywords ***
Begin Web Test
    open browser    ${URL}      ${BROWSER}


Close Web Test
    close browser


