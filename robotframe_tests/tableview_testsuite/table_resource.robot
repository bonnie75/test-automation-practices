*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}         chrome
${tablepage}     https://computer-database.gatling.io/computers

*** Keywords ***
Go To Table Page
    Open Browser   ${tablepage}  ${browser}

Alert Message Should Not Display
    element should not be visible   //div[@class='alert-message']

Click Add New Computer Button
    click link  //a[@id='add']

Click Cancel Button
    click link      //a[contains(text(),'Cancel')]

Click Clear Button
    clear element text      //input[@id='searchbox']

Click Computer Name From List
    click link  //a[contains(text(),'ASCI Blue Mountain')]

Click Header
    [Arguments]     ${name}
    click link      //a[contains(text(),'${name}')]

Click Computer Name Header
    click link      //a[contains(text(),'Computer name')]

Click Create This Computer Button
    Click element   //body/section[@id='main']/form[1]/div[1]/input[1]

Click Delete This Computer Button
    click element   //body/section[@id='main']/form[2]/input[1]

Click Filter By Name Button
    Click element   //input[@id='searchsubmit']

Click Next Button
    Click link      //a[contains(text(),'Next →')]   

Click Previous Button 
    click link      //a[contains(text(),'← Previous')]

Computer Form Should Be Visible
    element should be visible   //body/section[@id='main']/form[1]

Computer Name Should Display Error
    element should be visible   //span[contains(text(),'Failed to refine type : Predicate isEmpty() did no')]

Computer Name Should Be Visible
    Element Attribute Value Should Be    //input[@id='name']     value  ASCI Blue Mountain

Enter Company 
    select from list by value   //select[@id='company']     4

Enter Computer Name
    input text  //input[@id='name']     IBM

Enter Discontinued Date
    input text  //input[@id='discontinued']     1999-05-27

Enter Filter Value
    [Arguments]     ${value}    
    input text  //input[@id='searchbox']    ${value}

Enter Introduced Date 
    input text  //input[@id='introduced']       1990-09-01

Filter Field Should Be Empty
    Element Attribute Value Should Be       //input[@id='searchbox']    placeholder     Filter by computer name...

List Should Be Sorted In Order
    [Arguments]     ${header}   ${order}    ${name}
    Element Attribute Value Should Be         //a[contains(text(),'${name}')]    href     https://computer-database.gatling.io/computers?p=0&n=10&s=${header}&d=${order}

List Should Be Sorted In desc Order  
    [Arguments]     ${header}   ${order}    ${name}
    Element Attribute Value Should Be       //a[contains(text(),'Company')]     href    https://computer-database.gatling.io/computers?p=0&n=10&s=${header}&d=desc

Page Should Display Next
    element should be visible     //a[contains(text(),'Displaying 11 to 20 of 574')]

Page Should Display First
    Element Should Be Visible      //a[contains(text(),'← Previous')]  

Required Field Should Be Visible
    Element Attribute Value Should Be       //input[@id='searchbox']    required    true

Table Should Be Visible
    element should be visible   //body/section[@id='main']/table[1]

Table Should Not Be Visible    
    element should be visible    //body/section[@id='main']/div[2]

