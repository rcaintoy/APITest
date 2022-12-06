*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
*** Test Cases ***
Verify GET Request and validate the response code and response body
    ${json_obj}=    load json from file    TestData/TestData.json
    @{baseUrl}=     get value from json     ${json_obj}     BaseUrl.baseUrl
    @{endpoint}=        get value from json     ${json_obj}   GETRequest.endpoint
    create session      usersession   @{baseUrl}
    ${response}=    get on session     usersession     @{endpoint}

    #Validate response status code
    ${status_response}=  convert to string   ${response.status_code}


    #Value from the TestData file
    @{expected_email}=     get value from json   ${json_obj}     GETRequest.email
    @{expected_firstname}=     get value from json   ${json_obj}   GETRequest.first_name
    @{expected_lastname}=     get value from json    ${json_obj}     GETRequest.last_name


    #Validation
    ${response_body}=        set variable           ${response.json()}
    @{actual_email}=        get value from json    ${response_body}     data.email
    @{actual_firstname}=    get value from json    ${response_body}     data.first_name
    @{actual_lastname}=     get value from json    ${response_body}     data.last_name
    should be equal         @{actual_email}           @{expected_email}
    should be equal         @{actual_firstname}       @{expected_firstname}
    should be equal         @{actual_lastname}        @{expected_lastname}


Verify POST Request and validate the response code, response body, and response headers
    ${json_obj}=        load json from file    TestData/TestData.json
    ${baseUrl}=         get value from json     ${json_obj}   BaseUrl.baseUrl
    ${endpoint}=        get value from json     ${json_obj}   POSTRequest.endpoint
    ${expected_name}=            get value from json     ${json_obj}        POSTRequest.name
    ${expected_job}=             get value from json     ${json_obj}        POSTRequest.job

    create session      usersession   ${baseUrl[0]}
    ${endpoint}      set variable    ${endpoint[0]}
    ${body}=         create dictionary   name= ${expected_name[0]}    job= ${expected_job[0]}
    ${header}=       create dictionary    Content-Type=application/json
    ${response}=     post on session    usersession    ${endpoint}      json=${body}    headers=${header}
    ${status_response}=    convert to string   ${response.status_code}
    ${getHeaderValue}=     Get From Dictionary  ${response.headers}  Content-Type


    #Validation
    ${response_body}=   set variable    ${response.json()}
    ${data_name}=          get value from json     ${response_body}    name

    should be equal    ${status_response}   201
    should be equal    ${getHeaderValue}  application/json; charset=utf-8
    should be equal     ${data_name[0].strip()}      ${expected_name[0].strip()}

Verify PUT Request and validate the response code and response body
    ${json_obj}=        load json from file    TestData/TestData.json
    ${baseUrl}=         get value from json     ${json_obj}   BaseUrl.baseUrl
    ${endpoint}=     get value from json     ${json_obj}   PUTRequest.endpoint
    #Value from the TestData file
    ${expected_name}=     get value from json   ${json_obj}     PUTRequest.name
    ${expected_job}=      get value from json   ${json_obj}     PUTRequest.job

    create session     session     ${baseUrl[0]}
    ${endpoint}    set variable    ${endpoint[0]}
    ${body}=   create dictionary   name=${expected_name[0]}    job= ${expected_job[0]}
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=     put on session    session    ${endpoint}      json=${body}    headers=${header}

    #Validation
    ${status_response}=  convert to string   ${response.status_code}
    should be equal    ${status_response}   200
    ${response_body}=   set variable    ${response.json()}
    ${data_name}=          get value from json     ${response_body}    name
    should be equal    ${data_name[0]}     ${expected_name[0]}


Verify Delete Request and validate the response code and response body
    ${json_obj}=        load json from file    TestData/TestData.json
    ${baseUrl}=         get value from json     ${json_obj}   BaseUrl.baseUrl
    ${endpoint}=         get value from json     ${json_obj}   DeleteRequest.endpoint
     create session     mysession     ${baseUrl[0]}
     ${endpoint}    set variable    ${endpoint[0]}
     ${response}=     delete on session     mysession    ${endpoint}
     #Validation
     ${status_response}=  convert to string   ${response.status_code}
     ${response_body}=  convert to string   ${response.content}
     should be equal    ${status_response}   204
     should be empty   ${response_body}
     should be empty   ${response_body}












