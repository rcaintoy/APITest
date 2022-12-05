*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Resource    ../Resources/PageObjects/NotificationData.robot


*** Test Cases ***
Teacher_POST API Testing
     create session     mysession     ${baseUrl}
     ${endpoint}    set variable    ${requestUrl}
     ${body}=   create dictionary   body=${body}    email=${email}  mobile=${mobile}     subject=${subject}
     ${header}=    create dictionary    Content-Type=application/json
     ${response}=     post on session    mysession    ${endpoint}      json=${body}    headers=${header}
     #Validation
     ${status_response}=  convert to string   ${response.status_code}
      should be equal    ${status_response}   2001
     ${json_response}=  convert string to json  ${response.content}
     should not be empty     ${json_response}
