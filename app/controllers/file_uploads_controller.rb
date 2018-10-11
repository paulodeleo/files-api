class FileUploadsController < ApplicationController

  def index
    tags = index_params['tags']
    page = index_params['page'].to_i

    tags_to_allow = TagNameParser.tag_names_to_allow(tags)
    tags_to_deny = TagNameParser.tag_names_to_deny(tags)

    @records = FileUpload.search(tags_to_allow, tags_to_deny, page)
    related_tags = FileUpload.related_tags(@records, tags_to_allow)

    render json: {
      total_records: @records.length,
      related_tags: FileUpload.related_tags(@records, tags_to_allow),
      records: @records.map{|record| { uuid: record.id, name: record.name } }
    }
  end

  def create
    file_name = creation_params['name']
    tags_names = creation_params['tags']

    FileUpload.transaction do
      tags = []
      tags_names.each do |tag_name|
        tags.push Tag.find_or_create_by(name: tag_name)
      end
      @record = FileUpload.create name: file_name, tags: tags
    end

    render json: { uuid: @record.id }
  end

  private

    def index_params
      params.permit(:tags, :page)
    end

    def creation_params
      params.permit(:name, tags: [])
    end
end
