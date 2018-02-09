
class AddForeignKeysToQuestionUser < ActiveRecord::Migration[5.0]

  def change

    add_reference :question_users, :user, foreign_key: true
    add_reference :question_users, :question, foreign_key: true
  
  end

end

