class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :role, default: 0
      t.references :project
      t.timestamps null: false
    end
  end
end
