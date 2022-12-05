*** Settings ***
Documentation    This is common file
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}=  chrome


*** Keywords ***
Begin Web Test
    open browser    ${URL}      ${BROWSER}
    sleep    2


Close Web Test
    close browser




