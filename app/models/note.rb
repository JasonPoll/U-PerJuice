class Note < ActiveRecord::Base
  # -- Validations --------
  validates :text, presence: true



  # -- Methods ------------
  def date
    created_at
  end
end

