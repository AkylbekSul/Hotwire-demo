class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.turbo_stream
    end
  end

  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format| 
      format.html { redirect_to @comment.article }
      format.turbo_stream
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
