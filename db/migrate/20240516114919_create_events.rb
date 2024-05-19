class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :is_public
      t.integer :capacity

      t.string :foobar

      t.timestamps
    end
  end
end
