# File : start.rb
# Date : 2017-09-02
# Author : lcg
# ====================
# Target :
#    Test the function of selenium and loger

require 'selenium-webdriver'
require File.expand_path("../../model/lcg_logger.rb", __FILE__)

include LcgLogger
class Start
  # include the mode in logger.rb with logger function
  def open_url(browser=":firefox",url="http://www.baidu.com")
    log_write("I" , "open firefor with selenium")
    # open browser
    driver = Selenium::WebDriver.for(:firefox)

    # open url for hao123
    driver.get("http://www.baidu.com")

    # input data into search text
    element =  driver.find_element(:name,"wd")
    element.send_keys("emacs")
    element.submit
    log_write("I", "open success with emacs search word")
  end
end
