class CopiesController < ApplicationController
  def new
    @copy = Copy.new
  end

  def show
    @copy = Copy.find(params[:id])
  end

  def create
    @book = Book.find(params[:book_id])
    @book = @book.copies.create(copy_params)
    redirect_to book_path(@book)
  end

  # def create
  #   @copy = Copy.new(copy_params)
  #
  #   if @copy.save
  #     redirect_to books_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def edit
    @copy = Copy.find(params[:id])
  end

  def update
    @copy = Copy.find(params[:id])

    if @copy.update(copy_params)
      redirect_to @copy
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @copy = Copy.find(params[:id])
    @copy.destroy

    redirect_to books_path, status: :see_other
  end

  private
  def copy_params
    params.require(:copy).permit(:borrower, :dueDate, :book_id)
  end
end
