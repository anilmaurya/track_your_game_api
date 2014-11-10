class Game < ActiveRecord::Base

  has_many :avatars
   
  def as_json(options={})
    super(only: [:id, :name])
  end

end
