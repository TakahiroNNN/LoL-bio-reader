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


url_for = lambda base, url_rule: urljoin(base, url_rule).strip()


def create_chrome_driver(options, binary_location=None):
    driver_opts = webdriver.ChromeOptions()

    '''
    if driver_opts is None:
        driver_opts.binary_location = chromedriver_binary.chromedriver_filename
    else:
        driver_opts.binary_location = binary_location
    '''
    for option in options:
        driver_opts.add_argument(option)

    chrome = Chrome(options=driver_opts)
    return chrome


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
