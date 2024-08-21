class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    start_date = params[:start_date] || 1.month.ago.to_date
    end_date = params[:end_date] || Date.today

    @expenses = Expense.filter_by_date(start_date, end_date)
    render json: @expenses
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    head :no_content
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :date, :category)
  end
end
