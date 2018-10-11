class FileUpload < ApplicationRecord
  has_and_belongs_to_many :tags
  validates :name, presence: true

  def self.with_tags(tags_names)
    joins(:tags)
    .includes(:tags)
    .where(tags: {name: tags_names})
  end

  def self.with_combined_tags(tags_names)
    with_tags(tags_names)
    .group(:id)
    .having("count(*) >= #{tags_names.length}")
  end

  def self.filter_by_tags(allowed_tags, denied_tags)
    allowed_ids = with_combined_tags(allowed_tags).pluck(:id)
    denied_ids = with_tags(denied_tags).pluck(:id)
    final_ids = allowed_ids - denied_ids
    where(id: final_ids)
  end

  def self.search(allowed_tags, denied_tags, page)
    filter_by_tags(allowed_tags, denied_tags)
    .paginate(page)
    .order(:name)
  end
end
