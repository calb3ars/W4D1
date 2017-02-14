class CommentsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.where(id: params[:user_id]).first
      @comments = @user.comments
    else
      @contact = Contact.where(id: params[:contact_id]).first
      @comments = @contact.comments
    end
      render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(id: params[:id])
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end
end
