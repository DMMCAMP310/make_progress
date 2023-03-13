class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.text :item
      t.text :content
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
