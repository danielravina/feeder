Time::DATE_FORMATS[:default] = lambda { |time| time.strftime("%B #{time.day.ordinalize}, %Y @ %I:%M %P") }