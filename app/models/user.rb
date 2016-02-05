class User < ActiveRecord::Base
  enum gender: { unknown: 0, male: 1, female: 2, other: 9 }

  # ユーザー名による絞り込み
  scope :get_by_name, -> (name) {where("name like ?", "%#{name}%")}
  # この書き方でも良い   scope :get_by_name, -> (name) {where("name like '%#{name}%' ")}


  # 性別による絞り込み
  scope :get_by_gender, ->(gender){
    where(gender: gender)
    }

  # 出身地による絞り込み
  scope :get_by_hometown, -> (hometown) { where("hometown like ?", "%#{hometown}%")}

end
