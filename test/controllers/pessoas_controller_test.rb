require 'test_helper'

class PessoasControllerTest < ActionController::TestCase
    test "o formulário de importação deve carregar" do
        get :index
        assert_response :success
    end


end