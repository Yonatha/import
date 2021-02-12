class PessoasController < ApplicationController

  def index
    render :importar
  end

  def create
    @response = ImportarService.call params[:arquivo]
    unless @response
      flash[:notice] = 'Extensão inválida'
      render :importar
    else
      flash[:notice] = 'Dados importados com sucesso'
      @pessoas = Pessoa.where(:lote => @response[:lote])
                       .paginate(page: params[:page], per_page: 10)
      render :resumo
    end
  end
end
