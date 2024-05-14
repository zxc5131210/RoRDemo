class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio
      t.date :birthday

      t.timestamps
    end
  end
end
