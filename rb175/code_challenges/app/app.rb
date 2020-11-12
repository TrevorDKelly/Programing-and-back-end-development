require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  @files = gather_public_files
  @link = '/reverse'
  erb :index
end

get '/reverse' do
  @files = gather_public_files.to_a.reverse.to_h
  @link = '/'

  erb :index
end

def gather_public_files
  files = Dir.entries("public/.").each_with_object({}) do |file, hash|
    next if file.match(/^\./)
    name, extention = file.split('.')
    hash[name] = extention
  end

  files.sort.to_h
end
