class NotesController < ApplicationController
  def index
    @notes = 12.times.map do |i|
      ChordExpression::Note.new(i)
    end
  end

  def show
    @note = note_parser.parse
  end

  private

  def note_parser
    ChordExpression::NoteParser.new(params[:name])
  end
end
