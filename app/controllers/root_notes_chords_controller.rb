class RootNotesChordsController < ApplicationController
  def index
    @chords = modifier_names.map do |modifier_name|
      ChordExpression::ChordParser.new(params[:root_note_name] + modifier_name).parse
    end
  end

  def show
  end

  private

  def modifier_names
    %W[mmaj7 min7 maj7 dim7 7 min maj aug dim]
  end
end
