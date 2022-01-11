*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}  chrome
${url}     https://demoqa.com/automation-practice-form

*** Keywords ***
Choose Image File
    Choose file     //input[@id='uploadPicture']    ${CURDIR}/min2bg.jpg

Choose Non-Image File
    Choose file     //input[@id='uploadPicture']    ${CURDIR}/output.xml

Click Calendar Field
    click element   //input[@id='dateOfBirthInput']

Click Submit Button
    set focus to element    //button[@id='submit']
    click Button    //button[@id='submit']

Date Picker Should Be Visible
    element should be Visible   //body/div[@id='app']/div[1]/div[1]/div[2]/div[2]/div[1]/form[1]/div[5]/div[2]/div[2]/div[2]/div[1]/div[1]/div[2]

Date Should Be Visible on Modal
    element should contain      //body/div[4]/div[1]/div[1]/div[2]/div[1]/table[1]    07 May,1957

Enter Birth Date
    Clear Element Text  //input[@id='dateOfBirthInput'] 
    Input Text      //input[@id='dateOfBirthInput']     January 10, 1967

Enter Email
    Input Text    //input[@id='userEmail']     allietest@fake.com
    
Enter First Name
    Input Text      //input[@id='firstName']    Allie
    
Enter Last Name
    Input Text    //input[@id='lastName']   Test

Enter Phone Number
    [Arguments]     ${phone}
    Input Text      //input[@id='userNumber']       ${phone}

Enter Required Fields
    Enter First Name
    Enter Last Name
    Select Gender Option
    Enter Phone Number      9991231234

Enter Subjects
    Input Text      //input[@id='subjectsInput']    Maths
    Press Keys      //input[@id='subjectsInput']    ENTER

Error Should Be Visible
    Element should be Visible   //div[@id='errorMessage']

Gender Field Should Be Red
    ${style}=   Get Element Attribute   css:style   custom-control-label
    log to console   ${style}

Go To Website
    Open Browser    ${url}  ${browser}

Image Name Should Be on Modal
    element should contain      //body/div[4]/div[1]/div[1]/div[2]/div[1]/table[1]      min2bg.jpg

Select City Option
    Input Text      //input[@id='react-select-4-input']     Panipat
    Press Keys      //input[@id='react-select-4-input']     ENTER

Select City Option Should Be Disabled
    element should be disabled   //input[@id='react-select-4-input']

Select Date
    click element       //select[@class='react-datepicker__month-select']
    select from list by value    //select[@class='react-datepicker__month-select']   4
    click element       //select[@class='react-datepicker__year-select']
    select from list by value    //select[@class='react-datepicker__year-select']  1957
    Click element       //body/div[@id='app']/div[1]/div[1]/div[2]/div[2]/div[1]/form[1]/div[5]/div[2]/div[2]/div[2]/div[1]/div[1]/div[2]/div[2]/div[2]/div[3]

Select Gender Option
    click Element   //label[contains(text(),'Female')]

Select Hobbies
    [Arguments]     ${hobby}
    click Element      //label[contains(text(),'${hobby}')]

Select State Option
    Input Text      //input[@id='react-select-3-input']     Haryana
    Press Keys      //input[@id='react-select-3-input']     ENTER

Selected Hobby Should Be on Modal
    element should contain      //body/div[4]/div[1]/div[1]/div[2]/div[1]/table[1]   Reading

Selected Hobbies Should Be on Modal
    element should contain      //body/div[4]/div[1]/div[1]/div[2]/div[1]/table[1]   Sports, Music

Submit Modal Should Be Visible
    Element Should Be Visible   //div[@id='example-modal-sizes-title-lg']

Submit Modal Should Not Be Visible
    Element Should Not Be Visible   //div[@id='example-modal-sizes-title-lg']