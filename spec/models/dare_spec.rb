require 'spec_helper'

describe Dare do
    let(:user) { FactoryGirl.create(:user) }
    before { @dare = user.dares.build(content: "Sample Dare") }
    
    subject { @dare }
    it { should respond_to(:content) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    it { should respond_to(:accepted_by) }
    it { should respond_to(:accepted) }
    its(:user) { should == user }
    it { should be_valid }
    
    describe "when content is not present" do
        before { @dare.content = " " }
        it { should_not be_valid }
    end
    
    describe "when user_id is not present" do
        before { @dare.user_id = " " }
        it { should_not be_valid }
    end
    
    describe "when content is too long" do
        before { @dare.content = "a" * 201 }
        it { should_not be_valid }
        
        describe "accessible attributes" do
            it "should not allow access to user_id" do
                expect do
                    Dare.new(user_id: user.id)
                end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
            end
        end
        
        describe "when user_id is not present" do
            before { @dare.user_id = nil }
            it { should_not be_valid }
        end
    end
end
    
