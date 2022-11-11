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
    @book = Book.new(book_params)
    # データをdbに保存するためのsaveメソッドを実行
    if @book.save
      # フラッシュメッセージを定義
      flash[:notice] = "Book was successfully created."
      # showページにリダイレクト
      redirect_to book_path(@book.id)
    else
      # indexページにリダイレクト（ページを移動せずそのまま更新）
      # render :indexするとindexアクションをすっ飛ばすため、ここにBook.allのインスタンスを作る必要あり
      @books = Book.all
      # redirect_to books_path
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    # if @book.save
      # flash[:notice] = "Book was successfully updated."
    # end
  end

  # 編集のアクションを作成
  def update
    book = Book.find(params[:id])
    # updateが成功・失敗した時を記述
    if book.update(book_params)
      # フラッシュメッセージの
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id) #showページにリダイレクト
    else
      @book = book
      render :edit #editページにそのまま飛ぶ
    end
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
