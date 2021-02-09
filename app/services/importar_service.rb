class ImportarService < ApplicationService

  def initialize arquivo
    @arquivo = arquivo
  end

  def call
    nome_arquivo = self.salvar_em_disco
    self.salvar_no_banco nome_arquivo
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
    open("#{Rails.root}/public/uploads/#{arquivo}") do |file|
      file.each_with_index do |linha, i|
        next if i == 0
        coluna = linha.split("\t")
        # Comprador	Descrição	Preço Unitário	Quantidade	Endereço	Fornecedor
        Pessoa.create({
                        comprador: coluna[0],
                        descricao: coluna[1],
                        preco: coluna[2].to_f,
                        quantidade: coluna[3].to_f,
                        endereco: coluna[4],
                        fornecedor: coluna[5]
                      })
      end
    end
  end
end
