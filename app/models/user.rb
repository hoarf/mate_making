class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :skill_list, :interest_list
  # attr_accessible :title, :belongs_to
  acts_as_taggable_on :skill, :interest
  belongs_to :mate , :class_name => "User"
  has_many :mates, :class_name => "User" , :foreign_key => "mate_id" 


  MAX_RANK = 9999
  SOFT_MATE_CAP = 3
  MATENESS = 2

  def rank(potential_mate)
    
    if potential_mate == self
      return MAX_RANK 
    elsif mates.count > SOFT_MATE_CAP
      return MAX_RANK - 1
    else
      return interest_list.map { |i| potential_mate.skill_list.include?(i)? MATENESS*0 : MATENESS*1  }.sum    
    end

  end

end
