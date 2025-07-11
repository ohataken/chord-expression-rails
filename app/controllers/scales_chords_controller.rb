class ScalesChordsController < ApplicationController
  def index
    @scale = scale_parser.parse
    @root_note = @scale.i_root_note
  end

  private

  def scale_parser
    ChordExpression::ScaleParser.new(params[:scale_name])
  end
end
