require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @users = YAML.load(File.open('data/users.yaml'))
end

helpers do
  def count_users
    @users.size
  end

  def count_interests
    @users.reduce(0) do |total, (_, info)|
      total + info[:interests].size
    end
  end
end

get '/' do

  erb :home
end

get '/:user' do
  @name = params[:user]
  @info = @users[@name.to_sym]
  erb :user
end
