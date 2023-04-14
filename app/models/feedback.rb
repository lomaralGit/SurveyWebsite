# frozen_string_literal: true

class Feedback < ApplicationRecord
  belongs_to :presentation
  belongs_to :user

  validates :presentation_id, numericality: { only_integer: true }, presence: true
  validates :feedback, presence: true
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
                    presence: true
  validates :user_id, numericality: { only_integer: true }, presence: true
end
