require 'logger'

class Log
  
  @no_color_logging = false
  @level = Logger::INFO
  @logger = Logger.new(STDOUT)
  
  module Color
    if RUBY_PLATFORM =~ /mswin|mingw|cygwin|windows/
      RED = '[41m'
      YELLOW = '[43m'
      NO_COLOR = '[0m'
    else
      RED = "\033[0;31m"
      YELLOW = "\033[1;33m"
      NO_COLOR = "\033[0m"
    end
  end 
  
  ########################
  def self.severity_color(severity)
    case severity
    when 'WARN'
      color = Color::YELLOW
    when 'ERROR', 'FATAL'
      color = Color::RED
    else
      color = Color::NO_COLOR
    end
    color
  end
    
  ########################
  # sets the logging format
  def self.format=(proc_object)
    @logger.formatter = Proc.new {|severity, datetime, progname, msg|
      color, no_color = ''
      unless Log.no_color_logging
        no_color = Color::NO_COLOR
        color = Log.severity_color(severity)
      end
      string = proc_object.call(severity, datetime, progname, msg)
      "#{color}#{string}#{no_color}"
    }
  end
  
  # default setting of the log format
  Log.format = Proc.new { |severity, datetime, progname, msg|    
    datetime = datetime.strftime("%Y-%m-%dT%H:%M:%S,%6N ##{Process.pid}")
    severity_id = severity[0]
    # add a space for info and warn to match the str length of debug, error and fatal
    severity = ' ' + severity if severity.length < 5 
    "#{severity_id}, [#{datetime}] #{severity} -- #{progname}: #{msg}\n" 
  }
  
  ########################
  def self.no_color_logging=(bool)
    @no_color_logging = true if bool.to_s == "true"
  end

  ########################
  def self.no_color_logging
    @no_color_logging
  end
  
  ########################
  # stores the log level:
  # - Logger::DEBUG, Logger::INFO, Logger::WARN, Logger::ERROR
  #
  def self.level=(l)
    return unless l.kind_of?(String)
    @level = Log.convert_level(l)
    Log.set_level
  end
  
  ########################
  def self.level
    @level
  end
  
  ########################
  # sets the log level
  def self.set_level
    @logger.level = @level
  end
  
  ########################
  # sets the log file
  #
  def self.file=(f)
    return unless f
    FileUtils.mkdir_p(File.dirname(f)) && FileUtils.touch(f) unless File.exists?(f)
    @logger = Logger.new(f)
    Log.set_level
    @log_file = f
    Log.no_color_logging = true
  end
  
  ########################
  def self.file
    @log_file
  end
  
  ########################
  # convert the level for the logger object
  #
  # * *Args*    :
  #   - +level+ -> level (string)
  # * *Returns* :
  #   - log level (int)
  #
  def self.convert_level(level)
    level = level.upcase if level.is_a?(String)
    if level == 'DEBUG'
      return Logger::DEBUG
    elsif level == 'INFO'
      return Logger::INFO
    elsif level == 'WARN'
      return Logger::WARN
    elsif level == 'ERROR'
      return Logger::ERROR
    else
      raise 'illegal log level received'
    end
  end
  
  ########################
  def self.debug(s)
    @logger.debug(File.basename(caller[2])) {s}
  end
  
  ########################
   def self.info(s)
     @logger.info(File.basename(caller[2])) {s}
   end
     
   ########################
   def self.warn(s)
     @logger.warn(File.basename(caller[2])) {s}
   end
     
   ########################
   def self.error(s)
     @logger.error(File.basename(caller[2])) {s}
   end
     
   ########################
   def self.fatal(s)
     @logger.fatal(File.basename(caller[2])) {s}
     exit 1
   end
     
   ########################
   def self.exception(s)
     @logger.error(File.basename(caller[2])) {s}
     raise StandardError, s
   end
     
   ########################
   def self.print(s)
     @logger << "#{s}"
   end
     
end