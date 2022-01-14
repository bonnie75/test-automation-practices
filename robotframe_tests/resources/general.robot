*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}  chrome
${url}      https://demoqa.com/

*** Keywords ***
Go To Website
    Open Browser    ${url}  ${browser}