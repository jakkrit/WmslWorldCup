class Bet < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  belongs_to :calculation
  belongs_to :calculation_config
  
  validates :player , :match , :calculation_config , presence: true
  validates_uniqueness_of :match, :scope => :player
  
  validates :penalty,:yellow_card,:red_card,:own_goal, inclusion: { in: [true,false]} , :on => :update
  validates :result, inclusion: { in: [0,1,2]} , :on => :update
  
  validates :team1_score , :team2_score , numericality: { only_integer: true , greater_than_or_equal_to: 0 , less_than: 100 } , :on => :update
  
end
