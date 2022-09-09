*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PageObjects/LandingPage.robot
Resource    ../Resources/PageObjects/AddEmployee.robot

*** Keywords ***
Login Page
    click element    ${UserName}
    input text    ${UserName}    Admin
    click element    ${Password}
    input text    ${Password}    admin123
    click element    ${LoginBtn}
    wait until page contains    Employee Information

Add Employee
    click element    ${AddEmployeeBtn}
    wait until page contains    Add Employee
    input text    ${FirstName}    Rose
    click element    ${MiddleName}
    input text    ${MiddleName}    Sampaguita
    input text    ${LastName}    Rose
    input text    ${EmpID}    23
    click element    ${SaveBtn}













