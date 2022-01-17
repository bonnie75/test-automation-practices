*** Settings ***
Documentation    A test suite for table filter values
Library          Selenium2Library
Resource         table_resource.robot
Test Setup       Go To Table Page
Test Teardown    Close Browser

*** Test Cases *** 
Filter Name By Special Characters
    Enter Filter Value      @&%(^>{")
    Click Filter By Name Button
    Table Should Not Be Visible

Filter Name By Empty Field
    Enter Filter Value  ${EMPTY}
    Click Filter By Name Button
    Required Field Should Be Visible

Clear Filter Name Field
    Enter Filter Value  Test
    Click Clear Button
    Filter Field Should Be Empty