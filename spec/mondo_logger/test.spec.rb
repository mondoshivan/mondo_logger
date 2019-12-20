require 'mondo_logger/test'

describe do
  context "wide" do
    it "works" do
      s = 'test'
      expect(Test.test(s)).to eq s
    end
  end
end