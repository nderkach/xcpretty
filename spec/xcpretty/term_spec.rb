# frozen_string_literal: true

require 'xcpretty/term'

module XCPretty
  describe Term do
    it "marks unicode as unavailable" do
      allow(Encoding).to receive(:default_external).and_return(Encoding::ASCII)
      expect(Term.unicode?).to be false
    end

    it "marks unicode as available" do
      allow(Encoding).to receive(:default_external).and_return(Encoding::UTF_8)
      expect(Term.unicode?).to be true
    end

    it 'marks color as unavailable' do
      allow(STDOUT).to receive(:tty?).and_return(false)
      expect(Term.color?).to be false
    end

    it 'marks color as available' do
      allow(STDOUT).to receive(:tty?).and_return(true)
      expect(Term.color?).to be true
    end
  end
end
