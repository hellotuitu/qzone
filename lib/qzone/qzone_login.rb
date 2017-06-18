require 'selenium-webdriver'
require 'mechanize'
require 'date'
require 'yaml'
require 'json'

class Qzone
  class Login
    def initialize user, password, wait_time
      @user = user
      @password = password

      begin
        user_agent = 'User-Agent:Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50'

        capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs(
        'phantomjs.page.settings.userAgent' => user_agent,
        "phantomhs.page.settings.loadImages" => false
        )
        @driver = Selenium::WebDriver.for(:phantomjs, :desired_capabilities => capabilities)
        @waiter = Selenium::WebDriver::Wait.new(timeout: wait_time)
      rescue
        raise 'init error,make sure phantomjs has been installed correctly.'
      end
    end

    def login
      @waiter.until {@driver.navigate.to 'http://qzone.qq.com/'}

      @waiter.until {@driver.switch_to.frame 'login_frame'}

      @waiter.until { @driver.find_element(id: 'switcher_plogin') }
      plogin = @driver.find_element(id: 'switcher_plogin')
      plogin.click

      user = @driver.find_element(id: 'u')
      user.send_keys @user
      password = @driver.find_element(id: 'p')
      password.send_keys @password

      @waiter.until { @driver.find_element(xpath: '//*[@id="login_button"]') }
      login = @driver.find_element(xpath: '//*[@id="login_button"]')

      login.click

      sleep(1)

      # 如果正常的话 目前就已经返回true
      return @pass = true if @driver.current_url != 'http://qzone.qq.com/'

      # 下面分析可能的原因
      begin
        @waiter.until {@driver.find_element(id: 'vcode')}
        raise 'Need verify code, please manualy login Qzone first'
      rescue Exception => error
        if error.message == 'Need verify code, please manualy login Qzone first'
          raise error.message
        end
      end

      # if find element with id "err_m", indicate something wrong
      begin
        @waiter.until {@driver.find_element(id: 'err_m')}
        err = @driver.find_element(id: 'err_m')
        error_message = err.text
      rescue
        # if can't find that element, indicate something wrong happened but ->
        # we don't know about that.
        raise 'Unknown error happened in login'
      end

      if error_message.include? '您输入的帐号或密码不正确'
        raise 'Account error'
      elsif error_message.include? '网络繁忙'
        raise 'Network busy, try later'
      else
        raise 'Unknown error happened in login'
      end
    end

    def gtk
      # 获取gtk
      @skey = @driver.manage.cookie_named 'p_skey'
      hashes = 5381
      @skey[:value].each_char do |c|
        hashes += (hashes << 5) + c.ord
      end
      hashes & 0x7fffffff
    end

    def cookies
      @driver.manage.all_cookies
    end

    def close
      @driver.close if @driver
    end
  end
end
