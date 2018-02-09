class Answer < ActiveRecord::Base
    belongs_to :question
    has_many :answer_users
    has_many :users, through: :answer_users
    
    def has_voted?(user)
        user == nil ? (return false) : nil
        user = User.find_by(username: user)
        self.users.include?(user) ? true : false
    end
    
end