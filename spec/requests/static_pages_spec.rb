require 'spec_helper'

describe "StaticPages" do
 
    subject { page }

    shared_examples_for "all static pages" do
      it { should have_selector('h1', text: heading) }
      it { should have_selector('title', text: full_title(page_title)) }
    end

    describe "Home Page" do
        before { visit root_path }
        let(:heading) { "Welcome to You Won't" }
        let(:page_title) { '' }
        it_should_behave_like "all static pages"
        it { should_not have_selector 'title', text: '| Home' }
        
        describe "dare feed should be present" do
            
            describe "when not logged in" do
                it { should have_selector('h3', text: "Latest Dares") }
            end
            
            describe "when logged in" do
                let(:user) {FactoryGirl.build(:user)}
                before do
                    sign_in user
                    visit root_path
                end
                it { should have_selector('h3', text: "Latest Dares") }
            end
        end
    end

    describe "Help page" do
        before {visit help_path }
        let(:heading) { 'Help' }
        let(:page_title) { 'Help' }
        it_should_behave_like "all static pages"
    end

    describe "Terms and Conditions pages" do
        before {visit terms_path }
        let(:heading) { 'Terms and Conditions' }
        let(:page_title) { 'Terms and Conditions' }
        it_should_behave_like "all static pages"
    end

    describe "About page" do
        before { visit about_path }
        let(:heading) { 'About' }
        let(:page_title) { 'About Us' }
        it_should_behave_like "all static pages"
    end

    describe "Contact page" do
        before { visit contact_path }
        let(:heading) { 'Contact' }
        let(:page_title) { 'Contact' }
        it_should_behave_like "all static pages"
    end

    it "should have the right links on the layout" do
        visit root_path
        click_link "Home"
        page.should have_selector 'title', text: full_title('')
        click_link "Sign in"
        page.should have_selector 'title', text: full_title('Sign in')
        click_link "Home"
        click_link "Sign up now!"
        page.should have_selector 'title', text: full_title('Sign up')
        click_link "Terms and Conditions"
        page.should have_selector 'title', text: full_title('Terms and Conditions')
        click_link "YouWont.us"
        page.should have_selector 'title', text: full_title('')
    end
end
