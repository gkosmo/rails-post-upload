class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :age
      t.text :message
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
