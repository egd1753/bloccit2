class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present? }
  before_save :format_names

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: -> { password_digest.nil? }
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: true },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  def format_names
    if name
      full_name = []
      name.split.each do |element|
        full_name.push(element.capitalize)
      end
      self.name = full_name.join(" ")
    end
  end

end
