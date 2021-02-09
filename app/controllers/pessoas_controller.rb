class PessoasController < ApplicationController

  def importar

  end

  def processar
    if params[:arquivo].present?
      @response = ImportarService.call params[:arquivo]
    else
      # TODO throw exception
    end

    render "resumo"
    
  end
end
