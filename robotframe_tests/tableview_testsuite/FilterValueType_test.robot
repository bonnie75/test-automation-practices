*** Settings ***
Documentation    A test suite for table filter values
Library          Selenium2Library
Resource         table_resource.robot
Test Setup       Go To Table Page
Test Teardown    Close Browser
Test Template    Filter Name By

*** Test Cases ***      VALUE    
Characters              ibm
Numbers                  12

*** Keywords ***
Filter Name By  
    [Arguments]     ${value}
    Enter Filter Value      ${value}
    Click Filter By Name Button
    Table Should Be Visible