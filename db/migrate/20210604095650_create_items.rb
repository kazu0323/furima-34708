class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string  :item_name,          null: false
      t.text    :item_info,          null: false
      t.integer :price,              null: false
      t.integer :day_id,             null: false
      t.integer :category_name_id,   null: false
      t.integer :freight_money_id ,  null: false
      t.integer :states_id,          null: false
      t.integer :area_id,            null: false
      t.references  :user,           null: false,foreign_key: true
    end
  end
end