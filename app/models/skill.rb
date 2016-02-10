class Skill < ActiveRecord::Base
  # ユーザー情報に紐づく
  belongs_to :user, foreign_key: "user_id"
end
