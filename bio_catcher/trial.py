# coding:utf-8

import sys
import os

from operator import itemgetter

from browser import (
    HEADLESS_OPTIONS,
    DEFAULT_OPTIONS,
    url_for,
    create_chrome_driver,
)

from time import sleep
from tqdm import tqdm

BINARY_LOCATION = '/Applications/Google Chrome Canary.app/Contents/MacOS'

def trial():
    chrome = create_chrome_driver(
            HEADLESS_OPTIONS,
            # DEFAULT_OPTIONS,
            BINARY_LOCATION
    )

    os.makedirs('000_trial', exist_ok=True)
    with open("trial/trial.json", 'wb') as name:
        id = 0
        name.write('[\n'.encode('utf-8'))
        for e in tqdm(range(200)):
            name.write('    {\n'.encode('utf-8'))
            name.write(('        \"id\": ' + "{}" + ',\n').format(id).encode('utf-8'))
            name.write(('        \"favorite\": ' + 'false' + ',\n').encode('utf-8'))
            name.write('    },\n'.encode('utf-8'))
            id += 1
        name.write(']'.encode('utf-8'))

