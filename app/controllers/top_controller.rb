class TopController < ApplicationController
  def index
  end

  def profile
    @user_name = "レイルズ"
    @birth_day = ""

    unless @birth_day = ""  # unless @birth_day = blankだとエラーになる。 
      date_format = "%Y%m%d"
      birthday = @birth_day.to_date
      @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    end
    @hometown = "滋賀県"
    @skills = ["プログラミング", "詩の朗読", "ものまね"]
    @remarks = "よろしくお願い致します"
    @gender = "man"
  end

  def excercise

  end
end
