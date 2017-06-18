# Qzone

Qzone是一个为qq空间定制的爬虫,它提供qzone的登录以及相册,好友等数据接口.

## Installation

`gem install qzone`

## Usage

首先,通过qq号和密码实例化一个Qzone类的对象:
```ruby
qzone = Qzone.new user, password
```

Qzone类提供了以下接口:
- `ablums`:该方法接受任意一个合法的QQ号为参数,返回的是该QQ号下所有的相册构成了数组.每一个相册都是一个哈希,它包含以下项
```ruby
ablum[:host] # 拥有该相册的qq
ablum[:id] # 相册id
ablum[:name] # 相册名称
ablum[:total] # 照片数量
ablum[:allowAccess] # 相册权限 只有权限为1时, 该相册才是公开可爬的
```
- `photos_in_ablum`:该方法接受任意一个合法的相册哈希(由ablums接口返回的,或是手动构造相同结构的哈希),返回该相册下所有的照片组成的数组, 每一个相片都是一个哈希, 它包含以下项
```ruby
photo[:id] # 照片id
photo[:name] # 照片名称
photo[:url] # 照片的url, 可通过该url下载该照片
```
- `friends`:该方法无参数, 返回该qzone下所有的好友组成的数组,每一个好友都是一个哈希,它包含以下项
```ruby
friend[:uin] = # 该好友的qq号
friend[:name] = # 该好友对于空间拥有者的备注
friend[:score] # 亲密度评分
friend[:img] = # 该好友的头像的url
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
