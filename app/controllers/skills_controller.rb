class SkillsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  # 新規作成
  def create
    @skill = Skill.new(skill_params)
    # @task.author = current_member
    if @skill.save
      redirect_to @skill, notice: "特技を作成しました。"
    else
      render "new"
    end
  end

  def edit
  end


  def skill_params
    params.require(:skill).permit(:user_id, :skill_name)
  end
end
