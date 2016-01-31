class RecipeIngredient < ActiveRecord::Base
  # --- validations -------------------
  validates :percentage, presence: true
  validates :percentage, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0 }

  # --- callbacks ---------------------
  after_initialize :ensure_default_values_are_set
  before_save :truncate_percentage, if: -> { percentage_changed? }

  # --- scopes ------------------------
  
  # --- methods -----------------------


private
  # after_initialize callback
  def ensure_default_values_are_set
    assign_attributes( { percentage: percentage || 3.0 } )
  end

  def truncate_percentage
    rounded = percentage.round(2)
    self.percentage = rounded
  end
end
