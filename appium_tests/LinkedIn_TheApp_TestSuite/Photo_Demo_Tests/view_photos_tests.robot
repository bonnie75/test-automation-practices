*** Settings ***
Documentation   test cases for the photo demo
Resource        ../resources/resource.robot
Suite Setup      Run Keywords    Open Android Application
...             AND     Go To Photo Demo
Suite Teardown   Close Application
Test Template   Select A Photo

*** Test Cases ***  PHOTO
Select Photo 1      1
Select Photo 2      2
Select Photo 3      3
Select Photo 4      4
Select Photo 5      5
Select Photo 6      6


*** Keywords ***
Select A Photo
    [Arguments]     ${photo}
    Click Photo     ${photo}
    Selected Photo Message Appears
    [Teardown]      Click OK Button


