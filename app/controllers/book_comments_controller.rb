class BookCommentsController < ApplicationController
  

  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = @book.id
    comment.save
    redirect_to books_path(@book)
  end
def destroy
    book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy

end
  
   private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

