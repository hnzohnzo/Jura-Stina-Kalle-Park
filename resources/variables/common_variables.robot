# Grup 8 Moa,Hannes, Sumeyye 
#
*** Variables ***
# Common variables from common.robot
${BROWSER}           headlesschrome
${URL}               file://${EXECDIR}/website/jurap.html
${TIMEOUT}           10s

# Variables from kim.robot
${KIM_USERNAME}      KimAndFamily
${KIM_PASSWORD}      KimAndFamily123

# Variables from stina-palle.robot
${STINA_USERNAME}    StinaPalle5
${STINA_PASSWORD}    Paleontologen

# Shared variables 
${KIM_SHORT_PASSWORD}    Kim
${KIM_WRONG_PASSWORD}    Wrongpassword123
${STINA_SHORT_PASSWORD}    Palle
${STINA_WRONG_PASSWORD}    PaleontologWrong
#${loginbutton}    xpath=//button[@type='submit']