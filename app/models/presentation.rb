# frozen_string_literal: true

class Presentation < ApplicationRecord
  has_many :feedbacks
  has_many :teams
  has_many :users, through: :teams

  validates_associated :feedbacks
  validates_associated :teams
  validates :name, presence: true
  validates :final_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
