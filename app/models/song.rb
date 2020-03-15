class Song < ApplicationRecord
    validates :title, presence:true 
    validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Cannot release the same song twice in a year."}

    validates :released, inclusion: { in: [true,false]}

    validates :release_year, presence:true
     
    validate :valid_release_year? 

    validates :artist_name, presence:true 

    def valid_release_year? 
        return true unless released 
        
        year = release_year.to_i 
         if year.zero? 
          errors.add(:release_year, 'must be a number') 
         elsif year > Date.today.year 
          errors.add(:release_year, 'must be in the past') 
         end 
        
    end 

end
