class MultiAgentServicesController < ApplicationController
  before_action :set_multi_agent_service, only: [:edit, :update, :destroy]

  def index
    @multi_agent_services = MultiAgentService.order(created_at: :ASC )
  end

  def new
    @multi_agent_service = MultiAgentService.new
  end

  def create
    @multi_agent_service = MultiAgentService.new(multi_agent_service_params)

    respond_to do |format|
      if @multi_agent_service.save
        format.html { redirect_to multi_agent_services_path, notice: 'Time was successfully calculated.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /multi_agent_services/1
  # PATCH/PUT /multi_agent_services/1.json
  def update
    respond_to do |format|
      if @multi_agent_service.update(multi_agent_service_params)
        format.html { redirect_to multi_agent_services_path, notice: 'Time calculated was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /multi_agent_services/1
  # DELETE /multi_agent_services/1.json
  def destroy
    @multi_agent_service.destroy
    respond_to do |format|
      format.html { redirect_to multi_agent_services_url, notice: 'Multi agent service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_agent_service
      @multi_agent_service = MultiAgentService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multi_agent_service_params
      params.require(:multi_agent_service).permit(:consumers_count, :prosumers_count, :agents_count, :total_time_consumed)
    end
end
