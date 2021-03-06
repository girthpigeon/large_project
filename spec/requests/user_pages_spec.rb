require 'spec_helper'

describe "UserPages" do
    
    subject { page }
    
    describe "signup page" do
        before { visit signup_path }
        it { should have_selector('h1', text: 'Sign up') }
        it { should have_selector('title', text: full_title('Sign up')) }
    end
    
    describe "signup" do
        before { visit signup_path }
        let(:submit) { "Create my account" }
        
        describe "with invalid information" do
            it "should not create a user" do
                expect { click_button submit }.not_to change(User, :count)
            end
            
            describe "after submission" do
                before { click_button submit }
                
                it { should have_selector('title', text: 'Sign up') }
                it { should have_content('error') }
                it { should_not have_content('Welcome') }
                it { should have_selector('div', id: 'error_explanation') }
                it { should have_selector('div', class: 'alert-error') }
            end
            
        end
        
        describe "with valid information" do
            let(:user) {FactoryGirl.build(:user)}
            before { valid_signup(user) }
            
            it "should create a user" do
                expect { click_button submit }.to change(User, :count).by(1)
            end
            
            describe "after saving the user" do
                before { click_button submit }
                #let(:user) { User.find_by_email('user@example.com') }
                
                it { should have_selector('title', text: user.name) }
                it { should have_selector('div.alert.alert-success', text: 'Welcome') }
                #new test ensures user dare history is shown
                it { should have_selector('h2', text: '0 Dares') }
                it { should have_link('Sign out') }
            end
        end
    end
    
    describe "profile page" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user) }
        it { should have_selector('title', text: user.name) }
        it { should have_selector('h2', text: 'Dares') }
        it { should have_selector('h2', text: 'Accepted Dares') }
    end
    
end























