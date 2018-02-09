get "/questions/:id/answer/new" do
    @question = Question.find(params[:id])
    erb :"questions/answers/new"
end

post "/questions/:id/answer" do
    
    @question = Question.find(params[:id])
    @answer = Answer.create(answer: params[:answer], votes: 1, question_id: @question.id)
    
    redirect "/questions/#{@question.id}"
    
end

get "/questions/:id/answer/:answer_id" do
    @user = User.find_by(username: cookies[:username])
    @answer = Answer.find(params[:answer_id])
    
    if @answer.users.include?(@user)
        redirect "/questions/#{params[:id]}", cookies => {:message => "Sorry, you have already voted for this! You can only vote once."}
    else
        @answer.votes += 1
        @answer.users << @user
        @answer.save
        
        redirect "/questions/#{params[:id]}", cookies =>{:message => "You voted!"}
    end
end