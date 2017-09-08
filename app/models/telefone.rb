class Telefone < ApplicationRecord
	belongs_to :contato

	validates :numero, :tipo, presence: true
end
