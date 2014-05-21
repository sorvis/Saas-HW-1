class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    strategies = %w(R P S)
    raise NoSuchStrategyError, 
      "Strategy must be one of #{strategies.join(",")}" \
      unless strategies.include?(player1[1]) \
      && strategies.include?(player2[1])

      return player2 if player1[1]=="P" && player2[1]=="S"
      return player2 if player1[1]=="R" && player2[1]=="P"
      return player2 if player1[1]=="S" && player2[1]=="R"
      return player1
  end

  def self.tournament_winner(tournament)
    return self.winner(tournament[0], tournament[1]) \
      if tournament.flatten.count == 4
      self.winner(self.tournament_winner(tournament[0]), 
          self.tournament_winner(tournament[1]))
  end

end
