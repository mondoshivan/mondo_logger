require 'mondo_logger'

describe Log do
  context "level setting" do
    it "is set" do
      Log.level = 'warn'
      expect(Log.level).to eq Logger::WARN
    end
  end
end