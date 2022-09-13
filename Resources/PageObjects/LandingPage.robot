*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${UserName}=    (//input[@class='input_error form_input'])[1]
${Password}=    (//input[@class='input_error form_input'])[2]
${LoginBtn}=    //input[@class='submit-button btn_action']



