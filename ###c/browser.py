# coding:utf-8

import chromedriver_binary

try:
    from urllib.parse import urljoin
except:
    from urlparse import urljoin

from selenium import webdriver



DEFAULT_OPTIONS = [
    '--window-size=1920,1080',
    '--disable-application-cache',
    '--disable-infobars',
    '--no-sandbox',
    '--disable-dev-shm-usage',
    '--hide-scrollbars',
    '--enable-logging',
    '--log-level=0',
    '--ignore-certificate-errors',
#     '--homedir=%USERPROFILE%\AppData\Local\Temp', 
]
HEADLESS_OPTIONS = [
    '--headless',
    '--disable-gpu',
    '--window-size=1920,1080', 
    '--disable-application-cache', 
    '--disable-infobars',
    '--no-sandbox',
#    '--disable-dev-shm-usage',
    '--hide-scrollbars',
    '--enable-logging',
    '--log-level=0',
    '--ignore-certificate-errors',
]
# Chromeがある場所（macOSだと下記）
BINARY_LOCATION = '/Applications/Google Chrome Canary.app/Contents/MacOS'



class Chrome(webdriver.Chrome):
    ''' Derived from selenium.webdriver.Chrome '''
    def __init__(self, options):
        super(Chrome, self).__init__(options=options)

    def __del__(self):
        ''' Free memory when deleting this instance '''
        self.quit()

    def __repr__(self):
        ''' Representation for print debugging '''
        return '<Chrome url: "{}">'.format(self.current_url)



def create_chrome_driver(options, binary_location=None):
    """Cromeブラウザを立ち上げる関数

    Args:
        options (list): { HEADLESS_OPTIONS, DEFAULT_OPTIONS } 選択して
        binary_location (list):　BINARY_LOCATION

    Return:
        chrome (class Chrom): Chromeブラウザのインスタンス？オブジェクト？を返す
    """
    
    driver_opts = webdriver.ChromeOptions()
    for option in options:
        driver_opts.add_argument(option)
    chrome = Chrome(options=driver_opts)

    return chrome


