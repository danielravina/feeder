require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

  configure do |config|
    config[:tz] = "Pacific Time (US & Canada)"
  end

  handler do |job|
    Scheduler.public_send job
  end

  every 1.hour, 'import_upcoming_release'
end