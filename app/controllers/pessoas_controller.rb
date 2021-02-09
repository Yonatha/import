class PessoasController < ApplicationController

  def importar

  end

  def processar
    if params[:arquivo].present?
      ImportarService.call params[:arquivo]
    else
      # TODO lançar exception
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Operação realizada com sucesso' }
    end
  end
end
