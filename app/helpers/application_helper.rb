module ApplicationHelper
  def format_duration(seconds)
    hours, remaining_seconds = seconds.divmod(3600)
    minutes, seconds = remaining_seconds.divmod(60)

    format('%02d:%02d', hours, minutes, seconds)
  end
end
