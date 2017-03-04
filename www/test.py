#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import orm,sys
from models import User, Blog, Comment
import asyncio

@asyncio.coroutine
def destory_pool():
    #global __pool
    if orm.__pool is not None :
        orm.__pool.close()
        yield from orm.__pool.wait_closed()

@asyncio.coroutine
def test():
    yield from orm.create_pool(user='www-data', password='www-data', db='awesome',loop=loop,host='localhost', port=3306,)

    ## 添加数据测试
    # u = User(name='Test', email='test@example.com', passwd='1234567890', image='about:blank') #重复执行会报错，因为email 有建立unique Key 约束
    # print(u)
    # yield from u.save()
    # print(u)
    
    
    ## 查找数据测试
    # r = yield from User.findAll() 
    # print(r)
    
    ## 删除数据测试
    yield from User(id='001488598727081677da32385ad44efa948665eb040cead000').remove()
    r = yield from User.findAll() 
    print(r)
    yield from destory_pool()

#创建异步事件的句柄
loop = asyncio.get_event_loop()
loop.run_until_complete(test())
loop.close()
if loop.is_closed():
    sys.exit(0)