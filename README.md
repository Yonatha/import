# Ferramenta de importação .txt

## Requisitos

* Ruby 2.2+
* Rails 5.x
* SQLite

## Instalação

1 - Efetue o clone do projeto
```
git clone https://github.com/Yonatha/import.git
```

2 - Acesse o diretório clonado
```
cd import
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

```
rake
```

## TODO
* Finalizar os testes da importação
* Fazer testes do model
* Implementar a mecânica de detecção de linhas inválidas e gerar um arquivo de saída contendo os registros que não podem ser importados, afim de que sejam corrigidos e reimportados na ferramenta
* Adicionar o sidekiq para realizar o processamento em um worker 
* Criar o docker-compose para facilitar a execução do projeto sem a necessidade do usuário ter as versões do ruby e rails instaladas no hospedeiro, mas com uma resalva do requisito de ter apenas o docker instalado
* Adicionar busca na view do lote de registros improtado