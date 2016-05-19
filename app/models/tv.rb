class Tv < ActiveRecord::Base
    has_many :comments
    
    def avg
        sum = 0
        comments.each do |c|
            sum += c.score
        end
        if  comments.count == 0
            return 0
        else
            sum.to_f / comments.count
        end
    end
    
    
end
