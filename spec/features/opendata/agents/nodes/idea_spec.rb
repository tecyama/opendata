require 'spec_helper'

describe "opendata_agents_nodes_idea", dbscope: :example do

  before do
    create_once :opendata_node_search_idea, basename: "idea/search"
  end

  let(:area) { create_once :opendata_node_area, basename: "opendata_area_1" }
  let(:node) { create_once :opendata_node_idea, name: "opendata_agents_nodes_idea" }
  let(:idea) { create_once :opendata_idea, filename: "#{node.filename}/1.html", area_ids: [ area.id ] }
  let(:site) { cms_site }
  let(:index_path) { "#{node.url}index.html" }
  let(:show_point_path) { "#{node.url}#{idea.id}/point.html" }
  let(:add_point_path) { "#{node.url}#{idea.id}/point.html" }
  let(:point_members_path) { "#{node.url}#{idea.id}/point/members.html" }
  let(:show_comment_path) { "#{node.url}#{idea.id}/comment/show.html" }
  let(:show_dataset_path) { "#{node.url}#{idea.id}/dataset/show.html" }
  let(:show_app_path) { "#{node.url}#{idea.id}/app/show.html" }
  let(:rss_path) { "#{node.url}rss.xml" }
  let(:index_areas_path) { "#{node.url}areas.html" }
  let(:index_tags_path) { "#{node.url}tags.html" }

  it "#index" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", index_path)
      visit index_path
      expect(current_path).to eq index_path
    end
  end

  it "#show_point" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", show_point_path)
#      session.env("method", "POST")
      visit show_point_path
      expect(current_path).to eq show_point_path
    end
  end

  it "#rss" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", rss_path)
      visit rss_path
      expect(current_path).to eq rss_path
    end
  end

  it "#point_members" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", point_members_path)
      visit point_members_path
      expect(current_path).to eq point_members_path
    end
  end

  it "#show_comment" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", show_comment_path)
      visit show_comment_path
      expect(current_path).to eq show_comment_path
    end
  end

  it "#show_dataset" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", show_dataset_path)
      visit show_dataset_path
      expect(current_path).to eq show_dataset_path
    end
  end

  it "#show_app" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", show_app_path)
      visit show_app_path
      expect(current_path).to eq show_app_path
    end
  end

end
