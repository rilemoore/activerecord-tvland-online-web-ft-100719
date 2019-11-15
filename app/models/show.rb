class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network
  
  def actors_list
    characters.map do |character|
      if(character.show_id == self.id)
        actors[character.actor_id - 1].full_name
      end
    end
  end
  
  def build_network(letters)
    show.network = Network.create(:call_letters = letters)
  end
  
end