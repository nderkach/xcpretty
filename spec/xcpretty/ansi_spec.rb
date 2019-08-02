# frozen_string_literal: true

require "xcpretty/ansi"

module XCPretty
  describe ANSI do
    include ANSI

    before do
      self.colorize = true
      @text = "This is the PARTY"
    end

    describe "color helpers" do
      it "colors text red" do
        expect(red(@text)).to eq("\e[31m#{@text}\e[0m")
      end

      it "formats text bold" do
        expect(white(@text)).to eq("\e[39;1m#{@text}\e[0m")
      end

      it "colors text green" do
        expect(green(@text)).to eq("\e[32;1m#{@text}\e[0m")
      end

      it "colors text cyan" do
        expect(cyan(@text)).to eq("\e[36m#{@text}\e[0m")
      end
    end

    describe "custom color mixing" do
      it "can mix random known colors" do
        expect(ansi_parse(@text, :yellow, :underline)).to eq("\e[33;4m#{@text}\e[0m")
      end
    end

    describe "debug helpers" do
      it "can remove formatting from text" do
        expect(strip("\e[33;4m#{@text}\e[0m")).to eq(@text)
      end

      it "can list known applied effects" do
        expect(applied_effects("\e[33;1m#{@text}\e[0m")).to eq(%i[yellow bold])
      end
    end
  end
end
