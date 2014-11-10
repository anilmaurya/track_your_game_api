class User < ActiveRecord::Base
  validates :username, :number, :password, presence: true

  has_many :avatars
  has_many :games, through: :avatars

  before_save :add_token

  def as_json(options={})
    super(only: [:username, :number, :token])
  end

  def add_token
    self.token = SecureRandom.urlsafe_base64(nil, false)
  end
end
