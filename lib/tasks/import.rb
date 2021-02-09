file = '/home/yonatha-a-almeida/projetos/nama/public/dados.txt'

open(file) do |file|
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
