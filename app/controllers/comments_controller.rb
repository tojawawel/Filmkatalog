class CommentsController < ApplicationController
  before_action :find_movie
  # before_action :find_comment, only: [:destroy, :edit, :update]

  def create
   @comments = @movie.comments.page(params[:page])
   @comment = @commentable.comments.new(comment_params)
   @comment.movie = @movie
   @comment.user = current_user
   if @comment.save
     respond_to do |format|
       format.html {redirect_to @commentable}
       format.js
     end
   else
     # redirect_to @commentable, alert: "Something went wrong"
     render 'movies/show'
   end
 end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:rate, :body, :movie_id, :parent_id)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def find_comment
    @comment = @commentable.comments.find(params[:id])
  end
end


# @comment = @movie.comments.find(params[:id])
