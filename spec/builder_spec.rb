require 'spec_helper'

describe ActionView::Helpers::FormBuilder do
  class Post
    def user_id
      1
    end
  end

  let(:template) do
    ActionView::Base.new
  end

  describe "#autocomplete_select" do
    let(:post) { Post.new }
    let(:builder) { ActionView::Helpers::FormBuilder.new(:item, post, template, {}) }

    context "with options" do
      subject { builder.autocomplete_select(:user_id, '/search', :minLength => 3, :source => '/overwrite') }
      it { should eq "<input data-autocomplete-select=\"{&quot;minLength&quot;:3,&quot;source&quot;:&quot;/search&quot;}\" type=\"text\" value=\"1\" name=\"item[user_id]\" id=\"item_user_id\" />" }
    end

    context "without options" do
      subject { builder.autocomplete_select(:user_id, '/search') }
      it { should eq "<input data-autocomplete-select=\"{&quot;source&quot;:&quot;/search&quot;}\" type=\"text\" value=\"1\" name=\"item[user_id]\" id=\"item_user_id\" />" }
    end
  end
end
