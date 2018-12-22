class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy require_same_user]
  before_action :require_same_user, only: %i[edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @movies = Movie.search(params[:term])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      flash[:success] = 'Movie was successfully created'
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def show
    @comments = @movie.comments.page(params[:page])
    @comment = Comment.new
    @favourite_exists = Favourite.where(movie: @movie, user: current_user).empty? ? false : true
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:warning] = 'Movie was successfully updated'
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    flash[:warning] = 'Movie was successfully destroyed'
    redirect_to movies_path
  end

  private
  def movie_params
    movie_params = params.require(:movie).permit(:name, :premiere_date, :length, :description, :genre, :director, :scenarist, :country, :cover)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def require_same_user
    unless current_user.admin? || current_user == @movie.user
      flash[:danger] = 'You can only edit or delete your own articles!'
      redirect_to root_path
    end
  end
end
