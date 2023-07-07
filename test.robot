*** Settings ***
Documentation	To validate the Login form
Library		SeleniumLibrary
Test Teardown	Close Browser

*** Variables ***
${Error_Message_Login}		css:.alert-danger

*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the mortgage payment url
    fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the mortgage payment url
    ${options}		Evaluate	sys.modules['selenium.webdriver'].FirefoxOptions()
    Call Method		${options}	add_argument	--headless
    Create Webdriver	Firefox		options=${options}
    Go To		https://rahulshettyacademy.com/loginpagePractise/

fill the login form
    Input Text		id:username	test
    Input Password	id:password	test
    Click Button	signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible	${Error_Message_Login}

verify error message is correct
    Element Text Should Be	${Error_Message_Login}		Incorrect username/password.
    ${result}=	Get Text	${Error_Message_Login}
    Should Be Equal As Strings	${result}			Incorrect username/password.

