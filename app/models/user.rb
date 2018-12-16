class User < ApplicationRecord

  has_secure_password

  has_many_attached :data_files

end
