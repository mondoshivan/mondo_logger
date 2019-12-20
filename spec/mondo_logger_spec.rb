require 'mondo_logger'

describe do
  context "wide" do
    it "works" do
      expect{Log.debug('hello')}.to_not raise_error(RuntimeError)
    end
  end
end