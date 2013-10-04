class User < ActiveRecord::Base

  MALE = 1
  FEMALE = 2

  # Validations
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :gender, presence: true, :if => :adulthood

  # Associations

  # Scopes

  # Public Methods
  def adulthood
    self.age >= 18
  end

end

