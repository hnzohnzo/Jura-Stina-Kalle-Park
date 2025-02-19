from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service

# Automatisk nedladdning och hantering av ChromeDriver
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

# Öppna en webbsida som test
driver.get('https://www.google.com')
print("Sidan är öppen!")

# Stäng webbläsaren
driver.quit()