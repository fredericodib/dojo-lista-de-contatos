class Contato < ApplicationRecord
	has_many :telefones

	accepts_nested_attributes_for :telefones, reject_if: :all_blank, allow_destroy: true

	validates :nome, :email, :cargo, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email, uniqueness: true
	enum cargo: [:trainee, :membro, :diretor]
	  
end
