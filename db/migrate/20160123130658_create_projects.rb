class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :projects, :name, unique: true
  end
end
