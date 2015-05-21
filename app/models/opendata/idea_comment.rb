class Opendata::IdeaComment
  include SS::Document

  field :site_id, type: Integer
  field :idea_id, type: Integer
  field :member_id, type: Integer
  field :user_id, type: Integer
  field :name, type: String
  field :text, type: String
  field :comment_deleted, type: DateTime

  belongs_to :site, class_name: "SS::Site"
  belongs_to :idea, class_name: "Opendata::Idea"
  belongs_to :member, class_name: "Opendata::Member"
  belongs_to :user, class_name: "SS::User"

  permit_params :name, :text, :comment_deleted

  validates :site_id, presence: true
  validates :idea_id, presence: true
  validates :text, presence: true, length: { maximum: 400 }

  public
    def allowed?(action, user, opts = {})
      true
    end

  class << self
    public
      def search(params)
        criteria = self.where({})
        return criteria if params.blank?

        criteria = criteria.where(text: /#{params[:keyword]}/) if params[:keyword].present?
        criteria
      end
  end
end
