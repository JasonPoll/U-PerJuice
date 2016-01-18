class Note < ActiveRecord::Base
  # -- Validations --------
  validates :text, presence: true


  # -- Scopes -------------
  scope :recipe_notes, -> { where(type: 'RecipeNote') }
  

  # -- Methods ------------
  def date
    created_at
  end
end

