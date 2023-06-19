*** Settings ***
Library     SeleniumLibrary
Library     ../Resources/CustomLibs/ingredient_generator.py
Resource    ../Resources/Common.robot
Resource    ../Resources/PO/GoogleLanding.robot
Resource    ../Resources/PO/GoogleResults.robot

*** Keywords ***
Get ingredient
    ${INGREDIENT1} =    ingredient_generator.generate ingredient
    log                 ${INGREDIENT1}

Get 3 ingredients
    ${INGREDIENT1} =    ingredient_generator.generate ingredient
    set global variable    ${INGREDIENT1}
    ${INGREDIENT2} =    ingredient_generator.generate ingredient
    set global variable     ${INGREDIENT2}
    ${INGREDIENT3} =    ingredient_generator.generate ingredient
    set global variable     ${INGREDIENT3}
    log                 ${INGREDIENT1} ${INGREDIENT2} ${INGREDIENT3}

*** Keywords ***
Generate 1 random ingredient
    Get ingredient

Generate 3 random ingredients
    Get 3 ingredients

Perform search
    GoogleLanding.Navigate to
    GoogleLanding.Accept cookies
    GoogleLanding.Verify page loaded
    GoogleLanding.Search

Collate results as txt file
    GoogleResults.Verify page loaded
    GoogleResults.Generate results list     ${INGREDIENT1}  ${INGREDIENT2}  ${INGREDIENT3}
    GoogleResults.Save to txt file          ${INGREDIENT1}  ${INGREDIENT2}  ${INGREDIENT3}