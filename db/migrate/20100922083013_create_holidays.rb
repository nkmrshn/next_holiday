class CreateHolidays < ActiveRecord::Migration
  def self.up
    create_table :holidays do |t|
      t.string :name
      t.date :holiday_at

      t.timestamps
    end
  end

  def self.down
    drop_table :holidays
  end
end
