class Graphics::Keyboards::ChordsController < ApplicationController
  def show
    svg = Victor::SVG.new viewBox: view_box

    svg.rect x: white_key_rect_x(0), y: white_key_rect_y(0), width: white_key_width, height: white_key_height, fill: :white, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: white_key_rect_x(1), y: white_key_rect_y(1), width: white_key_width, height: white_key_height, fill: :white, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: white_key_rect_x(2), y: white_key_rect_y(2), width: white_key_width, height: white_key_height, fill: :white, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: white_key_rect_x(3), y: white_key_rect_y(3), width: white_key_width, height: white_key_height, fill: :white, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: white_key_rect_x(4), y: white_key_rect_y(4), width: white_key_width, height: white_key_height, fill: :white, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: white_key_rect_x(5), y: white_key_rect_y(5), width: white_key_width, height: white_key_height, fill: :white, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: white_key_rect_x(6), y: white_key_rect_y(6), width: white_key_width, height: white_key_height, fill: :white, stroke: stroke_color, 'stroke-width': 1

    svg.rect x: black_key_rect_x(0), y: black_key_rect_y(0), width: black_key_width, height: black_key_height, fill: fill_color, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: black_key_rect_x(1), y: black_key_rect_y(1), width: black_key_width, height: black_key_height, fill: fill_color, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: black_key_rect_x(3), y: black_key_rect_y(3), width: black_key_width, height: black_key_height, fill: fill_color, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: black_key_rect_x(4), y: black_key_rect_y(4), width: black_key_width, height: black_key_height, fill: fill_color, stroke: stroke_color, 'stroke-width': 1
    svg.rect x: black_key_rect_x(5), y: black_key_rect_y(5), width: black_key_width, height: black_key_height, fill: fill_color, stroke: stroke_color, 'stroke-width': 1

    svg.circle cx: white_key_rect_x(0) + white_key_width / 2, cy: white_key_rect_y(0) + white_key_height / 5 * 4, r: 10, fill: fill_color if has_chord_tone? 3

    svg.circle cx: black_key_rect_x(0) + black_key_width / 2, cy: black_key_rect_y(0) + black_key_height / 5 * 4, r: 8, fill: :white, stroke: stroke_color, 'stroke-width': 1 if has_chord_tone? 4

    svg.circle cx: white_key_rect_x(1) + white_key_width / 2, cy: white_key_rect_y(1) + white_key_height / 5 * 4, r: 10, fill: fill_color if has_chord_tone? 5

    svg.circle cx: black_key_rect_x(1) + black_key_width / 2, cy: black_key_rect_y(1) + black_key_height / 5 * 4, r: 8, fill: :white, stroke: stroke_color, 'stroke-width': 1 if has_chord_tone? 6

    svg.circle cx: white_key_rect_x(2) + white_key_width / 2, cy: white_key_rect_y(2) + white_key_height / 5 * 4, r: 10, fill: fill_color if has_chord_tone? 7

    svg.circle cx: white_key_rect_x(3) + white_key_width / 2, cy: white_key_rect_y(3) + white_key_height / 5 * 4, r: 10, fill: fill_color if has_chord_tone? 8

    svg.circle cx: black_key_rect_x(3) + black_key_width / 2, cy: black_key_rect_y(3) + black_key_height / 5 * 4, r: 8, fill: :white, stroke: stroke_color, 'stroke-width': 1 if has_chord_tone? 9

    svg.circle cx: white_key_rect_x(4) + white_key_width / 2, cy: white_key_rect_y(4) + white_key_height / 5 * 4, r: 10, fill: fill_color if has_chord_tone? 10

    svg.circle cx: black_key_rect_x(4) + black_key_width / 2, cy: black_key_rect_y(4) + black_key_height / 5 * 4, r: 8, fill: :white, stroke: stroke_color, 'stroke-width': 1 if has_chord_tone? 11

    svg.circle cx: white_key_rect_x(5) + white_key_width / 2, cy: white_key_rect_y(5) + white_key_height / 5 * 4, r: 10, fill: fill_color if has_chord_tone? 0

    svg.circle cx: black_key_rect_x(5) + black_key_width / 2, cy: black_key_rect_y(5) + black_key_height / 5 * 4, r: 8, fill: :white, stroke: stroke_color, 'stroke-width': 1 if has_chord_tone? 1

    svg.circle cx: white_key_rect_x(6) + white_key_width / 2, cy: white_key_rect_y(6) + white_key_height / 5 * 4, r: 10, fill: fill_color if has_chord_tone? 2

    render inline: svg.render
  end

  private

  def chord_parser
    ChordExpression::ChordParser.new(params[:name])
  end

  def build_chord_tones
    chord = chord_parser.parse

    @tones = []
    @tones << chord.root_note
    @tones << chord.third if chord.third
    @tones << chord.fifth
    @tones << chord.seventh if chord.seventh?
    @tones
  end

  def chord_tones
    @tones ||= build_chord_tones
  end

  def has_chord_tone?(value)
    chord_tones.find { |tone| tone.value == value }
  end

  def svg_width
    240
  end

  def svg_height
    120
  end

  def view_box
    "0 0 #{svg_width} #{svg_height}"
  end

  def stroke_color
    "hsl(221deg, 14%, 21%)"
  end

  def fill_color
    "hsl(221deg, 14%, 21%)"
  end

  def white_key_width
    34
  end

  def white_key_height
    80
  end

  def black_key_width
    20
  end

  def black_key_height
    50
  end

  def white_key_rect_x(i)
    1 + (i * white_key_width)
  end

  def white_key_rect_y(i)
    1
  end

  def black_key_rect_x(i)
    8 + (i * white_key_width) + white_key_width / 2
  end

  def black_key_rect_y(i)
    1
  end
end
