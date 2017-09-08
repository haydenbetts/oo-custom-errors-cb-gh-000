class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    if person.class != Person
      begin
        raise PartnerError
      # creates an instance of the partner error class with the name
      # error, then puts the attribute message from that class.
      rescue PartnerError => error
       puts error.message
    end
    else
      person.partner = self
    end
  end

  # first time I've defined a class inside of another class. We have defined
  # modules inside of other modules when creating namespaces
  class PartnerError < StandardError
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end

end



beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name
