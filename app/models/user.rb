# frozen_string_literal: true

# Model for users, has method for hashing a password
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  has_secure_password

  has_many :feedbacks
  has_many :teams
  has_many :presentations, through: :teams

  validates_associated :feedbacks
  validates_associated :teams
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :privileged, inclusion: [true, false]
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :is_active, inclusion: [true, false]

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost:)
  end
end
