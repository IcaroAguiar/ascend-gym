# Estrutura e remotes do repositório

O ASCEND Gym preserva o histórico recebido e mantém duas relações explícitas:

- `origin`: `https://github.com/IcaroAguiar/ascend-gym.git`, repositório canônico;
- `upstream-ai`: `https://github.com/alexpcosta/opengym.git`, base que adicionou o AI Coach.

O repositório original de Duarte Santos não estava acessível quando esta distribuição foi
criada. O histórico Git e os avisos de autoria foram preservados.

A tag `deployed-2026-08-26` preserva o código e a configuração versionável que foram observados
na instância pessoal antes do primeiro commit do ASCEND Gym. Ela não contém `.env`, dados,
backups ou credenciais.

## Atualizar a referência do upstream

Um clone novo recebe apenas `origin`. Adicione a referência antes da primeira comparação:

```bash
git remote add upstream-ai https://github.com/alexpcosta/opengym.git
```

Depois, inspecione a divergência:

```bash
git fetch upstream-ai
git log --oneline --left-right main...upstream-ai/main
git diff --stat main...upstream-ai/main
```

Não faça merge automático. Revise licença, migrações, Docker, autenticação, persistência e AI
Coach. Atualizar o repositório não autoriza deploy na instância pessoal.

## Branches e releases

`main` deve permanecer verificável. Trabalho de produto entra por branches e pull requests. Uma
tag ou imagem publicada é uma ação de release independente; os workflows correspondentes exigem
execução manual.

Cada deploy deve registrar o commit usado. Configurações privadas, dados e credenciais permanecem
somente no host.
