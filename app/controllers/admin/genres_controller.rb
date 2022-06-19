class Admin::GenresController < ApplicationController
  
  def index
   @genres = Genre.all
   @genre = Genre.new
  end 
  
  def create
   @genre = Genre.new(genres_params)
   @genre.save
   redirect_to admin_genres_path
  end 
  
  def edit
   @genre = Genre.find(params[:id])
  end
  
  def update
   @genre = Genre.find(params[:id])
   @genre.update
   redirect_to admin_genres_path
  end 
  
  private
  
  def genres_params
    params.require(:genre).permit(:name)
  end 

end
