get "/questions/:id/answer/new" do
    @question = Question.find(params[:id])
    erb :"questions/answers/new"
end

post "/questions/:id/answer/" do
    
    @question = Question.find(params[:id])
    @answer = Answer.create(answer: params[:answer], votes: 0, question_id: @question.id)
    
    redirect "/question/#{@question.id}"
    
end