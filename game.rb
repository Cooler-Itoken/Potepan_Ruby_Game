#最初の案内
puts "最初はグー！じゃんけん"

#Gameクラス
class Game

  #じゃんけん
  def janken
    puts "[0]グー [1]チョキ [2]パー [3]戦わない"
    player_hand = gets.to_i
    computer_hand = rand(3)
    hand_lists = ["グー", "チョキ", "パー"]

    puts "…ポイ！"
    puts "------------------"
    puts "あなたの手:#{hand_lists[player_hand]} \n相手の手:#{hand_lists[computer_hand]}"
    puts "------------------"

    # 指定の値が入力された時
    if (player_hand == 0 && computer_hand == 1) || (player_hand == 1 && computer_hand == 2) || (player_hand == 2 && computer_hand == 0)
      puts "こちらが指を差す側だ"
      @win_or_lose = "win"
      look_this_way
    elsif player_hand == computer_hand
      puts "あいこで..."
      return true
    elsif player_hand == 3
      puts "試合を棄権した。君は意気地なしだ、半端な気持ちで勝負の世界に来るんじゃねえよ"
      exit
    else
      puts "こちらが顔を向ける側だ"
      @win_or_lose = "lose"
      look_this_way
    end
  end

  #あっち向いてホイ
  def look_this_way
    puts "あっち向いて〜…"
    puts "[0]上 [1]右 [2]下 [3]左"

    player_look = gets.to_i
    computer_look = rand(4)
    look_lists = ["上","右","下","左"]

    puts "…フォイ！"
    puts "------------------"
    puts "あなた:#{look_lists[player_look]} \n相手:#{look_lists[computer_look]}"
    puts "------------------"

    # 指定の値が入力された時
    if (player_look == computer_look) && (@win_or_lose == "win")
      puts "あなたの勝ち \nおめでとう〜君は人生の成功者だ（祝福）"
      exit
    elsif (player_look == computer_look) && (@win_or_lose == "lose")
      puts "コンピュータの勝ち \n君は人生の敗者だ、失せろ"
      exit
    else
      puts "じゃんけん…"
      return true
    end
  end

end

#Gameクラスをインスタンス化する
game = Game.new

#ループ処理(あいこ＆引き分け)
next_game = true

while next_game
  next_game = game.janken
end