require 'rails_helper'
require 'shared/examples_for_note'

RSpec.describe Note, type: :model do
  it_behaves_like 'a Note derivation' # pulls in the shared specs from shared_examples_for_note.rb
end
