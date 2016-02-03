class UsersController < ApplicationController
  # 初期表示
  def index
    @users = User.all
  end

  # データを閲覧する画面を表示するためのAction
  def show
    @user = User.find(params[:id])
    #unless @user.birthday = ""  # unless @birth_day = blankだとエラーになる。
      date_format = "%Y%m%d"
      birthday = @user.birthday.to_date
      @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    #end
  end

  # データを作成する画面を表示するためのAction
  def new
    @user = User.new
  end

  # データを更新する画面を表示するためのAction
  def edit
    @user=User.find(params[:id])
  end

  # データを作成するためのAction
  def create
    @user = User.new(user_params)
    @user.save
    render :show
  end

  # データを更新するためのAction
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    render :show
  end

  # データを削除するためのAction
  def destroy
  end

  def user_params
    params.require(:user).permit(:name,:gender,:birthday,:hometown,:remarks)
  end
end
