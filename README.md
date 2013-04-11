## Online Demo Address

http://nolist.herokuapp.com

## Setup Dev Env:

```
export mailgun_api_key=your_api_key
# mailgun list address 需要在https://mailgun.net/cp/lists 里创建
export mailgun_list_address=nolist@hooopo.mailgun.org
# mailgun join list address 无需创建，但要配置route.
export mailgun_join_list_address=join-list@hooopo.mailgun.org
```

## Mailgun Setup:
```
# 设置mailgun join list address 和 实际部署URL地址：
# https://mailgun.net/cp/routes
match_recipient("join-list@hooopo.mailgun.org")	forward("http://nolist.herokuapp.com/emails")	
```

## Heroku Setup:

```
# 替换成自己的实际地址：
heroku config:add mailgun_api_key=your_api_key
heroku config:add mailgun_list_address=nolist@hooopo.mailgun.org
heroku config:add mailgun_join_list_address=join-list@hooopo.mailgun.org 
```
