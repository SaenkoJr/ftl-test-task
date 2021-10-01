# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :spendings, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }

  def guest?
    false
  end
end
