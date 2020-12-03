# coding:utf-8

# champion_name_j_e()
# チャンピオンの和名と英語名を紐付けるリストを作成
# {"champion_name_j": "アイバーン","champion_name_e": "ivern",},{〜
# 
# region_name_j_e()
# 地域の和名と英語名を紐付けるリストを作成
# {"champion_name_j": "アイオニア","champion_name_e": "ionia",},{〜
# 
# champion_data()
# アプリで作成するチャンピオンデータを作成
# {"", ""}
# 
# region_data()
# アプリで作成する地域データを作成
# ※※※データは追加していく保存方法なので、すでに存在している場合は消すこと※※※
# ※※※紹介文は各地域ごとにHTMLのつくりが異なっていたので獲得できない物もある※※※
# ※※※地域名すら獲得できない場合も。sleep(300)が一番良い結果だった※※※
# {"", ""}
# 
# champion_imageset_template()
# アプリで使用するイメージセットを作成
# {"", ""}







import sys
import os

from browser import (
    HEADLESS_OPTIONS,
    DEFAULT_OPTIONS,
    url_for,
    create_chrome_driver,
)

from tqdm import tqdm
from time import sleep

BINARY_LOCATION = '/Applications/Google Chrome Canary.app/Contents/MacOS'
'''
>>> from selenium import webdriver
>>> import chromedriver_binary
>>> driver = webdriver.Chrome()
>>> diver.get('https://google.com')
'''

from constants import (
    CHAMPION_NAME_LIST,
    REGION_NAME_LIST
)

def champion_name_j_e():
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
    champion_name_lists = [[e.find_element_by_tag_name('h1').get_attribute('innerHTML'), e.find_element_by_tag_name('a').get_attribute('href')] for e in champion_web_elements]


    # チャンピオン名をマージしてjsonに格納 → {"champion_name_j": "ザヤ", "champion_name_e": "xayah",}, 〜
    with open("001_champion_name_j_e.json", 'wb') as name:
        for e in tqdm(champion_name_lists):
            name.write('    {\n'.encode('utf-8'))
            name.write(('        \"champion_name_j\": \"' + e[0] + '\",\n').encode('utf-8'))
            name.write(('        \"champion_name_e\": \"' + e[1].replace("https://universe.leagueoflegends.com/ja_JP/champion/", "").replace("/", "") + '\",\n').encode('utf-8'))
            name.write('    },\n'.encode('utf-8'))

    # サーバーに負荷をかけないためのディレイ
    sleep(10)
    
    chrome.quit()



def region_name_j_e():
    chrome = create_chrome_driver(
        HEADLESS_OPTIONS,
        # DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # 地域の一覧が掲載されているURLにアクセス
    REGION_LIST_URL = 'https://universe.leagueoflegends.com/ja_JP/regions/'
    chrome.get(REGION_LIST_URL)

    # 地域ページのURL獲得
    region_web_elements = chrome.find_elements_by_class_name('factionWrapper_9Uuf')
    region_name_lists = [[e.find_element_by_tag_name('h3').get_attribute('innerHTML'), e.get_attribute('href')] for e in region_web_elements]


    # 地域名をマージしてjsonに格納 → {"region_name_j": "アイオニア", "region_name_e": "ionia",}, 〜
    with open("001_region_name_j_e.json", 'wb') as name:
        for e in tqdm(region_name_lists):
            name.write('    {\n'.encode('utf-8'))
            name.write(('        \"region_name_j\": \"' + e[0].strip() + '\",\n').encode('utf-8'))
            name.write(('        \"region_name_e\": \"' + e[1].replace("https://universe.leagueoflegends.com/ja_JP/region/", "").replace("/", "") + '\",\n').encode('utf-8'))
            name.write('    },\n'.encode('utf-8'))

    # サーバーに負荷をかけないためのディレイ
    sleep(10)
    
    chrome.quit()



def champion_data():
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
    champion_name_lists = [[e.find_element_by_tag_name('h1').get_attribute('innerHTML'), e.find_element_by_tag_name('h2').find_element_by_tag_name('span').get_attribute('innerHTML')] for e in champion_web_elements]


    # チャンピオン名をマージしてjsonに格納
    with open("001_champion_data.json", 'wb') as name:
        id = 0
        for e in tqdm(champion_name_lists):
            name.write('    {\n'.encode('utf-8'))
            name.write(('        \"id\": ' + "{}" + ',\n').format(id).encode('utf-8'))
            name.write(('        \"name\": \"' + e[0].strip() + '\",\n').encode('utf-8'))
            name.write(('        \"region\": \"' + e[1].strip() + '\",\n').encode('utf-8'))
            for k in range(len(CHAMPION_NAME_LIST)):
                if e[0].strip() == CHAMPION_NAME_LIST[k].get('champion_name_j'):
                    name.write(('        \"imageName\": \"' + CHAMPION_NAME_LIST[k]['champion_name_e'] + '\",\n').encode('utf-8'))
                    break
            for k in range(len(REGION_NAME_LIST)):
                if e[1].strip() == REGION_NAME_LIST[k].get('region_name_j'):
                    name.write(('        \"iconName\": \"' + REGION_NAME_LIST[k]['region_name_e'] + '\",\n').encode('utf-8'))
                    break
            name.write('    },\n'.encode('utf-8'))
            id += 1

    # サーバーに負荷をかけないためのディレイ
    sleep(10)
    
    chrome.quit()



def region_data():
    chrome = create_chrome_driver(
        HEADLESS_OPTIONS,
        # DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # 地域の一覧が掲載されているURLにアクセス
    REGION_LIST_URL = 'https://universe.leagueoflegends.com/ja_JP/regions/'
    chrome.get(REGION_LIST_URL)

    # 地域ページのURL獲得
    region_web_elements = chrome.find_elements_by_class_name('factionWrapper_9Uuf')
    region_urls = [e.get_attribute('href') for e in region_web_elements]

    # 獲得したチャンピオンページのURLをcsvに保存
    with open("region_url_list.json", 'wb') as list:
        for e in region_urls:
            list.write((e + '\n').encode('utf-8'))

    # サーバーに負荷をかけないためのディレイ
    sleep(300)

    id = 0
    for url in tqdm(region_urls):
        # 各地域のページにアクセス
        chrome.get(url)

        # webElement獲得
        title_web_element = chrome.find_element_by_class_name('title_1orQ')
        print(title_web_element.get_attribute('innerHTML'))
        content_web_elements = chrome.find_element_by_class_name('introDescription_hkI3').find_element_by_class_name('description_1-6k').find_elements_by_tag_name('p')
        
        # 地域名をマージしてjsonに格納
        with open("000_region_data.json", 'ab') as name:
            name.write('    {\n'.encode('utf-8'))
            name.write(('        \"id\": ' + "{}" + ',\n').format(id).encode('utf-8'))
            name.write(('        \"name\": \"' + title_web_element.get_attribute('innerHTML') + '\",\n').encode('utf-8'))
            for k in range(len(REGION_NAME_LIST)):
                if title_web_element.get_attribute('innerHTML').strip() == REGION_NAME_LIST[k].get('region_name_j'):
                    name.write(('        \"iconName\": \"' + REGION_NAME_LIST[k]['region_name_e'] + '\",\n').encode('utf-8'))
                    name.write(('        \"imageName\": \"' + REGION_NAME_LIST[k]['region_name_e']+ '-Img' + '\",\n').encode('utf-8'))
                    break
            name.write('        \"content\": \"'.encode('utf-8'))
            for e in content_web_elements:
                name.write(e.get_attribute('innerHTML').replace('<i>', '').replace('</i>', '').replace('<br>', '').replace('\"', '\\"').encode('utf-8'))
                name.write('\\n'.encode('utf-8'))
            name.write('\",\n'.encode('utf-8'))
            name.write('    },\n'.encode('utf-8'))
            id += 1

        # サーバーに負荷をかけないためのディレイ
        sleep(300)
    
    chrome.quit()



def champion_imageset_template():
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
    champion_name_lists = [e.find_element_by_tag_name('a').get_attribute('href').replace("https://universe.leagueoflegends.com/ja_JP/champion/", "").replace("/", "") for e in champion_web_elements]

    for name in tqdm(champion_name_lists):
        os.makedirs('000_imageset/{}.imageset'.format(name), exist_ok=True)
        with open(os.path.join('imageset/{}.imageset'.format(name), 'Contents.json'), 'wb') as f:
            f.write(('{' + '\n').encode('utf-8'))
            f.write(('  "images" : [' + '\n').encode('utf-8'))
            f.write(('    {' + '\n').encode('utf-8'))
            f.write(('      "idiom" : "universal",' + '\n').encode('utf-8'))
            f.write(('      "scale" : "1x"' + '\n').encode('utf-8'))
            f.write(('    },' + '\n').encode('utf-8'))
            f.write(('    {' + '\n').encode('utf-8'))
            f.write(('      "idiom" : "universal",' + '\n').encode('utf-8'))
            f.write(('      "scale" : "2x"' + '\n').encode('utf-8'))
            f.write(('    },' + '\n').encode('utf-8'))
            f.write(('    {' + '\n').encode('utf-8'))
            f.write(('      "idiom" : "universal",' + '\n').encode('utf-8'))
            f.write(('      "scale" : "3x"' + '\n').encode('utf-8'))
            f.write(('    }' + '\n').encode('utf-8'))
            f.write(('  ],' + '\n').encode('utf-8'))
            f.write(('  "info" : {' + '\n').encode('utf-8'))
            f.write(('    "author" : "xcode",' + '\n').encode('utf-8'))
            f.write(('    "version" : 1' + '\n').encode('utf-8'))
            f.write(('  }' + '\n').encode('utf-8'))
            f.write(('}' + '\n').encode('utf-8'))

        # サーバーに負荷をかけないためのディレイ
        sleep(10)
    
    chrome.quit()