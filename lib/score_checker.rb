# frozen_string_literal: true

# TODO: This should be refactored into a class
class ScoreChecker

  def initialize(player, dealer, turn)
    @player = player
    @dealer = dealer
    @turn = turn
  end

  def winner
    if player_won?
      'Player'
    elsif dealer_won?
      'Dealer'
    elsif both_busted?
      'None'
    elsif tied?
      'Push' if @turn == 1
      'Tie'
    end
  end

  def player_won?
    @dealer.did_bust? && @player.current_score >= 17 ||
      !@player.did_bust? && @player.current_score > @dealer.current_score && !@dealer.can_draw? ||
      @player.current_score == 21 && @dealer.current_score != 21 && @turn == 1
  end

  def dealer_won?
    @player.did_bust? && !@dealer.did_bust? ||
      !@dealer.did_bust? && @dealer.current_score > @player.current_score && !@player.can_draw?
  end

  def both_busted?
    @dealer.did_bust? && @player.did_bust?
  end

  def tied?
    @player.current_score == @dealer.current_score &&
      !@player.can_draw? && !@dealer.can_draw?
  end

end
