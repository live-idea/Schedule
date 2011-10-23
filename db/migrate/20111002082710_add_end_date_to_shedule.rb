class AddEndDateToShedule < ActiveRecord::Migration
  def change
    add_column :shedules, :end_date, :datetime
  end
end
