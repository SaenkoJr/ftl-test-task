# frozen_string_literal: true

class Spending < ApplicationRecord
  belongs_to :category
  belongs_to :user
end
