*** Settings ***
Resource    ../../../resources/services.robot

Test Setup    Create Session    bikelov    ${base_url}

*** Test Cases ***
New Session
    ${payload}=                   Convert To Json        {"email": "jason.toddy@dc.com"}
    ${resp}=                      Post Session           ${payload} 
    Should Be Equal As Strings    ${resp.status_code}    200


Wrong email
    ${payload}=                   Convert To Json        {"email": "jason.toddy$dc.com"}
    ${resp}=                      Post Session           ${payload} 
    Should Be Equal As Strings    ${resp.status_code}    409


Empty email
    ${payload}=                   Convert To Json        {"email": ""}
    ${resp}=                      Post Session           ${payload} 
    Should Be Equal As Strings    ${resp.status_code}    412


Without data
    ${payload}=                   Convert To Json        {}
    ${resp}=                      Post Session           ${payload} 
    Should Be Equal As Strings    ${resp.status_code}    412
