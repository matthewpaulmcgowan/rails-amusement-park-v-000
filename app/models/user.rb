class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions,through: :rides
  
  def mood
    if nausea && happiness
      if nausea > happiness 
        "sad"
      else
        "happy"
      end
    else
      "neutral"
    end
  end
end
