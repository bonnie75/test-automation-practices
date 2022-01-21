*** Settings ***
Documentation   test cases for the list demo
Resource        ../resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To List Demo
Test Teardown   Close Application
Test Template   Open Learn More About Cloud Alert

    
*** Test Cases ***                        CLOUD    
Learn More Altocumulus Message            Altocumulus
Learn More Altostratus Message            Altostratus
Learn More Cirrocumulus Message           Cirrocumulus
Learn More Cirrostratus Message           Cirrostratus
Learn More Cirrus Message                 Cirrus 
Learn More Cumulonimbus Message           Cumulonimbus
Learn More Cumulus Congestus Message      Cumulus Congestus
Learn More Cumulus Mediocris Message      Cumulus Mediocris
Learn More Cumulus humilis Message        Cumulus humilis
Learn More Fog Message                    Fog
Learn More Nimbostratus Message           Nimbostratus
Learn More Noctilucent Message            Noctilucent
Learn More Polar Stratospheric Message    Polar Stratospheric
Learn More Stratocumulus Message          Stratocumulus
Learn More Stratus Message                Stratus 

*** Keywords ***
Open Learn More About Cloud Alert
    [Arguments]     ${cloud}
    wait until page contains       Check out these clouds   timeout=10 seconds
    Click Cloud Name       ${cloud}
    Click Learn More Button
    Alert Should Be Visible     ${cloud}
