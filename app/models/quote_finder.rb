DefaultQuote = Struct.new(:text)
class QuoteFinder
  # TODO: Logic for not displaying same quote to person
  # TODO: hit API to get list of lots of quotes
  def self.perform
    if quotes_exist?
      Quote.all.sample
    else
      DefaultQuote.new("Have a kick ass day!")
    end
  end

  def self.quotes_exist?
    Quote.count > 0
  end
end
