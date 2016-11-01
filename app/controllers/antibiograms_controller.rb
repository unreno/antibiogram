class AntibiogramsController < ApplicationController
	before_action :set_antibiogram, only: [:show, :edit, :update, :destroy]

	def import
		antibiogram = Antibiogram.import(params[:file])
		redirect_to antibiogram, notice: "Antibiogram imported."
	end

	# GET /antibiograms
	# GET /antibiograms.json
	def index
		@antibiograms = Antibiogram.all
	end

	# GET /antibiograms/1
	# GET /antibiograms/1.json
	def show
	end

	# GET /antibiograms/new
	def new
		@antibiogram = Antibiogram.new
	end

	# GET /antibiograms/1/edit
	def edit
	end

	# POST /antibiograms
	# POST /antibiograms.json
	def create
		@antibiogram = Antibiogram.new(antibiogram_params)

		respond_to do |format|
			if @antibiogram.save
				format.html { redirect_to @antibiogram, notice: 'Antibiogram was successfully created.' }
				format.json { render :show, status: :created, location: @antibiogram }
			else
				format.html { render :new }
				format.json { render json: @antibiogram.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /antibiograms/1
	# PATCH/PUT /antibiograms/1.json
	def update
		respond_to do |format|
			if @antibiogram.update(antibiogram_params)
				format.html { redirect_to @antibiogram, notice: 'Antibiogram was successfully updated.' }
				format.json { render :show, status: :ok, location: @antibiogram }
			else
				format.html { render :edit }
				format.json { render json: @antibiogram.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /antibiograms/1
	# DELETE /antibiograms/1.json
	def destroy
		@antibiogram.destroy
		respond_to do |format|
			format.html { redirect_to antibiograms_url, notice: 'Antibiogram was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_antibiogram
			@antibiogram = Antibiogram.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def antibiogram_params
			params.fetch(:antibiogram, {})
		end
end
