get '/' do
  @categories = Category.all

  erb :index
end

get '/categories/:id' do
  @cat = Category.find(params[:id])
  @posts = Post.where('category_id = ?', params[:id])

  erb :category
end

get '/categories/:id/new' do
  @cat = Category.find(params[:id])

  erb :new
end

post '/categories/:id/submit' do 
  @cat = Category.find(params[:id])
  @post = Post.create(
    :title => params[:title],
    :price => params[:price],
    :location => params[:location],
    :email => params[:email],
    :description => params[:description],
    :category_id => params[:id])

  erb :submit
end

get '/posts/:id' do
  @post = Post.find(params[:id])

  erb :post
end

get '/posts/:id/:token' do
  @post = Post.find(params[:id])

  erb :edit
end

post '/posts/:id/edit' do
  @post = Post.find(params[:id])
  @post.assign_attributes(
    :title => params[:title],
    :price => params[:price],
    :location => params[:location],
    :email => params[:email],
    :description => params[:description])
  @post.save

  redirect "/posts/#{@post.id}"
end

post '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy

  redirect '/' 
end


