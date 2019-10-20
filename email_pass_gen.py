#!/usr/bin/env python3

import string
import random

tldomains = [
    'com',
    'org',
    'net'
]

length = range(10, 20)


def string_gen(size=10, chars=string.ascii_letters + string.digits):
    return ''.join(random.choice(chars) for x in range(size))


print(string_gen(size=random.choice(length))+"@"+string_gen(size=random.choice(length)
                                                            )+"."+random.choice(tldomains)+" "+string_gen(size=random.choice(length)))
