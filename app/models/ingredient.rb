class Ingredient < ActiveRecord::Base
  # --- validations -------------------
  validates :name, :inventory_amount, :density, :pg, :vg, :nicotine, :average_cost, presence: true
  validates :pg, :vg,                                                               numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :nicotine, :density, :inventory_amount, :average_cost,                  numericality: { greater_than_or_equal_to: 0.0 }
  validates :name,                                                                  uniqueness: { case_sensitive: false }
  validate  :pg_vg_sum_equals_100, if: -> { pg.present? && vg.present? }

  # --- callbacks ---------------------
  after_initialize :ensure_default_values_are_set
  

  # --- scopes ------------------------

  # --- methods -----------------------


private

  # validation
  def pg_vg_sum_equals_100
    if (pg + vg) != 100
      errors.add(:pg, "PG+VG doesn't sum to 100")
      errors.add(:vg, "PG+VG doesn't sum to 100")
    end
  end

  # after_initialize callback
  def ensure_default_values_are_set
    assign_attributes( 
      { inventory_amount: inventory_amount || 0.0,
        density:          density          || 0.0,
        pg:               pg               || 100, 
        vg:               vg               || 0, 
        nicotine:         nicotine         || 0.0, 
        average_cost:     average_cost     || 0.0
      }
    )
  end
end
