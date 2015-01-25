class CreateVitalSigns < ActiveRecord::Migration
  def change
    create_table :vital_signs do |t|
      t.string :name
    end
  end
end
