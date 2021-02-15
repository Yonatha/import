class PessoasController < ApplicationController

  def index
    render :index
  end

  def create
    @response = ImportarService.call params[:arquivo]
    unless @response
      flash[:notice] = 'Extensão inválida'
      render :index
    else
      flash[:notice] = 'Dados importados com sucesso'
      @pessoas = Pessoa.where(:lote => @response[:lote])
                       .order('preco DESC')

      render :show
    end
  end
end
