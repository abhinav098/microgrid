class MultiAgentService < ApplicationRecord

  validates :consumers_count, :prosumers_count, :agents_count, presence: true
  before_save :calculate_time_consumed, :determine_grid_kind
  REQUEST_GENERATION_TIME = 10
  INTER_AGENT_PROCESSING_TIME = 5
  RESPONSE_SENDING_TIME = 10

  def render_time
    "(#{REQUEST_GENERATION_TIME} +
     #{INTER_AGENT_PROCESSING_TIME} +
     #{INTER_AGENT_PROCESSING_TIME * agents_count} +
     #{RESPONSE_SENDING_TIME}) x (#{total_load})
     = #{calculate_time_consumed}"
  end

  private

  def total_load
    "#{consumers_count} + #{prosumers_count}"
  end

  def calculate_time_consumed
    agent_count = agents_count + 2
    total_load = consumers_count + prosumers_count
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
