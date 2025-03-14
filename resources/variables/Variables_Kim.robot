*** Settings ***
Library  SeleniumLibrary 


*** Variables ***
${URL}              file:///${EXECDIR}/website/jurap.html
${BROWSER}          headlesschrome
${USERNAME}         KimUsername
${PASSWORD}         KimPassword123
${SAFARI_TYPE}      T-Rex Rumble eXtreme Thrill Pack
${EXPECTED_DATE}    2025-06-28  # SWE format
${SAFARI_DATE}      06-28-2025  # USA format, Ändra till svenskt för Lokal körning.
${SAFARI_QUANTITY}  4
${alert_text}  



