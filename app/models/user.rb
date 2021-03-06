class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  MALE = 1
  FEMALE = 2

  # Validations
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :gender, presence: true, :if => :adulthood
  validates :email, uniqueness: true

  # Associations
  has_many :bills, :dependent => :destroy
  has_many :comments, as: :commentable


  # Scopes

  # Callback
  after_create :send_welcome_email


  # Public Methods
  def adulthood
    self.age.present? and self.age >= 18
  end

  def send_welcome_email
    AppMailer::UserMailer.welcome_message(self.name, self.email).deliver
  end

end

