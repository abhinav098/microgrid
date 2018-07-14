class MultiAgentService < ApplicationRecord
  REQUEST_GENERATION_TIME = 10
  INTER_AGENT_PROCESSING_TIME = 5
  RESPONSE_SENDING_TIME = 10

  validates :consumers_count, :prosumers_count, :agents_count, presence: true
  before_save :calculate_time_consumed, :determine_grid_kind

  private

  def calculate_time_consumed
    consumer_count = consumers_count
    prosumer_count = prosumers_count
    agent_count = agents_count + 2
    total_load = (consumer_count + prosumer_count)
    time_for_one_request = REQUEST_GENERATION_TIME + INTER_AGENT_PROCESSING_TIME * agent_count + RESPONSE_SENDING_TIME
    self.total_time_consumed = total_load * time_for_one_request
  end

  def determine_grid_kind
    self.grid_kind = if (prosumers_count >= 100  || consumers_count >= 100)
                        "Large Scale"
                    elsif (prosumers_count >= 50  || consumers_count >= 50)
                        "Medium Scale"
                    else
                        "Small Scale"
                    end
  end

end
