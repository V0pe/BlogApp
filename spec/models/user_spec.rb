require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Random bio', posts_counter: 2) }

  before { subject.save }

  it 'should save the data' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'tests post counter to be less than 0' do
    subject.posts_counter = - 5
    expect(subject).to_not be_valid
  end

  it 'recents post' do
    Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                author_id: subject.id)
    expect(subject.recent_posts.length).to eq 1
  end
end
