*** Settings ***
Documentation   test cases for the Picker demo
Resource        ./resources/resource.robot
Test Setup      Run Keywords    Open Android Application
...             AND     Go To Picker Demo
Test Teardown   Close Application

*** Test Cases ***
Select A Date
    Select A Month
    Select A Day
    Click Learn More Button
    On This Day Notice Appears
    

*** Keywords ***
Go To Picker Demo
    wait until page contains element    accessibility_id=Picker Demo   timeout=10 seconds
    click element       accessibility_id=Picker Demo

Click Learn More Button
    click element       //android.view.ViewGroup[@content-desc="learnMore"]

On This Day Notice Appears
    wait until page contains element    id=android:id/alertTitle   timeout=10 seconds
    element should be enabled       id=android:id/alertTitle

Select A Day
    click element       accessibility_id=dayPicker
    click element       //android.widget.CheckedTextView[8]

Select A Month
    wait until page contains element    accessibility_id=monthPicker       timeout=10 seconds
    click element       accessibility_id=monthPicker
    click element       //android.widget.CheckedTextView[9]



