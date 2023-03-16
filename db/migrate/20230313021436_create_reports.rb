class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.text :item
      t.text :content
      t.references :category, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
