# coding:utf-8

import os
import sys
import shelve

from time import sleep
from tqdm import tqdm

from browser import (
    HEADLESS_OPTIONS,
    DEFAULT_OPTIONS,
    BINARY_LOCATION,
    create_chrome_driver,
)
from functions import (
    get_champions_pageview_url_list,
    get_champions_lore_url_dict,
    get_lore_contents,
    get_champion_name_jpn_eng,
    get_region_name_jpn_eng,
    champion_data,
    region_data,
    champion_imageset_template,
    test
)
from trial import trial



def main():
    # get_champions_pageview_url_list(sys.argv[0])
    # get_champions_lore_url_dict(sys.argv[0])
    # get_lore_contents(sys.argv[0])
    # get_champion_name_jpn_eng(sys.argv[0])
    # get_region_name_jpn_eng(sys.argv[0])

    # aaa()

    pass










def demo(url):
    chrome = create_chrome_driver(
#        HEADLESS_OPTIONS,
        DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # chrome.getで指定したURLへ移動（GETリクエストの実行）をする
    chrome.get(url)
    sleep(5)
    
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
        content = i.get_attribute('innerHTML').replace('<i>', '').replace('</i>', '').replace('<br>', '').replace(' ', '').replace('<em>', '').replace('</em>', '').strip()
        print(content, end='\\n\\n')
    print(',\n')
    
    # browser.pyで定義したurl_for関数を使うと、'/'区切りでパスを指定するときに見やすくなるのでおすすめの書き方
    # print(url_for('https://google.com', 'news')) # => https://google.com/news へ移動
    # chrome.get(url_for(url, 'news'))
    
    chrome.quit()
