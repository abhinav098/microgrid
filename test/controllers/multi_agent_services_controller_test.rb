require 'test_helper'

class MultiAgentServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multi_agent_service = multi_agent_services(:one)
  end

  test "should get index" do
    get multi_agent_services_url
    assert_response :success
  end

  test "should get new" do
    get new_multi_agent_service_url
    assert_response :success
  end

  test "should create multi_agent_service" do
    assert_difference('MultiAgentService.count') do
      post multi_agent_services_url, params: { multi_agent_service: { agents_count: @multi_agent_service.agents_count, consumers_count: @multi_agent_service.consumers_count, prosumers_count: @multi_agent_service.prosumers_count, total_time_consumed: @multi_agent_service.total_time_consumed } }
    end

    assert_redirected_to multi_agent_service_url(MultiAgentService.last)
  end

  test "should show multi_agent_service" do
    get multi_agent_service_url(@multi_agent_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_multi_agent_service_url(@multi_agent_service)
    assert_response :success
  end

  test "should update multi_agent_service" do
    patch multi_agent_service_url(@multi_agent_service), params: { multi_agent_service: { agents_count: @multi_agent_service.agents_count, consumers_count: @multi_agent_service.consumers_count, prosumers_count: @multi_agent_service.prosumers_count, total_time_consumed: @multi_agent_service.total_time_consumed } }
    assert_redirected_to multi_agent_service_url(@multi_agent_service)
  end

  test "should destroy multi_agent_service" do
    assert_difference('MultiAgentService.count', -1) do
      delete multi_agent_service_url(@multi_agent_service)
    end

    assert_redirected_to multi_agent_services_url
  end
end
