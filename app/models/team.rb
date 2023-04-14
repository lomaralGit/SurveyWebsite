# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :presentation
  belongs_to :user
end
