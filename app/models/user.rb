class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :name, presence: true, length: { minimum: 3, too_short: "%{count} characters is minimum required"}
  validates :email, presence: true, uniqueness: true

  has_many :posts

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name)
  end
end
