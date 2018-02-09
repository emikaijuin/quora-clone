class Question < ActiveRecord::Base
    belongs_to :user
    has_many :question_users
    has_many :users, through: :question_users
    
    def has_voted_question?(user)
        user = User.find_by(username: user)
        self.users.include?(user) ? true : false
    end
end