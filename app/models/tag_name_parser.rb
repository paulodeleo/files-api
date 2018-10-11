class TagNameParser

  def self.tag_names_to_allow(tags_string)
    tags = parse_to_array(tags_string)
    tags.map{|tag| /[+](\w+)/.match(tag).try(:[], 1)}.compact
  end

  def self.tag_names_to_deny(tags_string)
    tags = parse_to_array(tags_string)
    tags.map{|tag| /[-](\w+)/.match(tag).try(:[], 1)}.compact
  end

  private
    def self.parse_to_array(tags_string)
      tags = tags_string.split(' ')
    end
end