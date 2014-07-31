class Scheduler

  class << self
    def method_missing(method, *args)
      new.send method, *args
    end
  end

  def import_upcoming_release
    Movie.import_upcoming
  end
end
