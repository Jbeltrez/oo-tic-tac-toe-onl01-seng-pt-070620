require 'pry'
class TicTacToe 
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
    
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end#prints current board representation based on the @board instance variable 
  
  def input_to_index(user_input)
    user_input.to_i - 1 
  end 
  
  def move(index, token = "X")
    @board[index] = token 
  end 
  
  def position_taken?(index)
    @board[index] != " " 
  end 
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end 
  
  def turn_count
    
    @board.count {|token| token  == "X" || token == "O"}
  end 
  
  def current_player 
    if turn_count % 2 == 0 
      "X"
    else 
      "O"
    end 
  end 
  
  def turn
    puts "Enter a number between 1-9"
    input = gets.chomp
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
        display_board
    else 
      turn 
    end 
  end 
    # ask for input get input translate input into index if index is valid make the move for index show the board else ask for input again end
  def won?
    # if there is a winning combo on my board it should be in my constant 
    #look at my board, see if there is a winning combo
    # return f/nil if no win combo is present at all 
    #return winning combo as an array if there is a win
    #ennumerate over constant, see if that is present and return it 
     if @board.include?(WIN_COMBINATIONS)
       nil
      else WIN_COMBINATIONS.find do |winner|
       @board[winner[0]] == @board[winner[1]] &&
       @board[winner[0]] == @board
     end 
   end 
     
 
  end 
  
  
  
end 