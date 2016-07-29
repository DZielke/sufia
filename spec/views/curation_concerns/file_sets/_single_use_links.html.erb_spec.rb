require 'spec_helper'

describe 'curation_concerns/file_sets/_single_use_links.html.erb', type: :view do
  let(:user)          { create(:user) }
  let(:file_set)      { build(:file_set, user: user, id: "1234") }
  let(:solr_document) { SolrDocument.new(file_set.to_solr) }
  let(:ability)       { Ability.new(user) }
  let(:presenter)     { Sufia::FileSetPresenter.new(solr_document, ability) }

  context "with no single-use links" do
    before do
      allow(presenter).to receive(:single_use_links).and_return([])
      render 'curation_concerns/file_sets/single_use_links.html.erb', presenter: presenter
    end
    it "renders a table with no links" do
      expect(rendered).to include("<tr><td>No links have been generated</td></tr>")
    end
  end

  context "with single use links" do
    let(:link) { SingleUseLink.create(itemId: "1234", downloadKey: "sha2hashb") }
    before do
      controller.params = { id: "1234" }
      allow(presenter).to receive(:single_use_links).and_return([link])
      render 'curation_concerns/file_sets/single_use_links.html.erb', presenter: presenter
    end
    it "renders a table with links" do
      expect(rendered).to include("<td>Link sha2ha expires in 23 hours</td>")
    end
  end
end
