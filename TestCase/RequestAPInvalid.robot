*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${baseUrl}  https://yourbaseurl


*** Test Cases ***
POST API Testing
     create session     mysession     ${baseUrl}
     ${endpoint}    set variable    /api/register
     ${body}=   create dictionary   email="hi"
     ${header}=    create dictionary    Content-Type=application/json
     ${response}=     post request    mysession    ${endpoint}      json=${body}    headers=${header}
     ${status_response}=  convert to string   ${response.status_code}
     ${body_content}=    convert to string  ${response.content}
     #Validation
     should be equal      ${status_response}    400
     should contain    ${body_content}     Missing password














