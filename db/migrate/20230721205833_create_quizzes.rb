class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.references :user, foreign_key: true, null: false
      # t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
