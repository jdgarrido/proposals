require 'sinatra'
require 'sinatra/activerecord'
require 'json'

class Proposal < ActiveRecord::Base
	def add_vote
		self.votes += 1
		self.save()
	end
end

class Api < Sinatra::Base
	before do
		content_type :json    
		headers 'Access-Control-Allow-Origin' => '*',
				'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST', 'PUT', 'DELETE']
	end

	set :protection, false

	get '/proposals' do
		proposals = Proposal.all
		proposals.to_json
	end

	get '/proposals/:id' do
		proposal = Proposal.find_by_id(params[:id].to_i)
		proposal.to_json
	end

	get '/proposals/:id/add_vote' do
		proposal = Proposal.find_by_id(params[:id].to_i)
		proposal.add_vote
		proposal.to_json
	end
end