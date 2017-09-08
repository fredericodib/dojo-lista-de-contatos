class ContatosController < ApplicationController

	def index
		@contato = Contato.new
		@contatos = Contato.all
	end

	def create
		@contato = Contato.new(contatos_parametros)
		if @contato.save
			redirect_to root_path, notice: "foi gravado"
		else
			render :index
		end
	end

	private

	def contatos_parametros
		params.require(:contato).permit(:nome, :email, :cargo)
	end
end
