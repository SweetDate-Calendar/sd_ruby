class PaddleClubsController < ApplicationController
  before_action :set_paddle_club, only: %i[ show edit update destroy ]

  # GET /paddle_clubs or /paddle_clubs.json
  def index
    @paddle_clubs = PaddleClub.all
  end

  # GET /paddle_clubs/1 or /paddle_clubs/1.json
  def show
  end

  # GET /paddle_clubs/new
  def new
    @paddle_club = PaddleClub.new
  end

  # GET /paddle_clubs/1/edit
  def edit
  end

  # POST /paddle_clubs or /paddle_clubs.json
  # def create
  #   @paddle_club = PaddleClub.new(paddle_club_params)

  #   respond_to do |format|
  #     if @paddle_club.save
  #       format.html { redirect_to @paddle_club, notice: "Paddle club was successfully created." }
  #       format.json { render :show, status: :created, location: @paddle_club }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @paddle_club.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def create
    # Step 1: Build (but don't save) the PaddleClub
    @paddle_club = PaddleClub.new(paddle_club_params)

    # Step 2: Validate it first
    if @paddle_club.valid?
      # Step 3: Attempt to create the SweetDate tier
      ap @paddle_club
      result = SweetDate.create_tier(@paddle_club.name )
      ap result

      if result["status"] == "ok"
        @paddle_club.tier_id = result["id"] || result["message"] # adjust based on your response
      else
        @paddle_club.errors.add(:tier_id, "could not be created in SweetDate: #{result["message"]}")
      end
    end

    # Step 4: Save if valid, or re-render with errors
    respond_to do |format|
      if @paddle_club.errors.any? || !@paddle_club.save
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paddle_club.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to @paddle_club, notice: "Paddle club was successfully created." }
        format.json { render :show, status: :created, location: @paddle_club }
      end
    end
  end

  # PATCH/PUT /paddle_clubs/1 or /paddle_clubs/1.json
  def update
    respond_to do |format|
      if @paddle_club.update(paddle_club_params)
        format.html { redirect_to @paddle_club, notice: "Paddle club was successfully updated." }
        format.json { render :show, status: :ok, location: @paddle_club }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paddle_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paddle_clubs/1 or /paddle_clubs/1.json
  def destroy
    @paddle_club.destroy!

    respond_to do |format|
      format.html { redirect_to paddle_clubs_path, status: :see_other, notice: "Paddle club was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paddle_club
      @paddle_club = PaddleClub.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def paddle_club_params
      params.expect(paddle_club: [ :name, :tier_id ])
    end
end
