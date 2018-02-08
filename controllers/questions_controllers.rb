get '/' do

 redirect "/questions/all"

end

post '/questions' do

  user = User.find_by(cookie_key: cookies[:cookie_key])
  Question.create(question: params[:Question].to_s, description: params[:Description].to_s, votes:1, user_id: user.id)

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

delete '/questions/:id' do

  @question = Question.find(params[:id])
  @question.delete
  @question.save

  erb :"questions/delete"

end

get '/questions/:id/edit' do

  @question = Question.find(params[:id])

  erb :"questions/edit"

end

get '/questions/:id/vote' do
  @question = Question.find(params[:id])
  @question.votes += 1
  @question.save
  
  redirect "/questions/all"
end