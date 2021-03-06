require 'spec_helper'

feature "Order movies in show page" do
  let(:u) { FactoryGirl.create(:user) }
  let(:u1) { FactoryGirl.create(:user, name:"othername", email:"email@gmail.com") }
  let(:u2) { FactoryGirl.create(:user, name:"othername1", email:"email1@gmail.com") }

  let(:m1) { FactoryGirl.create(:movie, user_id: u1.id)}
  let(:m2) { FactoryGirl.create(:movie, user_id: u1.id, title:"title1")}
  let(:m3) { FactoryGirl.create(:movie, user_id: u1.id, title:"title2")}

  let(:l1) { FactoryGirl.create(:vote, user_id: u.id, movie_id: m2.id, positive: true)}
  let(:l2) { FactoryGirl.create(:vote, user_id: u.id, movie_id: m3.id, positive: true)}
  let(:l3) { FactoryGirl.create(:vote, user_id: u2.id, movie_id: m2.id, positive: true)}

  let(:h1) { FactoryGirl.create(:vote, user_id: u.id, movie_id: m1.id, positive: false)}
  let(:h2) { FactoryGirl.create(:vote, user_id: u2.id, movie_id: m1.id, positive: false)}
  let(:h3) { FactoryGirl.create(:vote, user_id: u.id, movie_id: m3.id, positive: false)}

  scenario 'by date' do
    m1.reload
    m2.reload
    m3.reload

    visit user_path(u1)

    m3.title.should appear_before(m2.title)
    m2.title.should appear_before(m1.title)
  end

  scenario 'by likes' do
    m1.reload
    m2.reload
    m3.reload
    l1.reload
    l2.reload
    l3.reload

    visit user_path(u1)

    click_link 'Likes'

    m2.title.should appear_before(m3.title)
    m3.title.should appear_before(m1.title)
  end

  scenario 'by hates' do
    m1.reload
    m2.reload
    m3.reload
    h1.reload
    h2.reload
    h3.reload

    visit user_path(u1)

    click_link 'Hates'

    m1.title.should appear_before(m3.title)
    m3.title.should appear_before(m2.title)
  end
end