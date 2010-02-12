module FacebookDistanceOfTimeInWords # :nodoc: all
  module FacebookDistanceOfTimeInWordsHelpers
    def facebook_distance_of_time_in_words(past_date)
      return if past_date.blank?
      today = Date.today
      days_difference = (today - past_date.to_date).to_i
      case
      when days_difference == 0
        #: if the date is today, we display time
        time_difference = (Time.now - past_date)
        if time_difference > 1.hour
          t(:days_ago, :scope => :facebook_distance_of_time_in_words, :day_string => time_ago_in_words(past_date, false))
        else
          t(:today_at_time, :scope => :facebook_distance_of_time_in_words, :hour => l(past_date, :format => :fdotin_hour_minute))
        end
      when days_difference == 1
        #: If the date is yesterday
        t(:yesterday_at_time, :scope => :facebook_distance_of_time_in_words, :hour => l(past_date, :format => :fdotin_hour_minute))
      when days_difference < 7
        #: If the date is in the week, we display the day's name
        t(:day_with_hour, :scope => :facebook_distance_of_time_in_words, :day => l(past_date, :format => :fdotin_day_name), :hour => l(past_date, :format => :fdotin_hour_minute))
      when past_date.month == today.month &&  past_date.year == today.year
        #: Current Month
        t(:days_ago, :scope => :facebook_distance_of_time_in_words, :day_string => time_ago_in_words(past_date, false))
      when past_date.year == today.year
        # : Current Year
        t(:month_at_time, :scope => :facebook_distance_of_time_in_words, :month => l(past_date, :format => :fdotin_month_name), :day => l(past_date, :format => :fdotin_day_number), :hour => l(past_date, :format => :fdotin_hour_minute))
      else
        # When all else fails...
        t(:month_year, :scope => :facebook_distance_of_time_in_words, :month => l(past_date, :format => :fdotin_month_name), :year => l(past_date, :format => :fdotin_year), :day => l(past_date, :format => :fdotin_day_number), :hour => l(past_date, :format => :fdotin_hour_minute))
      end
    end
  end
end