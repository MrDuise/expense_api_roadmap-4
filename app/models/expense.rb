class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :category, inclusion: { in: %w[Groceries Leisure Electronics Utilities Clothing Health Others] }

  # Example method to filter expenses by date range
  def self.filter_by_date(start_date, end_date)
    where(date: start_date..end_date)
  end
end
