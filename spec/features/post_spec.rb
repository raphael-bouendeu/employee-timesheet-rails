require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
before do
   user = User.create(email: 'ab@yahoo.com', password: 'cameroun', password_confirmation: 'cameroun', first_name: 'Bouendeu',
                          last_name: 'raphy')
                          login_as(user, :scope=>:user)
     visit new_post_path
end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
     
      fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]',	with: 'anything'
      click_on 'Save'
      expect(page).to have_content('anything')
    end
    it "will have a user associated it" do
       fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]',	with: 'anything'
      click_on 'Save'
       expect(User.last.posts.last.rationale).to eq('anything')
    end
    
  end
end
