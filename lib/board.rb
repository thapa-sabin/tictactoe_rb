module TicTacToe
  class Board
    attr_reader :cells

    GREEN = "\e[32m"
    RED = "\e[31m"
    RESET = "\e[0m"

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
    ].freeze

    # When the board is empty
    def initialize
      @cells = {
        a1: " ", a2: " ", a3: " ",
        b1: " ", b2: " ", b3: " ",
        c1: " ", c2: " ", c3: " "
      }
    end

    def display_board
      puts ""
      puts row_display(:a1, :a2, :a3)
      puts "---+---+---"
      puts row_display(:b1, :b2, :b3)
      puts "---+---+---"
      puts row_display(:c1, :c2, :c3)
      puts ""
    end

    def mark(position, symbol)
      cells[position] = symbol
    end

    def valid_move?(position)
      cells.key?(position) && cells[position] == ""
    end

    def full?
      cells.value.none? { |value| value == "" }
    end

    def winner
      WIN_CONDITIONS.each do |combo|
        values = combo.map { |pos| cells[pos] }
        return values.first if values.uniq.size == 1 && values.first != " "
      end
      nil
    end

    private
    def row_display(p1, p2, p3)
      [p1, p2, p3].map { |pos| colorize(cells[pos]) }.join(" | ")
    end

    def colorize(value)
      case value
      when "X" then "#{GREEN}#{value}#{RESET}"
      when "O" then "#{RED}#{value}#{RESET}"
      else value
      end
    end
  end
end
