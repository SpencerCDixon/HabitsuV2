module Seeds
  class Quotes
    QUOTES = [
      { text: "Don't stop when you are tired.  STOP when you are done!", author: "na" },
      { text: "The best way to predict the future is to create it.", author: "na" },
      { text: "You don't have to be great to start, but you have to start to be great.", author: "na" },
      { text: "Poor spend their money and invest whats left.  Rich invest their money and spend whats
        left.", author: "Jim Rohn" },
      { text: "Eating alone is better than mingling with those whose conversation is negative",
        author: "Jim Rohn" },
      { text: "We either improve, or we regress, for never do we ramain the same",
        author: "Jim Rohn" }
    ]

    def self.run
      QUOTES.each do |quote|
        Quote.find_or_create_by(
          text: quote[:text],
          author: quote[:author]
        )
      end
    end
  end
end
