class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable

  dragonfly_accessor :avatar do
    default 'public/system/dragonfly/development/avatar.jpg'
  end
end
