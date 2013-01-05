class Presentation < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(root, 'public')

  get '/' do
    erb :index
  end
end