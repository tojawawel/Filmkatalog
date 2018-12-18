class CommentsController < ApplicationController
  before_action :find_movie
  before_action :find_comment, only: [:destroy, :edit, :update]

  def create
    @comment = Comment.new(comment_params)
    @comment.movie = @movie
    @comment.user = current_user
    if @comment.save
      redirect_to movie_path(@comment.movie)
    else
      render 'movies/show'
    end

  end

  def destroy
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:rate, :body, :movie_id)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
