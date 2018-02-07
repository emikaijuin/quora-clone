get '/' do

 erb :"home"

end

post '/questions' do

  Question.create(question: params[:Question].to_s, description: params[:Description].to_s)

  erb :"questions/all"

end

get '/questions/all' do

  erb :"questions/all"

end

get '/questions/new' do

  erb :"questions/new" 

end

get '/questions/:id' do

  @question = Question.find(params[:id])

  erb :"questions/show"

end

post '/questions/:id' do 

  @question = Question.find(params[:id])
  @question.question = params[:question]
  @question.description = params[:description]
  @question.save

  erb :"questions/show"


end

get '/questions/:id/edit' do

  @question = Question.find(params[:id])

  erb :"questions/edit"

end

delete '/questions/:id' do

  @question = Question.find(params[:id])
  @question.delete
  @question.save

  erb :"questions/delete"

end