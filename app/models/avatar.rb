class Avatar < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  
  def as_json(options={})
    super(only: [:id], methods: [:name])
  end

  def name
    user && user.username || number
  end
end
