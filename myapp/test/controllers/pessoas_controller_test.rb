require 'test_helper'

class PessoasControllerTest < ActionController::TestCase
    test "o formulario de importacao deve carregar" do
        get :index
        assert_response :success
    end

    test "Fazer upload de arquivo valido" do
        patch = '/files/dados_validos.txt'
        post :create, params: {
          :arquivo => fixture_file_upload(patch, 'text/txt')
        }
        assert_select ".alert", "Dados importados com sucesso"
    end

    test "Fazer upload de extensão inválida" do
        patch = '/files/dados_invalidos.pdf'
        post :create, params: {
          :arquivo => fixture_file_upload(patch, 'text/txt')
        }
        assert_select ".alert", "Extensão inválida"
    end
end