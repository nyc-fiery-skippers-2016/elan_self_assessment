class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do | table |
      table.references :post, null: false, index: true
      table.references :tag, null: false, index: true
      table.timestamps( null: false )
    end
  end
end
