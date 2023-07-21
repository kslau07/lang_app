class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.string :answer
      t.references :category, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false


      t.timestamps
    end
  end
end
