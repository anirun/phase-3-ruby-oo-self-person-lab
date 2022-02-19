require 'pry'

class Person

    attr_reader :name, :happiness, :hygiene # I used reader because I need to create unique setter methods for :happiness and :hygiene
    attr_accessor :bank_account

    @@all = []

    def initialize (name)
        @name = name
        self.bank_account = 25
        self.hygiene = 8
        self.happiness = 8
        save
    end

    def save
        @@all << self
    end

    def happiness=(value)
        if value > 10
          value = 10
        elsif value < 0
          value = 0
        else value = value
        end
        @happiness = value
   end

   def hygiene=(value)
        if value > 10
        value = 10
        elsif value < 0
        value = 0
        else value = value
        end
        @hygiene = value
    end

    # non-attribute instance methods

    def happy?
        if self.happiness > 7
            true
        else
            false
        end
    end

    def clean?
        if self.hygiene > 7
            true
        else
            false
        end
    end

    def get_paid(amount)
        self.bank_account += amount
        return "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness += 2
        self.hygiene -= 3
        return "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(person, topic)
        if topic == "politics"
            self.happiness -= 2
            person.happiness -= 2
            "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            self.happiness += 1 
            person.happiness += 1
            "blah blah sun blah rain"
        else 
            return "blah blah blah blah blah"
        end
    end


end