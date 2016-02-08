class SocialAccount < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # ユーザー情報に紐づく
  belongs_to:user

  #Google認証結果を取得
  def self.find_for_google_oauth2(auth)
    account = SocialAccount.where(email: auth.info.email).first

    unless account
       # ユーザー情報を作成する
       user = User.create(name: auth.info.name)
       # アカウント情報を作成する
       account = SocialAccount.create(name: auth.info.name,
                                      user_id: user.id,
                                      provider: auth.provider,
                                      uid: auth.uid,
                                      email: auth.info.email,
                                      token: auth.credentials.token,
                                      password: Devise.friendly_token[0,20])
       end
       account
    end
end
