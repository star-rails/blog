class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :content 
      t.string :src
      t.timestamps
    end
  end
end
