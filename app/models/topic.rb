class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  def self.paginate(page, per_page)
    self.limit(per_page).offset(page * per_page) 
  end

end
