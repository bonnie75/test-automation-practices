*** Settings ***
Documentation   test cases for the list demo
Resource        ../resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To List Demo
Test Teardown   Close Application
Test Template   View Each Cloud From List

*** Test Cases ***      CLOUD    
Select Altocumulus             Altocumulus
Select Altostratus             Altostratus
Select Cirrocumulus            Cirrocumulus
Select Cirrostratus            Cirrostratus
Select Cirrus                  Cirrus 
Select Cumulonimbus            Cumulonimbus
Select Cumulus Congestus       Cumulus Congestus
Select Cumulus Mediocris       Cumulus Mediocris
Select Cumulus humilis         Cumulus humilis
Select Fog                     Fog
Select Nimbostratus            Nimbostratus
Select Noctilucent             Noctilucent
Select Polar Stratospheric     Polar Stratospheric
Select Stratocumulus           Stratocumulus
Select Stratus                 Stratus 


*** Keywords ***
View Each Cloud From List
    [Arguments]     ${cloud}
    wait until page contains       Check out these clouds   timeout=10 seconds
    Click Cloud Name       ${cloud}
    Selection Alert Should Be Visible   ${cloud}
