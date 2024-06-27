from selenium import webdriver
from pyvirtualdisplay import Display
from selenium.webdriver.chrome.options import Options

display = Display(visible=0, size=(800, 600))
display.start()

chrome_options = Options()
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')

driver = webdriver.Chrome(options=chrome_options)
driver.get('https://www.google.com/')

driver.implicitly_wait(20)

print(driver.title)
