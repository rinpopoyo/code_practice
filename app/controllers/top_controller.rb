class TopController < ApplicationController
  def index
  end

  def profile
    @user_name = "レイルズ"
    @birth_day = "1987/6/10"
    @age = "28"
    @hometown = "滋賀県"
    @skills = "プログラミング"
    @remarks = "よろしくお願い致します"
  end

  def excercise

  end
end
