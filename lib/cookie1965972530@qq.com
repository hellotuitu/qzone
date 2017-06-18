---
qzone.qq.com:
  "/":
    Loading: !ruby/object:Mechanize::Cookie
      name: Loading
      value: 'Yes'
      domain: qzone.qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &1 2017-06-18 22:51:50.654346899 +08:00
      accessed_at: *1
    pt4_token: !ruby/object:Mechanize::Cookie
      name: pt4_token
      value: xmpPo7hk1sc9vwKrrXZyp08ZWTWsFh9So7oLvXJYmuQ_
      domain: qzone.qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &2 2017-06-18 22:51:50.656663544 +08:00
      accessed_at: *2
    p_skey: !ruby/object:Mechanize::Cookie
      name: p_skey
      value: e*7GBodDZLKjKQ0WZtIkqc1p4SAdmps0wvI8jR2fukc_
      domain: qzone.qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &3 2017-06-18 22:51:50.656956333 +08:00
      accessed_at: *3
    p_uin: !ruby/object:Mechanize::Cookie
      name: p_uin
      value: o1965972530
      domain: qzone.qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &4 2017-06-18 22:51:50.657281787 +08:00
      accessed_at: *4
    fnc: !ruby/object:Mechanize::Cookie
      name: fnc
      value: '2'
      domain: qzone.qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 14:56:49 GMT
      max_age: 
      created_at: &5 2017-06-18 22:51:50.656102246 +08:00
      accessed_at: *5
qq.com:
  "/":
    skey: !ruby/object:Mechanize::Cookie
      name: skey
      value: "@8LT7uAzsz"
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &6 2017-06-18 22:51:50.657487031 +08:00
      accessed_at: *6
    uin: !ruby/object:Mechanize::Cookie
      name: uin
      value: o1965972530
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &7 2017-06-18 22:51:50.657689706 +08:00
      accessed_at: *7
    pt2gguin: !ruby/object:Mechanize::Cookie
      name: pt2gguin
      value: o1965972530
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Thu, 02 Jan 2020 00:00:00 GMT
      max_age: 
      created_at: &8 2017-06-18 22:51:50.657876438 +08:00
      accessed_at: *8
    ptcz: !ruby/object:Mechanize::Cookie
      name: ptcz
      value: cf7ee9a6140726f384777085c2982ac13e1e8071eb26973db2477477bc8e915d
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Thu, 02 Jan 2020 00:00:00 GMT
      max_age: 
      created_at: &9 2017-06-18 22:51:50.658231255 +08:00
      accessed_at: *9
    RK: !ruby/object:Mechanize::Cookie
      name: RK
      value: Hmt3tzPLYN
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Wed, 16 Jun 2027 14:51:48 GMT
      max_age: 
      created_at: &10 2017-06-18 22:51:50.658486395 +08:00
      accessed_at: *10
    ptisp: !ruby/object:Mechanize::Cookie
      name: ptisp
      value: cnc
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &11 2017-06-18 22:51:50.658756800 +08:00
      accessed_at: *11
    ptui_loginuin: !ruby/object:Mechanize::Cookie
      name: ptui_loginuin
      value: 1965972530@qq.com
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Tue, 18 Jul 2017 14:51:48 GMT
      max_age: 
      created_at: &12 2017-06-18 22:51:50.658943898 +08:00
      accessed_at: *12
    pgv_si: !ruby/object:Mechanize::Cookie
      name: pgv_si
      value: s4165403648
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &13 2017-06-18 22:51:50.659320018 +08:00
      accessed_at: *13
    pgv_pvi: !ruby/object:Mechanize::Cookie
      name: pgv_pvi
      value: '2170932224'
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Mon, 18 Jan 2038 00:00:00 GMT
      max_age: 
      created_at: &14 2017-06-18 22:51:50.659503340 +08:00
      accessed_at: *14
    _qpsvr_localtk: !ruby/object:Mechanize::Cookie
      name: _qpsvr_localtk
      value: '0.6953211498912424'
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &15 2017-06-18 22:51:50.659781019 +08:00
      accessed_at: *15
    pgv_info: !ruby/object:Mechanize::Cookie
      name: pgv_info
      value: ssid=s2836870752
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Sun, 18 Jun 2017 16:00:00 GMT
      max_age: 
      created_at: &16 2017-06-18 22:37:01.519383955 +08:00
      accessed_at: *16
    pgv_pvid: !ruby/object:Mechanize::Cookie
      name: pgv_pvid
      value: '258334524'
      domain: qq.com
      for_domain: true
      path: "/"
      secure: false
      httponly: false
      expires: Mon, 18 Jan 2038 00:00:00 GMT
      max_age: 
      created_at: &17 2017-06-18 22:37:01.519556275 +08:00
      accessed_at: *17
