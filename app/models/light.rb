class Light < ActiveRecord::Base
  # include Celluloid

  RC_SWITCH_COMMAND = '/home/homecontrol/programs/rcswitch-pi/send'
  belongs_to :location

  def turn_on
    `#{RC_SWITCH_COMMAND} #{on_code}`
  end

  def turn_off
    `#{RC_SWITCH_COMMAND} #{off_code}`
  end
end
