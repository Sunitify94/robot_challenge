class RobotOffGridError < StandardError
  def message
    "Robot is Off Grid!"
  end
end