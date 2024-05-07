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
import shelve

from browser import (
    HEADLESS_OPTIONS,
    DEFAULT_OPTIONS,
    BINARY_LOCATION,
    create_chrome_driver,
)

from tqdm import tqdm
from time import sleep

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



def get_champions_pageview_url_list(argv_0):
    """各チャンピオンのページのURLをローカルDBに保存
    champion_pageview_url_list = [
        'https://universe.leagueoflegends.com/ja_JP/champion/ivern/',
        'https://universe.leagueoflegends.com/ja_JP/champion/akali/',
        ...
    ]

    Args:
        argv_0 (argv): 第一システム変数 sys.argv[0]（トップディレクトリからプログラムを走らせることを想定）

    Return:
        None (None): ---
    """

    chrome = create_chrome_driver(
        HEADLESS_OPTIONS,
        # DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # チャンピオンページへの一覧が確認できるURLにアクセス
    chrome.get('https://universe.leagueoflegends.com/ja_JP/champions/')
    sleep(10)
    # チャンピオンページのURL取得
    champion_web_elements = chrome.find_elements_by_class_name('item_30l8')
    champion_pageview_url_list = [e.find_element_by_tag_name('a').get_attribute('href') for e in champion_web_elements]

    # カレントディレクトリを取得して、引数のシステム変数をパスに追加
    path = os.getcwd() + "/"+argv_0
    # ローカルdbに保存
    with shelve.open(path+'/db/LoL_Lore_Reader') as db:
        db["champion_pageview_url_list"] = champion_pageview_url_list

    chrome.quit()



def get_champions_lore_url_dict(argv_0):
    """DBの「champion_pageview_url_list」から、各チャンピオンのLoreがあるURLを取得
    lore_url_dict = {
        'アイバーン' : ['https://universe.leagueoflegends.com/ja_JP/story/champion/ivern/',
                        'https://universe.leagueoflegends.com/ja_JP/story/ivern-color-story/',
                        ''], ※配列の最後の値が入っていないことに注意
        'アカリ' : ['...', ...]
    }

    Args:
        argv_0 (argv): 第一システム変数 sys.argv[0]（トップディレクトリからプログラムを走らせることを想定）

    Return:
        None (None): ---
    """

    # カレントディレクトリを取得して、引数のシステム変数をパスに追加
    path = os.getcwd() + "/"+argv_0
    # ローカルdbから読み込み
    db = shelve.open(path+'/db/LoL_Lore_Reader')
    champion_pageview_url_list = db["champion_pageview_url_list"]

    # LoreのURLを格納する辞書
    lore_url_dict = {}
    # 読み込んだ各チャンピオンページのURLにアクセス
    for url in tqdm(champion_pageview_url_list):
        chrome = create_chrome_driver(
            HEADLESS_OPTIONS,
            # DEFAULT_OPTIONS,
            BINARY_LOCATION
        )
        chrome.get(str(url))
        sleep(10)
        # チャンピオンバイオとその他物語のWEBエレメントを取得
        champion_bio_web_elements = chrome.find_elements_by_class_name('biography_3YIe')
        world_bio_web_elements = chrome.find_elements_by_class_name('additionalContent_25fY')
        lore_web_elements = champion_bio_web_elements + world_bio_web_elements
        # チャンピオンの日本語名を取得
        champion_name = chrome.find_element_by_class_name('title_1orQ')
        # チャンピオンの日本語名をキー(str)、LoreのURLを値(list)として格納 -> {"xayah": ["hoge", "hage", ...], ...}
        lore_url_dict[champion_name.get_attribute('innerHTML')] = \
            [e.find_element_by_tag_name('a').get_attribute('href') for e in lore_web_elements]
        # サーバーに負荷をかけないためのディレイ
        sleep(30)
        chrome.quit()

    # DBへ書き込み
    db["lore_url_dict"] = lore_url_dict
    # DBを閉じる
    db.close()



def get_lore_contents(argv_0):
    """DBの「lore_url_dict」から、各チャンピオンのLoreの情報を辞書として取得
    lore_contents_dict = {
        'アイバーン0' : {
            'title': 'アイバーン',
            'contents': ['古代ボリヤルドの後期、...', '', ...]
        },
        'アイバーン1' : {
            'title': '毒の贈り物',
            'contents': ['ほとんどの人間にとって、', '', ...]
        },
        'アカリ0' : {
            ...
        }
    }

    Args:
        argv_0 (argv): 第一システム変数 sys.argv[0]（トップディレクトリからプログラムを走らせることを想定）

    Return:
        None (None): ---
    """

    # カレントディレクトリを取得して、引数のシステム変数をパスに追加
    path = os.getcwd() + "/"+argv_0
    # ローカルdbから読み込み
    db = shelve.open(path+'/db/LoL_Lore_Reader')
    lore_url_dict = db["lore_url_dict"]

    # Loreの情報を格納するための辞書を作成
    lore_contents_dict = {}
    for key in tqdm(lore_url_dict.keys()):
        for index in range(len(lore_url_dict[key])):
            if lore_url_dict[key][index] == "": 
                pass
            else:
                chrome = create_chrome_driver(
                    HEADLESS_OPTIONS,
                    # DEFAULT_OPTIONS,
                    BINARY_LOCATION
                )
                chrome.get(lore_url_dict[key][index])
                sleep(10)

                # タイトル、サブタイトル、本文のweb_elementを獲得
                catch_title = chrome.find_element_by_class_name('title_121J')
                catch_contents = chrome.find_elements_by_class_name('p_1_sJ')

                # Loreの情報を辞書に格納
                lore_contents_dict[key+f"{index}"] = {
                    "title": catch_title.get_attribute('innerHTML'),
                    "contents": [e.get_attribute('innerHTML').replace('<i>', '').replace('</i>', '') for e in catch_contents]
                }
                # カサディンのストーリーだけHTMLの構造が異なるので処理を変える
                if catch_title.get_attribute('innerHTML') == "カサディン":
                    lore_contents_dict[key+f"{index}"] = {
                        "title": catch_title.get_attribute('innerHTML'),
                        "contents": [ \
                            e.get_attribute('innerHTML').replace("<i>", "").replace("</i>", "").replace("\n", "").split("<br> <br>")\
                                for e in catch_contents] 
                    }
        
                sleep(30)
                chrome.quit()

    # DBへ書き込み
    db["lore_contents_dict"] = lore_contents_dict
    # DBを閉じる
    db.close()



def get_champion_name_jpn_eng(argv_0):
    """各チャンピオンの日本語名をキー、英語名を値とした辞書をローカルDBに保存
    champion_name_jpn_eng = {
        'アイバーン': 'ivern',
        'アカリ': 'akali',
        ...
    }

    Args:
        argv_0 (argv): 第一システム変数 sys.argv[0]（トップディレクトリからプログラムを走らせることを想定）

    Return:
        None (None): ---
    """

    chrome = create_chrome_driver(
        HEADLESS_OPTIONS,
        # DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # チャンピオンの一覧が掲載されているURLにアクセス
    chrome.get('https://universe.leagueoflegends.com/ja_JP/champions/')

    # チャンピオンの日本語名をキー、英語名を値とした辞書を作成
    champion_name_jpn_eng = {}
    champion_web_elements = chrome.find_elements_by_class_name('item_30l8')
    for e in tqdm(champion_web_elements):
        champion_name_jpn_eng[e.find_element_by_tag_name('h1').get_attribute('innerHTML')] = \
            e.find_element_by_tag_name('a').get_attribute('href').replace("https://universe.leagueoflegends.com/ja_JP/champion/", "").replace("/", "")

    # サーバーに負荷をかけないためのディレイ
    sleep(30)

    # カレントディレクトリを取得して、引数のシステム変数をパスに追加
    path = os.getcwd() + "/"+argv_0
    # ローカルdbに保存
    with shelve.open(path+'/db/LoL_Lore_Reader') as db:
        db["champion_name_jpn_eng"] = champion_name_jpn_eng
    
    chrome.quit()



def get_region_name_jpn_eng(argv_0):
    """各地域の日本語名をキー、英語名を値とした辞書をローカルDBに保存
    champion_name_jpn_eng = {
        'アイオニア': 'ionia',
        'イシュタル': 'ixtal',
        ...
    }

    Args:
        argv_0 (argv): 第一システム変数 sys.argv[0]（トップディレクトリからプログラムを走らせることを想定）

    Return:
        None (None): ---
    """

    chrome = create_chrome_driver(
        HEADLESS_OPTIONS,
        # DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # 地域の一覧が掲載されているURLにアクセス
    chrome.get('https://universe.leagueoflegends.com/ja_JP/regions/')

    # 地域の日本語名をキー、英語名を値とした辞書を作成
    region_name_jpn_eng = {}
    region_web_elements = chrome.find_elements_by_class_name('factionWrapper_9Uuf')
    for e in tqdm(region_web_elements):
        region_name_jpn_eng[e.find_element_by_tag_name('h3').get_attribute('innerHTML').strip()] = \
            e.get_attribute('href').replace("https://universe.leagueoflegends.com/ja_JP/region/", "").replace("/", "")

    # サーバーに負荷をかけないためのディレイ
    sleep(30)

    # カレントディレクトリを取得して、引数のシステム変数をパスに追加
    path = os.getcwd() + "/"+argv_0
    # ローカルdbに保存
    with shelve.open(path+'/db/LoL_Lore_Reader') as db:
        db["region_name_jpn_eng"] = region_name_jpn_eng
    
    chrome.quit()














def champion_data():
    chrome = create_chrome_driver(
        HEADLESS_OPTIONS,
        # DEFAULT_OPTIONS,
        BINARY_LOCATION
    )

    # チャンピオンの一覧が掲載されているURLにアクセス
    chrome.get('https://universe.leagueoflegends.com/ja_JP/champions/')

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



def test():
    pass