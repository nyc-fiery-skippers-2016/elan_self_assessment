class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do | table |
      table.string :title, null: false
      table.references :user, null: false, index: true
      table.timestamps( null: false )
    end
  end
end
