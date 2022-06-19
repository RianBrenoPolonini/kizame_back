class CreateClassroms < ActiveRecord::Migration[7.0]
  def change
    create_table :classroms do |t|
      t.string :name
      t.text :day, array: true, default: []
      t.text :time, array: true, default: []
      t.references :modality, null: false, foreign_key: true
      t.uuid :user_id

      t.timestamps
    end

    add_index :classroms, :user_id
  end
end
