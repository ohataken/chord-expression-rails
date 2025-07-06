class RootNotesController < ApplicationController
  def index
    @notes = 12.times.map do |i|
      ChordExpression::Note.new(i)
    end
  end
end
