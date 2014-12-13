class Dashboard::MessagesController < Dashboard::BaseController
  before_action :set_dashboard_message, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  # GET /dashboard/messages
  # GET /dashboard/messages.json
  def index
    @dashboard_messages = Message.all
  end

  # GET /dashboard/messages/1
  # GET /dashboard/messages/1.json
  def show
  end

  # GET /dashboard/messages/new
  def new
    @dashboard_message = Dashboard::Message.new
  end

  # GET /dashboard/messages/1/edit
  def edit
  end

  # POST /dashboard/messages
  # POST /dashboard/messages.json
  def create
    @dashboard_message = Dashboard::Message.new(dashboard_message_params)

    respond_to do |format|
      if @dashboard_message.save
        format.html { redirect_to @dashboard_message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard_message }
      else
        format.html { render :new }
        format.json { render json: @dashboard_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/messages/1
  # PATCH/PUT /dashboard/messages/1.json
  def update
    respond_to do |format|
      if @dashboard_message.update(dashboard_message_params)
        format.html { redirect_to @dashboard_message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard_message }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/messages/1
  # DELETE /dashboard/messages/1.json
  def destroy
    @dashboard_message.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_message
      @dashboard_message = Dashboard::Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_message_params
      params[:dashboard_message]
    end
end
