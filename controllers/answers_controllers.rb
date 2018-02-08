get "/questions/:id/answer/new" do
    @question = Question.find(params[:id])
    erb :"questions/answers/new"
end

post "/questions/:id/answer" do
    
    @question = Question.find(params[:id])
    @answer = Answer.create(answer: params[:answer], votes: 0, question_id: @question.id)
    
    redirect "/questions/#{@question.id}"
    
end

get "/questions/:id/answer/:answer_id" do
    @answer = Answer.find(params[:answer_id])
    @answer.votes += 1
    @answer.save
    
    redirect "/questions/#{params[:id]}"
end