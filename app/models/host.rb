class Host < ApplicationRecord
    has_secure_password
    validates :login_id, {presence: true}
end
