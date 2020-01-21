class SecretFile
  def initialize(secret_data)
    @data = secret_data
    @security_log = SecurityLogger.new
  end
  
  def data
    @security_log.create_log_entry
    @data
  end
  
  def display_log
    @security_log.display
  end
end

class SecurityLogger
  def initialize
    @log = []
  end
  
  def create_log_entry
    @log << LogEntry.new
  end
  
  def display
    puts @log
  end
    
end

class LogEntry
  attr_accessor :date
  
  def initialize
    @date = Time.now
  end
  
  def to_s
    "View at #{@date}"
  end
end

stuff = SecretFile.new('Trevor')
puts stuff.data
stuff.display_log