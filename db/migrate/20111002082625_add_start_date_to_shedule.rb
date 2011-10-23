class AddStartDateToShedule < ActiveRecord::Migration
  def change
    add_column :shedules, :start_date, :datetime
  end
end
