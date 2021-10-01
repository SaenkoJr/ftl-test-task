# frozen_string_literal: true

class SpendingPolicy < ApplicationPolicy
  def index?
    !user.guest?
  end

  def new?
    !user.guest?
  end

  def show?
    author?
  end

  def edit?
    author?
  end

  def create?
    !user.guest?
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  def author?
    record.user_id == user.id
  end
end
