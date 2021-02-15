# Ferramenta de importação .txt

Raliza importação de arquivo de texto (.txt) separados por TAB (\t).


## Preview
* Tela do formulário de importação do arquivo
![alt text](tela1.png "Formulário de importação do arquivo")

* Tela de resumo dos arquivos importados
![alt text](tela2.png "Formulário de importação do arquivo")

## Executando o Projeto

1 - Efetue o clone do projeto


### Execução com docker
> Observação: Caso tenha o docker-compose configurado em sua maquina basta executar

```
git clone https://github.com/Yonatha/import.git

cd import/
docker-compose up -d
docker exec myApp rake db:setup
```

### Execução sem docker

> Requisitos

* Ruby 2.2+
* Rails 5.x
* SQLite

2 - Acesse o diretório clonado
```
cd import/myapp
```

3 - Execute a task de instalação do sistema
```
rake db:setup
```

4 - Execute o servidor da aplicação

```
rails s
```

5 - Acesse

```
http://localhost:3000
```

## Teste

Antes de executar o teste certifique-se de rodar os migrations no environment de test   
```
rails db:migrate RAILS_ENV=test
```

Execute os testes com o comando:
```
rake
```

ou via docker
```
docker exec myApp rake RAILS_ENV=test
```

## TODO
* Implementar a mecânica de detecção de linhas inválidas e gerar um arquivo de saída contendo os registros que não podem ser importados, afim de que sejam corrigidos e reimportados na ferramenta
* Adicionar o sidekiq para realizar o processamento em um worker 
* Adicionar busca na view do lote de registros improtado
* Permitir arquivos separados por ponto e virgula (;)