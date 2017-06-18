require "qzone/version"
require 'qzone/qzone_login'
require "qzone/interface"

class Qzone
  def initialize(user, password)
    @user = user
    @password = password
    @spider = Mechanize.new

    if File.exist? "cookie#{@user}"
      @spider.cookie_jar.load "cookie#{@user}"
      skey = @spider.cookie_jar.find do |e|
        e.name == 'p_skey'
      end
      @gtk = self.gtk(skey)

      # if cookie is not valid
      begin
        unless self.cookies_valid?
          File.delete "cookie#{@user}"
          self.cookies
        end
      rescue
        self.cookies
      end

    else
      self.cookies
    end
  end

  def cookies
    account = {}
    account[:user] = @user
    account[:password] = @password

    qzone = Login.new @user, @password, 5
    qzone.login
    @cookies = qzone.cookies
    qzone.close

    # construct cookies
    @cookies.each do |cookie|
      cookie[:expires] = Date.today + 1 if cookie[:expires].nil?
      cookie = Mechanize::Cookie.new(
        domain: cookie[:domain],
        name: cookie[:name],
        value: cookie[:value],
        path: cookie[:path],
        expires: cookie[:expires].to_s
      )
      @spider.cookie_jar << cookie
    end

    skey = @spider.cookie_jar.find do |e|
      e.name == 'p_skey'
    end

    @gtk = self.gtk skey

    @spider.request_headers = {
      'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36'
    }

    @spider.cookie_jar.save_as "cookie#{@user}", session: true
  end

  def ablums(dest_qq)
    result = @spider.get(sprintf(Interface["ablum"], @gtk.to_s, dest_qq, @user))

    result = self.json result.content

    ablums = []

    return ablums if result['data']['albumListModeSort'].nil?

    result['data']['albumListModeSort'].each do |e|
      temp = {}
      temp[:host] = dest_qq
      temp[:id] = e['id']
      temp[:name] = e['name']
      temp[:total] = e['total']
      temp[:allowAccess] = e['allowAccess'].to_i
      # temp[:allowAccess] = 0 if temp[:allowAccess] != 1
      ablums.push temp
    end

    ablums
  end

  def photos_in_ablum(ablum)
    if ablum[:allowAccess] != 1
      raise "can't access to ablum \"#{ablum[:name]}\""
    end

    photos = []

    return photos if ablum[:total].to_i.zero?

    total_photos = ablum[:total].to_i
    pages = total_photos / 30
    pages += 1 if total_photos % 30 != 0

    pages.times do |e|
      result = @spider.get(sprintf(Interface["photo"], @gtk, ablum[:host], ablum[:id], @user, (e*30).to_s))

      result = self.json result.content

      return photos if result['data']['photoList'].nil?

      result['data']['photoList'].each do |e|
        photo = {}
        photo[:id] = e['id']
        photo[:name] = e['name']
        photo[:url] = e['url']

        photos.push photo
      end
    end

    photos
  end

  def friends
    result = @spider.get(sprintf(Interface["friend"], @user, @gtk))

    result = self.json result.content

    friends = []

    return friends if result['data']['items_list'].nil?

    result['data']['items_list'].each do |e|
      friend = {}
      friend[:uin] = e['uin']
      friend[:name] = e['name']
      # 亲密度
      friend[:score] = e['score']
      friend[:img] = e['img']

      friends.push friend
    end

    friends
  end

  def download_photos(photos, path)
    worker = Mechanize.new
    worker.request_headers = {
      'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36',
      "Referer" => "http://qzone.qq.com/"
    }
    photos.each do |e|
      result = worker.get e[:url]
      result.save_as path + e[:name] + "_#{Time.now.hash}" + '.jpg'
    end
  end


  def gtk(skey)
    raise "Skey can't be nil" if skey.nil?

    hashes = 5381
    skey.value.each_char do |c|
      hashes += (hashes << 5) + c.ord
    end
    hashes & 0x7fffffff
  end
  # private

  def json(str)
    # str.gsub!(/shine0_Callback\(/, "" )
    str.sub!(/.*_Callback\(/, '')
    str.sub!(/\);/, '')

    JSON.parse str
  end

  def cookies_valid?
    begin
      result = @spider.get "http://h5.qzone.qq.com/proxy/domain/tjalist.photo.qq.com/fcgi-bin/fcg_list_album_v3?g_tk=#{@gtk}&callback=shine0_Callback&t=419043014&hostUin=#{@user}&uin=#{@user}&appid=4&inCharset=utf-8&outCharset=utf-8&source=qzone&plat=qzone&format=jsonp&notice=0&filter=1&handset=4&pageNumModeSort=40&pageNumModeClass=15&needUserInfo=1&idcNum=5&callbackFun=shine0&_=1475649079634"
    rescue Exception => error
      if error.response_code == '403'
        raise 'Connection refused'
      else
        raise 'unknown error happened in checking cookies'
      end
    end

    !result.content.toutf8.include? '尚未登录或者登录超时'
  end
end
