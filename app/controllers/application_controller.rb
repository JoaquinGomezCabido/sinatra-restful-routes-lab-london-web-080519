class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/recipes" do
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe[params])
    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    Recipe.destroy(params[:id])
    redirect "/recipes"
  end
end
