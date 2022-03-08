#!/usr/bin/env python3

from newspaper import Article
import sys

url = sys.argv[1]
a = Article(url)
a.download()
a.parse()

c = a.title.count("",1)

print(a.title)
print("="*c)
print("")
print(a.text)
