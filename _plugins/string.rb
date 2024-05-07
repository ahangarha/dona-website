class String
  def starts_with?(prefix)
    self[0, prefix.length - 1] == prefix.strip
  end
end
