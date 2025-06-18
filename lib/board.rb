# Pre-define the winning conditions
WIN_CONDITIONS = [
  # Rows
  [:a1, :a2, :a3],
  [:b1, :b2, :b3],
  [:c1, :c2, :c3],
  # Columns
  [:a1, :b1, :c1],
  [:a2, :b2, :c2],
  [:a3, :b3, :c3],
  # Diagonals
  [:a1, :b2, :c3],
  [:a3, :b2, :c1]
]

# When the board is empty
def empty_board
  {
    a1: " ", a2: " ", a3: " ",
    b1: " ", b2: " ", b3: " ",
    c1: " ", c2: " ", c3: " "
  }
end

