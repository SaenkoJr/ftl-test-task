# frozen_string_literal: true

class Web::SpendingsController < ApplicationController
  before_action :set_spending, only: %i[show edit update destroy]

  def new
    @spending = Spending.new
  end

  def show; end

  def edit; end

  def create
    @spending = current_user.spendings.build(spending_params)

    if @spending.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @spending.update(spending_params)
      redirect_to spending_path(@spending)
    else
      render :edit
    end
  end

  def destroy
    @spending.destroy

    redirect_to root_path
  end

  private

  def set_spending
    @spending = Spending.find(params[:id])
  end

  def spending_params
    params.require(:spending).permit(:name, :description, :amount, :category_id)
  end
end
