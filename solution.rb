require 'pry'
class Deck
    attr_accessor :cards
    @@ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    @@suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
            
    def initialize
        @cards = []
        self.class.suits.each do |suit|
            self.class.ranks.each do |rank|
                cards << Card.new(suit, rank)
            end
        end
    end

    def choose_card
        suit = self.class.suits[rand(0...self.class.suits.length)]
        rank = self.class.ranks[rand(0...self.class.ranks.length)]
        chosen_card = find_by_card(suit, rank)
        remove_card(chosen_card)
        chosen_card
    end

    def self.suits
        @@suits
    end

    def self.ranks
        @@ranks
    end

    def find_by_card(suit, rank)
        cards.find do |card|
            card.suit == suit && card.rank == rank
        end
    end

    def remove_card(card)
        cards.delete(card)
    end
end

class Card
    attr_accessor :suit, :rank

    def initialize(suit, rank)
        @suit = suit
        @rank = rank
    end
end
