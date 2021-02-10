class PessoasController < ApplicationController

  def index
    render :importar
  end

  def processar
    @response = ImportarService.call params[:arquivo]
    unless @response
      flash[:notice] = 'Extensão inválida'
      render :importar
    else
      flash[:notice] = 'Dados importados com sucesso'
      @pessoas = Pessoa.all.paginate(page: params[:page], per_page: 2)
      render :resumo
    end
  end
end
