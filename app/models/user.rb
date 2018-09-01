class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  # メールアドレスの正規表現用の変数 VALID_EMAIL_REGEX
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX },
             # 一意であることを確認、大文字と小文字の区別はつける
             uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
