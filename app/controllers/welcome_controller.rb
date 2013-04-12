class WelcomeController < ApplicationController
	def index
	  @result = ''
	end
	def calculate
		if params[:o] == '+'
			op = 1
		elsif params[:o] == '-'
			op = 2
		elsif params[:o] == '*'
			op = 3
		elsif params[:o] == '/'
			op = 4
		elsif params[:o] == 'potenz'
			op = 5
		elsif params[:o] == 'wurzel'
			op = 6
		end

		if params[:f] == '' && params[:s] == '' && op != 6
			@result = 'Zahlen fehlen'
		elsif params[:f] == '' && op != 6
			@result = 'Zahl1 fehlt'
		elsif params[:f] == '' && op == 6
			@result = 'Zahl1 fehlt fuer Wurzel'
		elsif params[:s] == '' && op != 6
			@result = 'Zahl2 fehlt'
		elsif params[:s] != '' && op == 6
			@result = 'Zahl2 zuviel fuer Wurzel'
		else
			case op
				when 1	#addieren
					@result = params[:f].to_f + params[:s].to_f
				when 2	#subtrahieren
					@result = params[:f].to_f - params[:s].to_f
				when 3	#multiplizieren
					@result = params[:f].to_f * params[:s].to_f
				when 4	#dividieren
					zahl = params[:s].to_f
					if zahl == 0
						@result = "Division null geht nicht"
					else
						@result = params[:f].to_f / params[:s].to_f
					end
				when 5 #potenzieren
					@result = params[:f].to_f ** params[:s].to_f
				when 6 #wurzel ziehen
					@result = Math.sqrt(params[:f].to_f)
				else
					@result = 'kein Operator gewaehlt'
			end
			@result = @result.round(2)
		end
	  render :action => :index
	end
end