class VentureCapitalist
    attr_reader :total_worth, :name
    @@all = []
    def initialize(name, total_worth)

        @name = name
        @total_worth = total_worth

        @@all << self

    end

    def offer_contract(start_up_obj, type, amount)
        FundingRound.new(start_up_obj,self, type, amount)
    end

    def funding_rounds 
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |fr|
            # binding.pry
            fr.startup.name
        end.uniq
    end

    def biggest_investment
        funding_rounds.max_by do |fr|
            fr.investment
        end
    end

    def invested(domain_string)
        domain = funding_rounds.select do |fr|
            fr.startup.domain == domain_string
            # binding.pry
        end
        domain.sum do |fr|
            # binding.pry
            fr.investment
        end
    end

    def self.all
        @@all 
    end

    def self.tres_commas_club
        # @@all.select do |vc|
        #     self.commas(vc.total_worth) >= 3
        # end
        @@all.select do |vc| 
            vc.total_worth > 1000000000
        end
    end

    # def self.commas(x)
    #     formatted_number = []
    #     index = 0
    #     length = x.to_s.reverse.split("").size
    #     x.to_s.reverse.split("").map do |letter|
    #         if index == 2 
    #             index = 0
    #             # formatted_number.push(letter)
    #             formatted_number.push(",")
    #         else
    #             # formatted_number.push(letter)
    #             index += 1 
    #         end  
    #     end
    #     formatted_number.size
    #     # formatted_number.reverse.join("")
    #   end
end
