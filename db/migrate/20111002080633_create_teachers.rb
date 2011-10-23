class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :department
      t.string :full_name

      t.timestamps
    end
  end
end
