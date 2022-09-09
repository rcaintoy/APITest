*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${AddEmployeeBtn}=  (//a[@class='oxd-topbar-body-nav-tab-item'])[2]
${FirstName}=   //input[@name='firstName']
${MiddleName}=  //input[@name='middleName']
${LastName}=    //input[@name='lastName']
${EmpID}=   (//input[@class='oxd-input oxd-input--active'])[2]
${SaveBtn}=     //button[@type='submit']
${AddEmployeeTitle}=    //h6[@class='oxd-text oxd-text--h6 orangehrm-main-title']



