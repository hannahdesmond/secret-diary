class SecretDiary
  attr_reader :locked, :entries
  def initialize
    lock
    @entries = []
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

  def get_entries
    raise "Get your grubby mits off this locked diary!" if @locked == true
    puts @entries.each.map {|entry| entry.flatten.join(": ")}
  end

  def add_entry(date, words)
    raise "Get your grubby mits off this locked diary!" if @locked == true
    @entries << {date=>words}
  end



end



# the diary should be locked as default
# this could be a boolean?
# unlock changes locked variable to false
# get_entry throws error if locked is true
# add_entry throws an error if locked is true
