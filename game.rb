# Player 
# -will make two objects/varibles as p1 & p2
# -will answer alternate questions -feed input via cmd line
# -will keep the individual scores

# Game
# -will pose questions to two players alternatively. By checking status of player and switching the next player.
# -will evaluate each answer. Check if answer is correct or not
# -will assign/update/check the scores to players in form of lives after every question. Will update each players score and store it in them
# -will announce the winner based on number of lives 


# Questions
# -will create questions object

class Question
  attr_accessor :a, :b, :answer
  def initialize()
    @a = rand(1..20)
    @b = rand(1..20)
    @answer = @a + @b
    
  end
end


class Player
  attr_reader :name
  attr_accessor :score
 
  def initialize(name, score)
  @name = name
  @score = score

  end

  def reduce_life
    @score -= 1
  end
end


class Game

  def initialize()
    @player1 = Player.new('player1', 3)
    @player2 = Player.new('player2', 3)
    @current_player = @player1
    @count = 0

  end
  
  def start 

    while @player1.score > 0 && @player2.score > 0 
      trun
    end
    puts "Good bye!"
  end

  def select_player()
    @count % 2 == 0 ? @player2 : @player1

  end
  
  
  def trun
    
    question = Question.new
    puts "#{@current_player.name}: What does #{question.a} plus #{question.b} equal to?"
    answer = gets.chomp.to_i
    
    def check(question, answer)
      question.answer == answer ? true : false
     # puts "qanw: #{question.answer} qb: #{question.b} "
    end

    # puts "#{check(question, answer)}"
    if check(question, answer)  
      puts "#{@current_player.name}: Yes! you are correct." 
    else
      @current_player.reduce_life 
      puts "#{@current_player.name}: Seriously? No!" 
    end
    
    def winner
      @player1.score < @player2.score ? @player2 : @player1
    end

    if @current_player.score != 0
      puts "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3" 
    else 
      puts "#{winner.name} wins with a score of #{winner.score}/3" 
    end

    @current_player = select_player
    @count += 1
    
  end

end













