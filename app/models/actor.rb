class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def list_roles
    characters.map do |character|
      if(character.actor_id == self.id)
        "#{character.name} - #{shows[character.show_id - 1].name}"
      end
    end
  end
  
end