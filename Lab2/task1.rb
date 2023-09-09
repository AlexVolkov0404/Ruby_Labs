# frozen_string_literal: true
def area_of_polygon(vertices)
  n = vertices.length
  area = 0.0

  for i in 0...n
    x1, y1 = vertices[i]
    x2, y2 = vertices[(i + 1) % n]
    area += (x1 * y2 - x2 * y1)
  end

  area = (area.abs) / 2.0
  return area
end


vertices = [
  [114, 146], [147, 106], [167, 84], [224, 56], [277, 47],
  [373, 41], [441, 45], [456, 101], [453, 147], [453, 213],
  [425, 245], [382, 270], [330, 273], [290, 248], [300, 199],
  [238, 195], [197, 212], [151, 209], [105, 190], [104, 163]
]


polygon_area = area_of_polygon(vertices)
puts "Площа многокутника: #{polygon_area}"