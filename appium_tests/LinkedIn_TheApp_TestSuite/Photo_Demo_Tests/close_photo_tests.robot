*** Settings ***
Documentation   test cases for the photo demo
Resource        ../resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To Photo Demo
Test Teardown   Close Application

*** Test Cases ***
Close Photo Message
    Click Photo     6
    Click OK Button
    Alert Should Not Be Visible
