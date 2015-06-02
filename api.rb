require 'sinatra'
require 'sinatra/activerecord'
require 'json'

class Proposal < ActiveRecord::Base
	def add_vote
		self.votes += 1
	end
end

class Api < Sinatra::Base
	before do
		content_type :json
	end

	get '/proposals' do
		proposals = Proposal.all
		proposals.to_json
	end

	get '/proposals/:id' do
		proposal = Proposal.find_by_id(params[:id].to_i)
		proposal.to_json
	end

	get '/proposals/:id/add' do
		proposal = Proposal.find_by_id(params[:id].to_i)
		proposal.add_vote
		# p proposal.votes
		# proposal.votes += 1
		# proposal.save()
	end
end