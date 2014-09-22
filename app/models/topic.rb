class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  def self.paginate(:per_page)
    self.limit(per_page).offset(0 * per_page) 
  end

end
