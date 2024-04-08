class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :rating
      t.text :text
      t.string :author

      t.timestamps
    end
  end
end
