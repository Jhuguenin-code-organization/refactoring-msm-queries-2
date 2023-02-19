# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  belongs_to(:director, { :class_name => "Director", :foreign_key => "director_id" })
has_many(:characters, { :class_name => "Character", :foreign_key => "movie_id" }) 


  #def director
    #key = self.director_id

    #matching_set = Director.where({ :id => key })

    #the_one = matching_set.at(0)

    #return the_one
  #end
#actors associated to a movie (many-to-many)
  def cast
    the_many = Array.new

    self.characters.each do |joining_record|
      destination_record = joining_record.actor

      actor_name = destination_record.name

      the_many.push(actor_name)
    end

    return the_many
  end

end
