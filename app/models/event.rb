class Event < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :nurse
  has_event_calendar
  
  validates_presence_of :name, :start_at, :end_at
  validates :all_day, :inclusion => {:in => [true, false]}

  validates_with Rules
  
  @@additional_months = [] # needs to be 1,2,3 and each month can be in here multiple times

  def self.additional_months
    return @@additional_months
  end
  
  def self.all_display_columns
    ['start date', 'end date', 'Change vacation', '']
  end
  
  def self.calculate_length (event)
    start_at = event.start_at.to_date
    end_at = event.end_at.to_date
    return days_total = end_at - start_at
  end
  

# the way the event_calendar gem handles colors for events
# on the calendar is with 'color' in the model. this sets the
# default color to gray
  def color
    "#7c7c7c" # gray
  end

end
