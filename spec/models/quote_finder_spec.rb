require 'rails_helper'

describe QuoteFinder do
  describe ".perform" do
    context "returns some quote no matter what" do
      it "returns one from DB if exists" do
        FactoryGirl.create(:quote, text: "This quote exists!")
        expect(described_class.perform.text).to eq "This quote exists!"
      end

      it "returns default quote if none exist" do
        expect(described_class.perform.text).to eq "Have a kick ass day!"
      end
    end
  end
end
