# coding: utf-8
module Opendata::Addons::Dataset
  class EditCell < Cell::Rails
    include SS::AddonFilter::EditCell
  end

  class ViewCell < Cell::Rails
    include SS::AddonFilter::ViewCell
  end
end