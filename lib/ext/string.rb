class String
  def to_bool
    if self =~ /(true|True|TRUE)/
      return true
    elsif self =~ /(false|False|FALSE)/
      return false
    else
      return self
    end
  end
end
