class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def how_long_left
    
    return unless respond_to? :due_date

    mins_due = (due_date - Time.now)/60

    case

    when mins_due < 0 
      "OVERDUE!"

    when mins_due < 60 # Less then an hour Display minutes
      "#{mins_due.round} minutes"

    when mins_due < 2_880 # Less then 48hours display hours
      "#{(mins_due / 60).round} hours"

    when mins_due < 43_800 # Less then month display days
      "#{(mins_due / 1440).round} days"
    
    when mins_due < 525_600 # Less then year display "3 Feb 22"
      due_date.strftime "%e %b %y"
    
    when mins_due >= 525_600 # Greater then Year disp MMM YYYY
      due_date.strftime "%b %Y"

    end

  end


end
