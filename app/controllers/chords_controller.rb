class ChordsController < ApplicationController
  def show
    @chord = chord_parser.parse
  end

  private

  def chord_parser
    ChordExpression::ChordParser.new(params[:name])
  end
end
