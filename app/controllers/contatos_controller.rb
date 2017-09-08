class ContatosController < ApplicationController

	def index
		@contato = Contato.new
		@contatos = Contato.all.order(:nome)
	end

	def create
		@contatos = Contato.all.order(:nome)
		@contato = Contato.new(contatos_parametros)
		
		if @contato.save
			render :create_success
		else
			render :create_error
		end
	end

	def show
		@contato = Contato.find(params[:id])
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
