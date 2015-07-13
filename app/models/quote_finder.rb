DefaultQuote = Struct.new(:text)
class QuoteFinder
  # TODO: Logic for not displaying same quote to person
  # TODO: hit API to get list of lots of quotes
  def self.perform
    if Quote.count > 0
      Quote.all.sample
    else
      DefaultQuote.new("Have a kick ass day!")
    end
  end
end
