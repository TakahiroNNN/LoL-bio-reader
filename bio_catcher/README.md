# `demo_selenium`

seleniumからchromeの制御を行うサンプルスクリプト
※一切動かしてないので、多分動かないです

## スクリプトの構成

* `browser.py`
    - Chromeのウェブドライバを使ってChromeの起動とその後の制御をつかさどるChromeインスタンスを作成する
* `main.py`
    - `browser.py`で作成したChromeインスタンスを使って適当なWebサイトにアクセスするデモ
* `__main__.py`
    - `main.py`の呼び出しを行うためワンクッションとして作った実行用のスクリプト
    - pythonでは`__main__.py`というファイルを見つけたら、そのディレクトリを指してスクリプトを実行できる
    - つまり`python demo_selenium`は`python demo_selenium/__main__.py`と同義

## セットアップ

1. お使いの環境に合わせてPythonのパッケージ管理ツール`pip`をインストールしてください
2. 下記コマンドにより必要なパッケージをインストール
    - `pip install -r demo_selenium/requirements.txt`
3. Chromeをインストール
4. Chromeのバージョンに対応したChromeのウェブドライバ（ブラウザを制御するソフト）をインストール
    i. Chromeのバージョンを確認
    ii. `pip install chromedriver-binary=={version}`

## 実行方法

* `python demo_selenium/ demo {url}`
    - example: `python demo_selenium https://www.google.com/`

## Chromeが自動更新された場合には

`chromedriver_binary`は現在インストールされているChromeのバージョンに対応するものを利用する必要があります。
これは`chromedriver_binary`を使っていると直面する問題なので、認識しておいてください。

下記の手順に従って最新のパッケージをインストールすると正常に動作します。

1. Chromeを開いて、`chrome://version`から現在のブラウザのバージョンを確認する
2. `https://pypi.org/project/chromedriver-binary/#history`から対応する`chromedriver_binary`のバージョンを確認する
3. `pip install --upgrade chromedriver-binary=={version}`を実行して`chromedriver_binary`を更新してください

## その他

seleniumのpythonインターフェースについてクイックレファレンスがあったので記載しておきます。
`https://www.seleniumqref.com/api/webdriver_abc_python.html`
どんなことができるか見れるので一読するといいかも。
