#!/usr/bin/env python3
# pip3 install requests[socks]
import requests

s = requests.Session()
s.headers.update(
    {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:65.0) Gecko/20100101 Firefox/65.0',
    }
)

resp = s.get('https://www.reddit.com', proxies=dict(http='socks5://docker:9050', https='socks5://docker:9050'), timeout=20)
print(resp.status_code)
print(resp.text[0:1000])

resp = s.get('https://api.ipify.org', proxies=dict(http='socks5://docker:9050', https='socks5://docker:9050'), timeout=20)
print(resp.status_code)
print(resp.text)