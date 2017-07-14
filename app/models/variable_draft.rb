# :nodoc:
class VariableDraft < Draft
  before_save :set_searchable_fields

  delegate :forms, to: :class

  class << self
    def forms
      []
    end
  end

  def display_entry_title
    entry_title || '<Untitled Variable Record>'
  end

  def set_searchable_fields
    self.short_name = draft['Name']
    self.entry_title = draft['LongName']
  end
end