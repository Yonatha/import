class ImportarService < ApplicationService

  def initialize arquivo
    @arquivo = arquivo
  end

  def call
    unless self.validateExtensiopn
      return false
    end

    nome_arquivo = self.salvar_em_disco
    response = self.salvar_no_banco nome_arquivo
  end

  def salvar_em_disco
    caminho = "public/uploads/"
    arquivo_nome = "dados_#{Time.now.to_i}.txt"
    caminho = File.join(Rails.root, caminho, arquivo_nome)
    File.open(caminho, "wb") do |f|
      f.write(@arquivo.read)
    end

    arquivo_nome
  end

  def salvar_no_banco arquivo

    response = {
      total: 0,
      receita: 0
    }

    open("#{Rails.root}/public/uploads/#{arquivo}") do |file|
      file.each_with_index do |linha, i|
        next if i == 0
        coluna = linha.split("\t")
        # Comprador	Descrição	Preço Unitário	Quantidade	Endereço	Fornecedor
        pessoa = Pessoa.new
         pessoa.comprador = coluna[0]
         pessoa.descricao = coluna[1]
         pessoa.preco = coluna[2].to_f
         pessoa.quantidade = coluna[3].to_f
         pessoa.endereco = coluna[4]
         pessoa.fornecedor = coluna[5]
         pessoa.save
        response[:total] += 1
        response[:receita] += (pessoa.quantidade * pessoa.preco)
      end
    end
    response
  end

  def validateExtensiopn
    allow_extensions = ['.txt']
    if allow_extensions.include? File.extname(@arquivo.original_filename)
      true
    end
  end
end
