module Opendata::Agents::Nodes::Api
  class EditController < ApplicationController
    include Cms::NodeFilter::Edit
    model Opendata::Node::Sparql
  end
end
