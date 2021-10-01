# frozen_string_literal: true

class Web::SpendingsController < Web::ApplicationController
  before_action :set_spending, only: %i[show edit update destroy]

  after_action :verify_authorized

  def index
    authorize Spending
    @spendings = current_user.spendings
    @total_amount = @spendings.sum(:amount)
  end

  def new
    authorize Spending
    @spending = Spending.new
  end

  def show
    authorize @spending
  end

  def edit
    authorize @spending
  end

  def create
    authorize Spending
    @spending = current_user.spendings.build(spending_params)

    if @spending.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    authorize @spending
    if @spending.update(spending_params)
      redirect_to spending_path(@spending)
    else
      render :edit
    end
  end

  def destroy
    authorize @spending
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
