*** Settings ***
Documentation    A test suite for submitting a student form
Library          Selenium2Library
Resource         forms_resource.robot
Test Setup      Go To Website
Test Teardown   Close Browser

*** Test Cases ***
Upload A File With Image Extension
    Enter Required Fields
    Choose Image File
    Click Submit Button
    Image Name Should be on Modal

Upload a non image file     # this should fail as the form accepts everything
    [Tags]      fails
    Enter Required Fields
    Choose Non-Image File
    Click Submit Button
    Error Should Be Visible