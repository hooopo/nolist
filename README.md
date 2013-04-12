## Online Demo Address

http://nolist.herokuapp.com

## Setup Dev Env

```
export mailgun_api_key=your_api_key
# mailgun list address 需要在https://mailgun.net/cp/lists 里创建
export mailgun_list_address=nolist@hooopo.mailgun.org
# mailgun join list address 无需创建，但要配置route.
export mailgun_join_list_address=join-list@hooopo.mailgun.org
export mailgun_unsubscribe_list_address=unsubscribe-list@hooopo.mailgun.org
```

## Mailgun Setup
```
# 设置mailgun join list address 和 实际部署URL地址：
# https://mailgun.net/cp/routes
match_recipient("join-list@hooopo.mailgun.org")	forward("http://nolist.herokuapp.com/emails")	
match_recipient("unsubscribe-list@hooopo.mailgun.org") forward("http://nolist.herokuapp.com/unsubscribe")

Enable Unsubscribe: 在这里（https://mailgun.net/cp/unsubscribes）勾选退订，点击编辑可以修改退订链接描述
```

## Heroku Setup

```
# 替换成自己的实际地址：
heroku config:add mailgun_api_key=your_api_key
heroku config:add mailgun_list_address=nolist@hooopo.mailgun.org
heroku config:add mailgun_join_list_address=join-list@hooopo.mailgun.org 
heroku config:add mailgun_unsubscribe_address=unsubscribe-list@hooopo.mailgun.org
```

## Referers

* http://documentation.mailgun.net/user_manual.html#mailing-lists
* https://github.com/honeybadger-io/incoming
