*** Settings ***
Documentation   test cases for the list demo
Resource        ../resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To List Demo
Test Teardown   Close Application
Test Template   Close Cloud Alert

*** Test Cases ***          CLOUD       BUTTON
Close Alert With OK         Cirrus      1
Close Alert with Cancel     Fog         2

*** Keywords ***
Close Cloud Alert
    [Arguments]     ${cloud}    ${button}
    wait until page contains       Check out these clouds   timeout=10 seconds
    Click Cloud Name       ${cloud}
    Click Close Alert Button    ${button}
    Alert Should Not Be Visible
