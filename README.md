# Teste de Login em Ruby on Rails

Projeto construído para a disciplina de Segurança e Auditoria, do curso de Tecnologia em Sistemas para Internet do IFRS Porto Alegre, sob orientação do professor André Peres.

O enunciado do exercício era: "Pesquise e implemente um sistema simples composto de um mecanismo de autenticação (senha de usuário) e que armazene uma informação sensível de usuário em um banco de dados".

Foi criada uma aplicação em Ruby on Rails com dois scaffolds (conjunto de tabela no banco de dados PostgreSQL, model, controller e view). O primeiro scaffold, InsecureUsers, é um CRUD de com os campos login, password (ambos strings) e bio (um campo de texto). A única alteração relevante no campo foi transformar o formulário de criação do InsecureUser para o tipo password. Com esta estrutura, verificou-se que o Rails:

* Não permite gravar dados no BD via GET (pelo menos não com as configurações padrões para um CRUD)

* Gravou o campo password aberto no banco de dados.

* O Active Record impede que se faça SQL Injection, mas permitiu que querys sejam gravadas no campo login como string, o que pode gerar problemas futuros ao manusear o banco de dados

* O Active Record permite que se grave no banco comandos em HTML, transformanod tags em strings. Mas, dependendo do uso que se faça destes dados, é possível que estes comandos gerem problemas para a aplicação em determinadas circunstâncias.

Para corrigir estes três problemas, criou-se o scaffold SecureUsers:

* Através do método has_secure_password e da gem BCrypt foi implementada a gravação de senhas criptografadas no banco de dados.

* Foi implementada uma validação no campo login para permitir apenas nome de usuários com números e letras, eliminando os riscos de injection.

* Através da implementação do módulo SanitizeHelper foi possível eliminar do campo bio o uso de comandos em HTML, impedindo a tentativa de inserir scripts na aplicação via formulário.
