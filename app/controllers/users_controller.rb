class UsersController < ApplicationController
  # 初期表示
  def index
    @users = User.all
    #@skills = Skill.all
    # パラメータとして名前か性別を受け取っている場合は絞って検索する
    if params[:name].present?
      @users = @users.get_by_name params[:name]
      #@users = @users.get_by_name(params[:name])  ← これでもOK
    end

    if params[:gender].present?
      @users=@users.get_by_gender params[:gender]
    end

    if params[:hometown].present?
      @users = @users.get_by_hometown(params[:hometown])
      # @users = @users.get_by_hometown params[:hometown]  ← これでもOK
    end

    # ページネーション(kaminari)
    @users = @users.page(params[:page]).per(4)
  end

  # データを閲覧する画面を表示するためのAction
  def show
    @user = User.find(params[:id])
    unless @user.birthday = ""  # unless @birth_day = blankだとエラーになる。
      date_format = "%Y%m%d"
      birthday = @user.birthday.to_date
      @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    end
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
    #render :show
    redirect_to controller: 'users', action: 'show', id: @user.id #redirect_to :action => "show" #もしくは redirect_to @user
  end

  # データを更新するためのAction
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    #render :show
    redirect_to @user #もしくは redirect_to :action => "show"
  end

  # データを削除するためのAction
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    #@users = User.all
    redirect_to :users #もしくは redirect_to :action => "index"
  end

  def user_params
    params.require(:user).permit(:name,:gender,:birthday,:hometown,:remarks, :image, :photo, :skill_name)
  end
end
