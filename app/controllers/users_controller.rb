class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @today_book =  @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
    set_chartlabels
    set_chartdatas
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def search
    @user = User.find(params[:user_id])
    @books = @user.books
    if params[:created_at].blank?
      @search_books = "日付を選択してください"
    else
      create_at = params[:created_at]
      @search_books = @books.where(['created_at LIKE ? ', "#{create_at}%"])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def set_chartlabels
    @chartlabels = []
    for n in 0..6 do
      @chartlabels << view_context.day_ago(n)
    end
    @chartlabels = @chartlabels.reverse.to_json.html_safe
  end

  def set_chartdatas
    @chartdatas = []
    for n in 0..6 do
      @chartdatas << @user.create_books_day_ago(n).count
    end
    @chartdatas = @chartdatas.reverse
  end
end
