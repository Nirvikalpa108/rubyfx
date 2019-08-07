class CurrencyError < StandardError
  def message
    "Error - unable to calculate rate requested"
  end
end

class DateError < StandardError
  def message
    "Error - no rate at date found"
  end
end

class FileError < StandardError
  def message
    "Error - this file type is not accepted. Try JSON or CSV."
  end
end
