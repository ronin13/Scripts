#!/usr/bin/python
import cjson
import urllib2
from contextlib import closing
url="http://search.twitter.com/trends.json"
with closing(urllib2.urlopen(url)) as ul:
    res = ul.readlines()[0]
    for x in cjson.decode(res)['trends']:
        print x['name'],x['url']

