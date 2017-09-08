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

	def destroy
		@contato = Contato.find(params[:id])
		@contato.delete
		redirect_to root_path
	end

	private

	def contatos_parametros
		params.require(:contato).permit(:nome, :email, :cargo, telefones_attributes: [:id, :numero, :tipo, :_destroy])
	end
end
