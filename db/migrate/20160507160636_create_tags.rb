class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do | table |
      table.string :title, null: false
      table.timestamps( null: false )
    end
  end
end
