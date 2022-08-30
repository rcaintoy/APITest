*** Settings ***
Library     RequestsLibrary

*** Variables ***
${baseUrl}  https://reqres.in/

*** Test Cases ***
Request API Testing
    create session      usersession     ${baseUrl}
    ${response}=    get on session     usersession     /api/users/2
    ${status_response}=  convert to string   ${response.status_code}
    ${body_content}=    convert to string  ${response.content}
    should be equal      ${status_response}    200
    should contain     ${body_content}     Janet
    should contain     ${body_content}     Janet
     should contain     ${body_content}     Janet
   
    
