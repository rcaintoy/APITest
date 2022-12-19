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




* Settings *
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

* Test Cases *
Validate Get customer type for Individual - Residential
    ${json_obj}=    load json from file    TestData/AP_Individual-Residential.json
    ${baseUrl}=     get value from json     ${json_obj}     BaseUrl.baseUrl
    ${endpoint}=        get value from json     ${json_obj}   GETRequest.endpoint
    create session      usersession   ${baseUrl[0]}
    ${response}=    get on session     usersession     ${endpoint[0]}

    #Validate response status code
    ${status_response}=  convert to string   ${response.status_code}
    should be equal    ${status_response}   200

    #Value from the TestData file
    ${expected_requirements}=     get value from json   ${json_obj}     RequirementsList.documentaryRequirementTypeName

     #Validation
    ${response_body}=        set variable           ${response.json()}

    ${actual_requirements}=     get value from json    ${response_body}     data.documentaryRequirementTypeName
     should contain any    ${response_json}      ${expected_requirements[0]}
