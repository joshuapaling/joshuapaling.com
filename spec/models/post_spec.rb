require 'spec_helper'

describe Post do
  describe 'validations' do
    subject(:post) { Post.new } # sets the subject of this describe block
    before { post.valid? }      # runs a precondition for the test/s

    [:title, :blurb].each do |attribute|
      it "should validate presence of #{attribute}" do
        expect(post).to have_at_least(1).error_on(attribute)
        expect(post.errors.messages[attribute]).to include "can't be blank"
      end
    end
  end

  describe '#content' do
    # Create a double of the MarkdownService
    let(:markdown_service) { double('MarkdownService') }

    before do
      # We don't want to use the actual MarkdownService
      # since it's tested elsewhere!
      MarkdownService.stub(:new) { markdown_service }
    end

    it 'should convert its blurb to markdown' do
      markdown_service.should_receive(:render).with('post blurb')
      post = Post.new(:blurb => 'post blurb')
      post.content(post.blurb)
    end
  end

end