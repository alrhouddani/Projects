from selenium.webdriver.chrome.options import Options


chrome_options = Options()
return webdriver.Chrome(options=chrome_options, executable_path='<path_to_chromedriver_file>')
