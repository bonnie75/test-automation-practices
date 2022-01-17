*** Settings ***
Documentation    A test suite for page navigation
Library          Selenium2Library
Resource         table_resource.robot
Test Setup       Go To Table Page
Test Teardown    Close Browser

*** Test Cases *** 
Navigate to Next Page
    Click Next Button
    Page Should Display Next

Navigate to First Page
    Click Previous Button
    Page Should Display First       #flakey. would work best if there were data-attributes