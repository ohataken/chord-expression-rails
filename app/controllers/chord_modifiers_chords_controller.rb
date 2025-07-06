class ChordModifiersChordsController < ApplicationController
  def index
    @chords = root_notes.map do |root|
      ChordExpression::ChordParser.new(root + params[:chord_modifier_name]).parse
    end
  end

  def show
    @chord = chord_parser.parse
  end

  private

  def root_notes
    %W[A Asharp B C Csharp D Dsharp E F Fsharp G Gsharp]
  end

  def chord_parser
    ChordExpression::ChordParser.new("A#{params[:chord_modifier_name]}")
  end
end
