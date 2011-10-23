class CreateSheduleDetails < ActiveRecord::Migration
  def change
    create_table :shedule_details do |t|
      t.integer :shedule_id
      t.integer :day_week
      t.integer :lesson_no
      t.string :week_type
      t.integer :teacher_id
      t.string :place
      t.string :course
      t.string :lesson_title
      t.string :lesson_type
      t.integer :subgroup_no

      t.timestamps
    end
  end
end
