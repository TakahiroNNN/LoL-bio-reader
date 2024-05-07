# coding:utf-8


import sys

from browser import (
    HEADLESS_OPTIONS,
    DEFAULT_OPTIONS,
    url_for,
    create_chrome_driver,
)

from time import sleep


#BINARY_LOCATION = '/Users/owajhin/Downloads/chromedriver'
BINARY_LOCATION = '/Applications/Google Chrome Canary.app/Contents/MacOS'
#BINARY_LOCATION = '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome' # Chromeのパスを書いてください
'''
>>> from selenium import webdriver
>>> import chromedriver_binary
>>> driver = webdriver.Chrome()
>>> diver.get('https://google.com')
'''

def demo(url):
    chrome = create_chrome_driver(
#        HEADLESS_OPTIONS,
        DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # chrome.getで指定したURLへ移動（GETリクエストの実行）をする
    chrome.get(url)
    sleep(30)
    
#    print(chrome.page_source.encode('utf-8'))

#    catch_element = chrome.find_element_by_class_name('p_1_sJ')
#    print(catch_element.get_attribute('innerHTML').encode('utf-8'))

#    catch_element = chrome.find_elements_by_class_name('p_1_sJ')
#    for i in catch_element:
#        print(i.get_attribute('innerHTML').encode('utf-8'))

    catch_title = chrome.find_element_by_class_name('title_121J')
    print('')
    print('\"title\":', end=' ')
    print(catch_title.get_attribute('innerHTML'), end=',\n')
    
    catch_element = chrome.find_elements_by_class_name('p_1_sJ')
    print('\"content\":', end=' ')
    for i in catch_element:
        content = i.get_attribute('innerHTML')
        print(content, end='\\n')
    print(',\n')
    
    # browser.pyで定義したurl_for関数を使うと、'/'区切りでパスを指定するときに見やすくなるのでおすすめの書き方
    # print(url_for('https://google.com', 'news')) # => https://google.com/news へ移動
    # chrome.get(url_for(url, 'news'))
    
    chrome.quit()
