
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new'do
    erb :new
  end

  post '/posts' do
    Post.new(params).save
    # redirect get '/posts'
    erb :index
  end

  get '/posts' do
      erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end
end
