class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable       
         
  has_many :tasks

  class User < ApplicationRecord
    has_one :additional_user_info
  end
  
  # app/models/additional_user_info.rb
  class AdditionalUserInfo < ApplicationRecord
    belongs_to :user
  end
end
