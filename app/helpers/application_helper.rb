module ApplicationHelper
  require "iso8601"

  def time_conversion(iso_str)
    d=ISO8601::Duration.new(iso_str)
    parts = []
    hours = d.hours.to_i
    minutes = d.minutes.to_i
    seconds = d.seconds.to_i

    if hours.positive?
      hour_text = "#{hours} #{'hour'.pluralize(hours)}"
      parts.push(hour_text)
    end

    if minutes.positive?
      minute_text = "#{minutes} #{'minute'.pluralize(minutes)}"
      parts.push(minute_text)
    end

    if seconds.positive?
      second_text = "#{seconds} #{'second'.pluralize(seconds)}"
      parts.push(second_text)
    end

    result = parts.any? ? parts.join(" ") : "NA"
 
  end


end
