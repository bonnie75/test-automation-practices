*** Settings ***
Documentation   test cases for the list demo
Resource        ../resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To List Demo
Test Teardown   Close Application

    
*** Test Cases *** 
Close Description Alert
    wait until page contains       Check out these clouds   timeout=10 seconds  
    Click Cloud Name       Cirrus
    Click Learn More Button
    Click OK Button     
    Alert Should Not Be Visible