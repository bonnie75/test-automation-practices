*** Settings ***
Documentation    A test suite for submitting a student form
Library          Selenium2Library
Resource         forms_resource.robot
Suite Setup      Go To Website
Suite Teardown   Close Browser
Test Template    Invalid Values

*** Test Cases ***          ${value}
empty phone field           ${empty}        
less than 10 digits         123
negative phone values       -543764339

*** Keywords ***
Invalid Values
    [Arguments]     ${VALUE}
    Enter First Name
    Enter Last Name
    Select Gender Option
    Enter Phone Number  ${value}
    Submit Modal Should Not Be Visible