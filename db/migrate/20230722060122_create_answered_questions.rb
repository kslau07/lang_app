class CreateAnsweredQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :answered_questions do |t|
      t.references :quiz, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
      t.string :answer

      t.timestamps
    end
  end
end
