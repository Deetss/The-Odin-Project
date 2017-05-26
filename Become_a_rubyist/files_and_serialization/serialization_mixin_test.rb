require "serialization_mixin.rb"

class Person
  include BasicSerializable

  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

p = Person.new "David", 28, "male"
p p.serialize

p.unserialize (p.serialize)
puts "Name #{p.name}"
puts "Age #{p.age}"
puts "Gender #{p.gender}"
