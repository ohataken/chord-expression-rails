class ScalesChordsController < ApplicationController
  def index
    @root_note = note_parser.parse
    @scale = ChordExpression::Scale.new(@root_note)
  end

  private

  def note_parser
    ChordExpression::NoteParser.new(params[:scale_name])
  end
end
