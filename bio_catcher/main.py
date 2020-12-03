# coding:utf-8

import sys

from browser import (
    HEADLESS_OPTIONS,
    DEFAULT_OPTIONS,
    url_for,
    create_chrome_driver,
)

from time import sleep

from tqdm import tqdm

BINARY_LOCATION = '/Applications/Google Chrome Canary.app/Contents/MacOS'
'''
>>> from selenium import webdriver
>>> import chromedriver_binary
>>> driver = webdriver.Chrome()
>>> diver.get('https://google.com')
'''

def url_list():
    chrome = create_chrome_driver(
        HEADLESS_OPTIONS,
        # DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # チャンピオンの一覧が掲載されているURLにアクセス
    CHAMPION_LIST_URL = 'https://universe.leagueoflegends.com/ja_JP/champions/'
    chrome.get(CHAMPION_LIST_URL)

    # チャンピオンページのURL獲得
    champion_web_elements = chrome.find_elements_by_class_name('item_30l8')
    champion_urls = [e.find_element_by_tag_name('a').get_attribute('href') for e in champion_web_elements]

    # 獲得したチャンピオンページのURLをcsvに保存
    with open("champion_url_list.json", 'wb') as list:
        for e in champion_urls:
            list.write((e + '\n').encode('utf-8'))

    # サーバーに負荷をかけないためのディレイ
    sleep(30)
    
    
    
    bio_urls = []
    # 獲得したチャンピオンページのURLにアクセス
    for url in tqdm(champion_urls):
        chrome = create_chrome_driver(
            HEADLESS_OPTIONS,
            # DEFAULT_OPTIONS,
            BINARY_LOCATION
        )
#    url = 'https://universe.leagueoflegends.com/ja_JP/champion/xayah/'
        chrome.get(str(url))

        # バイオページのURL獲得
        champion_bio_web_elements = chrome.find_elements_by_class_name('biography_3YIe')
        world_bio_web_elements = chrome.find_elements_by_class_name('additionalContent_25fY')
        bio_web_elements = champion_bio_web_elements + world_bio_web_elements
        # チャンピオン名獲得
        champion_name = chrome.find_element_by_class_name('title_1orQ')
        # チャンピオンの名前とURLをマージして配列に格納 → ['ザヤ', 'http://...']
        bio_urls.extend([[champion_name.get_attribute('innerHTML'), e.find_element_by_tag_name('a').get_attribute('href')] for e in bio_web_elements])

        # 獲得したバイオページのURLをcsvに保存
        with open("bio_url_list.json", 'ab') as list:
            for e in bio_web_elements:
                list.write((champion_name.get_attribute('innerHTML') + '\n').encode('utf-8'))
                list.write((e.find_element_by_tag_name('a').get_attribute('href')+ '\n').encode('utf-8'))

        # サーバーに負荷をかけないためのディレイ
        sleep(100)

        chrome.quit()

    return bio_urls




def bio_explorer(url_array):
    for array in tqdm(url_array):
        chrome = create_chrome_driver(
            HEADLESS_OPTIONS,
            # DEFAULT_OPTIONS,
            BINARY_LOCATION
        )

        # 獲得したバイオページのURLにアクセス
        chrome.get(array[1])
        
        # タイトルのweb_elementを獲得
        catch_title = chrome.find_element_by_class_name('title_121J')
        catch_contents = chrome.find_elements_by_class_name('p_1_sJ')
        
        # 関係するチャンピオン、タイトル、本文をマージしてjsonに格納 → {"champion": "ザヤ", "title": "ザヤ", "content": "〜"},
        # カサディンはHTMLの構造が違うので手動で修正が必要
        with open("000_bio.json", 'ab') as bio:
            bio.write('    {\n'.encode('utf-8'))
            bio.write(('        \"champion\": \"' + array[0] + '\",\n').encode('utf-8'))
            bio.write(('        \"title\": \"' + catch_title.get_attribute('innerHTML') + '\",\n').encode('utf-8'))
            bio.write('        \"content\": \"'.encode('utf-8'))
            for e in catch_contents:
                bio.write(e.get_attribute('innerHTML').replace('<i>', '').replace('</i>', '').replace('<br>', '').replace('\"', '\\"').encode('utf-8'))
                bio.write('\\n'.encode('utf-8'))
            bio.write('\",\n'.encode('utf-8'))
            bio.write('    },\n'.encode('utf-8'))
        
        
        sleep(100)
        
        chrome.quit()


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
