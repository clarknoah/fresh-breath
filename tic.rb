class Tic

	def initialize()
		#Sets default values
		@board=["root"," "," "," "," "," "," "," "," "," "]
		@players=["x","o"]
		@gameOver=nil
		@currentPlayer=nil
	end

	def switchPlayer()
		#switches whos turn it is
			if(@currentPlayer=="o")
				@currentPlayer="x"
			else
				@currentPlayer="o"
			end
	end

	def pickLocation()
		location=0
		puts "pick location!: "
		while(@board[location]!=" ")
			location = gets.to_i
			end
		@board[location]=@currentPlayer
		@allCombos =[@board.values_at(1,2,3),@board.values_at(4,5,6),@board.values_at(7,8,9),@board.values_at(1,4,7),@board.values_at(2,5,8),@board.values_at(3,6,9),@board.values_at(1,5,9),@board.values_at(3,5,7)]
		end

	def pickStarter()
		starter="no one"
		puts "Who will go first? (x or o): "
		while(@players.include?(starter)==false)
				starter = gets.chomp
				if(@players.include?(starter)==false)
					puts "Sorry, gotta put in the right stuff"
				end
			end
		@currentPlayer=starter
		end

	def printBoard()
		puts  @board[1..3].join("|")+"\n------"
		puts  @board[4..6].join("|")+"\n------"
		puts  @board[7..9].join("|")
		end

	def checkBoard()
	@allCombos.each do |combo|
		if(combo.uniq.count==1 and @players.include?(combo.uniq[0]))
			puts "******"
			puts @currentPlayer+"'s win!"
			puts "******"
			@gameOver=combo.uniq
			end
		if(@board.include?" "==false)
			@gameOver=combo.uniq
			puts "Game over, no one won!"
			end
		end
	end

	def startGame()
	pickStarter()
	while @gameOver==nil do
		pickLocation()
		printBoard()
		checkBoard()
		switchPlayer()
		end
	end
end
