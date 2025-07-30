import csv
import requests
from lxml import html
import time
import datetime
from datetime import date
from datetime import datetime
from time import sleep
import pandas as pd
import json
import re
import random
from pytz import timezone, utc
import concurrent.futures
import csv
from urllib.parse import urlencode
import base64
import binascii
import threading


# from fake_useragent import UserAgent

# ua = UserAgent()
# headers = {"User-Agent": ua.random}


lock = threading.Lock()

clean = re.compile('<.*?>')
API_KEY = 'fe681822c94281d9593dbb30bf263c67'
NUM_RETRIES = 3
NUM_THREADS = 10
API_KEY_BEE = '4AV0KYEOGTZCBCEPK8MTHO1R9882NBD5HAEJQG1GC8U2TMSKUB9BXITH13OUC8YDTMTAM5Y0J5ZKW4JG'



def useragentselector():
    user_agent = [
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62',
        'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62 ',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62',
         'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',

    ]
    return random.choice(user_agent)
def main(key_id, input1):
    userAgent = useragentselector()
    # produrl = f'https://sppim.satyapaul.com/pim/pimresponse.php?service=product&store=1&url_key=the-jaguar-tie-hanky-set-410329283001&origin=ind'

    # List of natural referers from common websites
    referers = [
        "https://www.google.com/",
        "https://www.bing.com/",
        "https://www.yahoo.com/",
        "https://www.facebook.com/",
    ]

    # Choose a random referer
    random_referer = random.choice(referers)

    headers = {
        'authority': 'www.croma.com',
        'method': 'GET',
        'scheme': 'https',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
        "Referer": random_referer,
        'Accept-Language': 'en-US,en;q=0.9',
        'sec-ch-ua': '"Not(A:Brand";v="99", "Google Chrome";v="133", "Chromium";v="133"',
        'user-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36',
        "Connection": "keep-alive"
        # 'user-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
        # 'cookie': 'name=value; _dy_csc_ses=t; _dy_c_exps=; _dycnst=dg; _dyid=810648183743131312; _dyjsession=b87e8ef82391f2d8c2452b921c294106; _dycst=dk.w.c.ms.; _dy_geo=IN.AS.IN_MH.IN_MH_Ratnagiri; _dy_df_geo=India..Ratnagiri; session_utm_source=google; session_utm_medium=cpc; session_utm_campaign=Sok_SP_Brand_Search; session_utm_term=satyapaulutm_source%253Dgoogle; session_utm_content=null; _gcl_aw=GCL.1709789634.CjwKCAiAxaCvBhBaEiwAvsLmWA28XG5ti1-z-l-k1ItrAa_-_ZsM8EvjdiDWvJ5urop_u_2mfIIgmxoCS9EQAvD_BwE; _gcl_au=1.1.798115473.1709789634; _gid=GA1.2.1727628085.1709789634; _hjSession_3441680=eyJpZCI6ImMwMjlkZTM1LTc4NWMtNDc1NS1iNDE5LWU2YTYyOTVhMGEwMCIsImMiOjE3MDk3ODk2MzQ1OTQsInMiOjAsInIiOjAsInNiIjowLCJzciI6MCwic2UiOjAsImZzIjoxLCJzcCI6MX0=; _fbp=fb.1.1709789634666.1972150019; _gac_UA-10605953-1=1.1709791449.CjwKCAiAxaCvBhBaEiwAvsLmWA28XG5ti1-z-l-k1ItrAa_-_ZsM8EvjdiDWvJ5urop_u_2mfIIgmxoCS9EQAvD_BwE; _gac_UA-232506391-2=1.1709791449.CjwKCAiAxaCvBhBaEiwAvsLmWA28XG5ti1-z-l-k1ItrAa_-_ZsM8EvjdiDWvJ5urop_u_2mfIIgmxoCS9EQAvD_BwE; _dy_c_att_exps=; _dy_soct=1176034.1485803.1709797711*1178865.1492121.1709797711; _hjSessionUser_3441680=eyJpZCI6Ijg3OGIyMDM0LWJlNDMtNTkyMC05MmMwLWNiOGU5MDE2N2VmZiIsImNyZWF0ZWQiOjE3MDk3ODk2MzQ1OTMsImV4aXN0aW5nIjp0cnVlfQ==; dy_fs_page=in.satyapaul.com%2Fproduct%2Fthe-black-linen-comic-shirt-410330019001.html; _dy_ses_load_seq=77591%3A1709801788093; _ga=GA1.2.1424877515.1709789634; _ga_KQD0MY5MGH=GS1.1.1709801139.3.1.1709801789.37.0.0; _ga_P4STLVRRLE=GS1.1.1709801139.3.1.1709801789.0.0.0; _dy_lu_ses=b87e8ef82391f2d8c2452b921c294106%3A1709801789140; _dy_toffset=-1; _uetsid=498cb4b0dc4411ee97b64de48047a0be; _uetvid=498ccf10dc4411eeac8bf7369759e855'
    }
    # urlKey = str(produrl).split('/')[-1] #.replace('\n', '')
    produrl = f"https://croma.com/a/p/{key_id}"
    for i in range(2):
        try:
            sleeptime = random.randint(1, 3)
            time.sleep(sleeptime)
            # time.sleep(1)
            resp = requests.get(produrl, headers=headers, timeout=30)
            if resp.status_code == 200:
                break
            else:
                resp = requests.get('https://app.scrapingbee.com/api/v1/', params={'api_key': API_KEY, 'url': produrl, 'render_js': 'false'}, timeout=60)
        except Exception as e:
            print(str(e))
            if i > 0:
                return produrl + ' ^^ ' + str(e), 'Error'

    try:
        r = html.fromstring(resp.text)
        try:
            # jsonData = json.loads(r.xpath('//script[@type="application/ld+json"]/text()')[0])
            jsonData = json.loads(resp.text)['result']
        except:
            jsonData = {}


        try:
            atrributeId = jsonData['sku']
        except:
            atrributeId = 'n/a'

        date_format = '%Y-%m-%d %I:%M:%S:%Z'
        date = datetime.now(tz=utc)
        date = date.astimezone(timezone('US/Central'))
        extractionDate = date.strftime(date_format)

        channelName = 'Croma'

        try:
            produrl = r.xpath('//meta[@property="og:url"]/@href')[0].strip()
        except:
            produrl = 'n/a'

        try:
            productTitle = json.loads(r.xpath('//script[@type="application/ld+json"]/text()')[0].strip().replace('\n', '').rsplit('}', 1)[0])['name']
        except:
            productTitle = 'n/a'

        imageUrl = ""
        try:
            try:
                image_list = r.xpath('//div[@class="gallery-top"]//img/@data-zoom')
                img_count = len(image_list)
                imageUrl = ' || '.join(image_list)
            except:
                image_list = json.loads(r.xpath('//script[@type="application/ld+json"]/text()')[0].strip().replace('\n', '').rsplit('}', 1)[0])['image']
                img_count = len(image_list)
                imageUrl = ' || '.join(image_list)
        except:
            imageUrl = 'n/a'
            img_count = 'n/a'


        print(productTitle)
        print(f'Title = {productTitle}')
        print(f'COUNT = {str(img_count)}\nIMAGES = {imageUrl}')
        print("URL Crawled\n")

        record = [
                extractionDate,
                channelName,
                produrl,
                productTitle,
                imageUrl,
                img_count,
                ]

        for z in range(len(record)):
            record[z] = str(record[z]).replace('\n', '').replace('\t', '').replace('\r', '')
            if record[z].strip() == "":
                record[z] = 'n/a'
            record[z] = str(record[z]) + '\t'
        record.append(input1)
        with lock:
            with open(rf".\P4_Croma_Output_{str(num)}_" + str(crawled_date) + '.txt', 'a+', newline='', encoding="utf-8") as fp:
                fp.writelines(record)


    except Exception as e:
        print(e)



crawled_date = date.today()

num = 1
f = open(rf".\input{str(num)}.txt")
line = f.readlines()
urllist = list(map(lambda v: v.split('\t')[0].strip(), line[1:]))
# urlKeyList = list(map(lambda v: v.split('\t')[4], line[1:]))
linecount = len(line)

header = line[0]
header1 = str(header).replace("\n", "").split("\t")

row = [
"extraction_date",
"channel_name",
"product_url",
"product_title",
"image_url",
"Image_Count"
]
for h in range(len(header1)):
    header2 = header1[h]
    row.append(header2)
for z in range(len(row)):
    row[z] = str(row[z]) + '\t'
row.append('\n')
with open(rf".\P4_Croma_Output_{str(num)}_" + str(crawled_date) + '.txt', 'a+', newline='', encoding="utf-8") as fp:
    fp.writelines(row)
with concurrent.futures.ThreadPoolExecutor(max_workers=NUM_THREADS) as executor:
    executor.map(main, urllist, line[1:])

print('Done')
print("Crawling Completed")