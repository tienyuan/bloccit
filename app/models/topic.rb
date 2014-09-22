class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

def paginate
  page = 1
  per_page = 20
  self.limit(per_page).offset(page * per_page) 
end

end
