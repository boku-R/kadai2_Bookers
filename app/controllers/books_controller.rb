class BooksController < ApplicationController
  def index
    @book = Book.new
    # 投稿されたBook全てを表示するため、全てのデータを取得する記述
    @books = Book.all
  end

  # 投稿したデータを保存するためのcreateアクションを作成
  # どうやら、form_withヘルパーを使うと、createアクションに自動で値を渡してくれるみたい
  def create
    # データを受け取るための新規登録用のインスタンスを作成
    book = Book.new(book_params)
    # データをdbに保存するためのsaveメソッドを実行
    book.save
    # showページにリダイレクト(いったんindexページにリダイレクトする)
    # redirect_to '/books'
    # showページにリダイレクト
    redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  # 編集のアクションを作成
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy #任意のデータを削除
    redirect_to books_path #indexページへリダイレクト
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
