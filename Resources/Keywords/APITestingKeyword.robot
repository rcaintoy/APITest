*** Settings ***
Library    JSONLibrary
Library    Collections
Library    RequestsLibrary


*** Keywords ***
GET Request
    ${json_obj}=    load json from file    TestData/TestData.json
    ${baseUrl}=     get value from json     ${json_obj}     GetBaseUrl.baseUrl
    create session      usersession   ${baseUrl[0]}
    ${response}=    get on session     usersession     /api/users/2
    ${status_response}=  convert to string   ${response.status_code}

    ${email}=     get value from json   ${json_obj}     GetRequest.email
    ${firstname}=     get value from json   ${json_obj}   GetRequest.first_name
    ${lastname}=     get value from json    ${json_obj}     GetRequest.last_name

    ${body_content}=   set variable    ${response.json()}

    #should be equal   ${body_content1}      ${email[0]}
    #should contain    ${body_content}      ${first_name[0]}
    #should contain    ${body_content}      ${last_name[0]}


POST Request
    ${json_obj}=    load json from file    TestData/TestData.json
    ${baseUrl}=     get value from json     ${json_obj}     GetBaseUrl.baseUrl
    ${firstName}=     get value from json     ${json_obj}   POSTRequest.firstName
    ${middleName}=     get value from json     ${json_obj}   POSTRequest.middleName
    ${lastName}=     get value from json     ${json_obj}   POSTRequest.lastName
    ${birthdate}=     get value from json     ${json_obj}   POSTRequest.birthdate
    ${department}=    get value from json     ${json_obj}   POSTRequest.department

    create session      usersession   ${baseUrl[0]}
    ${endpoint}=     get value from json     ${json_obj}   POSTRequest.endpoint
    ${endpoint}    set variable    ${endpoint[0]}
    ${body}=   create dictionary   firstName= ${firstName[0]}    middleName= ${middleName[0]}  lastName=${lastName[0]}     birthdate=${birthdate[0]}    department=${department[0]}
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=     post on session    usersession    ${endpoint}      json=${body}    headers=${header}
    ${status_response}=  convert to string   ${response.status_code}
    ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
    ${body_content}=    convert to string  ${response.content}


    should be equal    ${status_response}   201
    Should be equal  ${getHeaderValue}  application/json; charset=utf-8
    should contain    ${body_content}     ${firstName[0]}
    should contain    ${body_content}     ${middleName[0]}
    should contain    ${body_content}     ${lastName[0]}
    should contain    ${body_content}     ${birthdate[0]}
    should contain    ${body_content}     ${department[0]}

PUT Request













