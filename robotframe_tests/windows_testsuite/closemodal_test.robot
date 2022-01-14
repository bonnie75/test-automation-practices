*** Settings ***
Documentation    A test suite for closing modals
Library          Selenium2Library
Resource         win_resource.robot
Test Setup       Go To Website
Test Teardown    Close Browser

*** Test Cases ***      
Close Small Modal With Close Button
    Go To Modal Page
    Click Modal Button  Small
    Click Close button  Small

Close Large Modal With Close Button
    Go To Modal Page
    Click Modal Button  Large
    Click Close Button  Large

Close Small Modal With X
    Go To Modal Page
    Click Modal Button  Small
    Click X Button

Close Large Modal With X
    Go To Modal Page
    Click Modal Button  Large
    Click X Button