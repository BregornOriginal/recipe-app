class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.time :preperation_time
      t.time :cooking_time
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
