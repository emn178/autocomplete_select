require 'spec_helper'

describe AutocompleteSelect::Helper do
  include AutocompleteSelect::Helper
  include ActionView::Helpers::FormTagHelper

  describe "#autocomplete_select_tag" do
    context "with value" do
      context "with options" do
        context "with html_options" do
          subject { autocomplete_select_tag(:user_id, '/search', 1, {:minLength => 3, :source => '/overwrite'}, {:class => :user}) }
          it { should eq "<input type=\"text\" name=\"user_id\" id=\"user_id\" value=\"1\" class=\"user\" data-autocomplete-select=\"{&quot;minLength&quot;:3,&quot;source&quot;:&quot;/search&quot;}\" />" }
        end

        context "without html_options" do
          subject { autocomplete_select_tag(:user_id, '/search', 1, {:minLength => 3, :source => '/overwrite'}) }
          it { should eq "<input type=\"text\" name=\"user_id\" id=\"user_id\" value=\"1\" data-autocomplete-select=\"{&quot;minLength&quot;:3,&quot;source&quot;:&quot;/search&quot;}\" />" }
        end
      end

      context "without options" do
        context "with html_options" do
          subject { autocomplete_select_tag(:user_id, '/search', 1, {}, {:class => :user}) }
          it { should eq "<input type=\"text\" name=\"user_id\" id=\"user_id\" value=\"1\" class=\"user\" data-autocomplete-select=\"{&quot;source&quot;:&quot;/search&quot;}\" />" }
        end

        context "without html_options" do
          subject { autocomplete_select_tag(:user_id, '/search', 1) }
          it { should eq "<input type=\"text\" name=\"user_id\" id=\"user_id\" value=\"1\" data-autocomplete-select=\"{&quot;source&quot;:&quot;/search&quot;}\" />" }
        end
      end

      context "with label" do
        subject { autocomplete_select_tag(:user_id, '/search', 1, 'Test', {:minLength => 3, :source => '/overwrite', :label => 'overwrite'}, {:class => :user}) }
        it { should eq "<input type=\"text\" name=\"user_id\" id=\"user_id\" value=\"1\" class=\"user\" data-autocomplete-select=\"{&quot;minLength&quot;:3,&quot;source&quot;:&quot;/search&quot;,&quot;label&quot;:&quot;Test&quot;}\" />" }
      end
    end

    context "without value" do
      subject { autocomplete_select_tag(:user_id, '/search') }
      it { should eq "<input type=\"text\" name=\"user_id\" id=\"user_id\" data-autocomplete-select=\"{&quot;source&quot;:&quot;/search&quot;}\" />" }
    end
  end
end
