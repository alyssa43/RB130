class NoExperienceError < StandardError; end

class Test
  def hire
    raise NoExperienceError
  end

  def process
    self
  end
end