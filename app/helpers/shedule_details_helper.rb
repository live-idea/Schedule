module SheduleDetailsHelper
  def show_lesson_details(shedule_details, day_week, lesson_no)
    day_shedule, ch_shedule, zn_shedule =  nil, nil, nil
    if shedule_details
      details = shedule_details.select do |d| 
        d.day_week == day_week && d.lesson_no == lesson_no
      end 
      details.each do |detail|
        if detail.week_type == "0"
          day_shedule=detail
        elsif detail.week_type == "1"
          ch_shedule=detail
        elsif detail.week_type == "2" 
          zn_shedule=detail
        end
      end
    end
    return day_shedule, ch_shedule, zn_shedule
  end
  
end
