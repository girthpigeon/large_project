require 'spec_helper'

describe Dare do
    let(:user) { FactoryGirl.create(:user) }
    before do
        @dare = Dare.new(content: "Sample Dare", user_id: user.id)
        end
    subject (@dare)
    it { should respond_to(:content)
    it { should respond_to(:user_id)
end
