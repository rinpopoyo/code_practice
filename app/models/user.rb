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

  # 画像の保存設定
  has_attached_file :image,
  styles: {medium:"300x300>",thumb:"200x200>"},
  path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
  url: "/system/:class/image/:id.:style.:extension"

  validates_attachment_content_type :image, content_type: /image/

  # 画像の保存設定
  has_attached_file :photo,
  styles: {medium:"300x300>",thumb:"200x200>"},
  path: "#{Rails.root}/public/system/:class/image/photo/:id.:style.:extension",
  url: "/system/:class/image/photo/:id.:style.:extension"

  validates_attachment_content_type :image, content_type: /image/

end
