class MoviesController < ApplicationController
  before_action :set_movie, only:[:show,:edit,:update,:destroy]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    movie_params = params.require(:movie).permit(:name, :premiere_date, :length, :description, :genre, :director, :scenarist, :country)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end
