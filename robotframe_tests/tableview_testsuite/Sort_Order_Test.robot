*** Settings ***
Documentation    A test suite for Sort order
Library          Selenium2Library
Resource         table_resource.robot
Suite Setup       Go To Table Page
Suite Teardown    Close Browser
Test Template    Sort Order

*** Test Cases ***          HEADER           ORDER	    NAME
Computer Name Ascending      name             asc       Computer name
Computer Name Descending     name             desc      Computer name
Introduced Descending        introduced       desc      Introduced
Introduced Ascending         introduced       asc       Introduced
Discontinued Ascending       discontinued     asc       Discontinued
Discontinued Descending      discontinued     desc      Discontinued
Company Name Descending      companyName      desc      Company
Company Name Ascending       companyName      asc       Company

*** Keywords ***
Sort Order
    [Arguments]     ${header}   ${order}    ${name}
    Click Header    ${name}
    List Should Be Sorted in Order      ${header}   ${order}    ${name}
