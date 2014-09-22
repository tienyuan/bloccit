class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  def self.paginate
    page = 0
    per_page = 5
    self.limit(per_page).offset(page * per_page) 
  end

end
