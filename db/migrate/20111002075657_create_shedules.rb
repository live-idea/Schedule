class CreateShedules < ActiveRecord::Migration
  def change
    create_table :shedules do |t|
      t.string :semester

      t.timestamps
    end
  end
end
