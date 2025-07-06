class ChordModifiersChordsController < ApplicationController
  def index
    @chords = root_notes.map do |root|
      ChordExpression::ChordParser.new(root + params[:chord_modifier_name]).parse
    end
  end

  def show
  end

  private

  def root_notes
    %W[A Asharp B C Csharp D Dsharp E F Fsharp G Gsharp]
  end
end
