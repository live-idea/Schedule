class ChangeStartEndDatesTypes < ActiveRecord::Migration
  def up
    change_column :shedules, :start_date, :date
    change_column :shedules, :end_date, :date
  end

  def down
  end
end
