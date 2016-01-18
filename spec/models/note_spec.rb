require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { Note.new(text: 'just a note') }
end
