require 'pry'
class Animal
  attr_accessor :name

  def bark
    #
    "howl"
  end
end

# dog = Animal.new
# dog.name = "doggy"
# puts "my dogs name is #{dog.name} and he like to #{dog.bark}"


class Dog < Animal


end
