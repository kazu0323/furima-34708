class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string :postcode,   null: false
      t.string :city,       null: false
      t.string :block,      null: false
      t.string :building,   null: false
      t.string :tell_num,   null: false
      t.integer :area_id,   null: false
      t.references :purchase, null: false,foreign_key: true
    end
  end
end
