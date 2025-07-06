class NotesController < ApplicationController
  def index
    @notes = 12.times.map do |i|
      ChordExpression::Note.new(i)
    end
  end

  def show
  end
end
