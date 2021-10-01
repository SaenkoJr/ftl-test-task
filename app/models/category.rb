# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :spendings, dependent: :destroy
end
