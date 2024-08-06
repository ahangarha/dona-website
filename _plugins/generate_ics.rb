# frozen_string_literal: true

require 'icalendar'
require 'icalendar/tzinfo'
require_relative 'persian_utils'

module Jekyll
  class GenerateICS < Jekyll::Generator
    include PersianUtils

    safe true
    priority :low

    def generate(site)
      return unless Jekyll.env == 'production'

      cal = generate_calendar(site)

      File.open('calendar.ics', 'w') { |f| f.write(cal.to_ical) }
    end

    private

    def generate_calendar(site)
      # Define the calendar
      cal = Icalendar::Calendar.new

      tzid = 'Asia/Tehran'
      cal.timezone.tzid = tzid

      site.collections['events'].docs.each do |entry|
        cal.add_event(generate_event_from(entry, tzid: tzid))
      end

      cal
    end

    def generate_event_from(entry, tzid:)
      event = Icalendar::Event.new
      event.dtstart = Icalendar::Values::DateTime.new(entry['event_date'], 'tzid' => tzid)
      event.dtend = Icalendar::Values::DateTime.new(entry['event_date'] + (60 * 60 * 2), 'tzid' => tzid) # 2 hours event
      event.summary = the_entry_title(entry)
      event.location = the_entry_url(entry)

      event
    end

    def the_entry_title(entry)
      event_number = to_persian_digit(entry.basename.split('.')[0])

      "نشست #{event_number}: #{entry['title']}"
    end

    def the_entry_url(entry)
      "https://do-na.ir#{entry.url}"
    end
  end
end
