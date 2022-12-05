*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${baseUrl}  http://localhost:8080
${requestUrl}=    /v1/api/send-notification
${body}=    Hello
${email}=    anne.masarate@novare.com.hk
${mobile}=    123
${subject}=     Science
