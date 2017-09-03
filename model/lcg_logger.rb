# File : lcg_logger.rb
# Date : 2017-09-03
# Author : lcg
# ====================
# Target :
#    The logger file for a standard format

module LcgLogger
  LOG_PATH="/var/log/lcg_log/"
  # this function for the log to store function info to the name file
  def who?
    self.class.name
  end
  
  # log_write will wirte down the record info file
  # first : define the directory ->/var/log/lcg_log/xxx.log
  #         log file exist just write down , and not just create
  # the level meas the key to identify log level , default is "I"
  def log_write(level="I",string)
    filepath=LOG_PATH + who?
    if File.exist?(filepath)
      log_file=File.open(filepath,"a+")
    else
      log_file=File.new(filepath,"a+")
    end
    
    log_file.syswrite("[#{get_time}] #{level} #{string}\n")
    log_file.close
  end
  
  # get_time do the time record into log
  # return a format time to record
  def get_time
    Time.new.strftime("%Y-%m-%d %H:%M:%S")
  end
end
