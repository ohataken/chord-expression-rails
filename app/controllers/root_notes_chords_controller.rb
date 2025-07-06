class RootNotesChordsController < ApplicationController
  def index
    @chord = chord_parser.parse
    @chords = modifier_names.map do |modifier_name|
      ChordExpression::ChordParser.new(params[:root_note_name] + modifier_name).parse
    end
  end

  def show
    @chord = chord_parser.parse
  end

  private

  def modifier_names
    %W[mmaj7 min7 maj7 dim7 7 min maj aug dim]
  end

  def chord_parser
    ChordExpression::ChordParser.new(params[:root_note_name])
  end
end
