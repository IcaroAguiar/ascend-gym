# ASCEND Gym

ASCEND Gym é uma distribuição personalizada e self-hosted do openGym. O projeto acompanha
treinos, rotinas, peso corporal e progressão, oferece autenticação por passkey e inclui um AI
Coach opcional. Esta base será desenvolvida em etapas para atender primeiro ao uso real do seu
operador e dos participantes da beta.

> **Estado atual:** beta privada, sem garantia de disponibilidade. A instância de referência roda
> em um notebook pessoal conectado a uma rede residencial. Energia, internet, manutenção e o
> próprio uso do equipamento podem interromper o serviço. Não existe SLA.

[![License: AGPL v3](https://img.shields.io/badge/license-AGPL--3.0-a3e635?style=flat-square)](LICENSE)
![Self-hosted](https://img.shields.io/badge/self--hosted-best--effort-60a5fa?style=flat-square)
![React](https://img.shields.io/badge/React-19-38bdf8?style=flat-square&logo=react&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-compose-2496ED?style=flat-square&logo=docker&logoColor=white)

## Origem e licença

O ASCEND Gym preserva o histórico e os avisos do openGym, criado por Duarte Santos, e parte do
fork [`alexpcosta/opengym`](https://github.com/alexpcosta/opengym), que acrescentou o AI Coach.
As modificações do ASCEND Gym continuam sob a GNU AGPL v3.0.

Este repositório mantém a linha de desenvolvimento. Cada deploy deve definir `SOURCE_CODE_URL`
com a URL imutável do commit ou da tag correspondente e expor esse link na tela de configurações.
Dados dos usuários, passkeys, tokens, configurações privadas do host e backups não fazem parte do
código-fonte e nunca devem ser versionados. Consulte [LICENSE](LICENSE) e [NOTICE.md](NOTICE.md).

O estado observado na instância antes da primeira baseline do ASCEND Gym está preservado na tag
[`deployed-2026-08-26`](https://github.com/IcaroAguiar/ascend-gym/tree/deployed-2026-08-26).

## Disponibilidade da instância de referência

A instância atual é operada como um serviço pessoal de melhor esforço:

- roda em um notebook na rede local do operador;
- depende da energia e da internet da residência;
- pode ficar indisponível durante manutenção, reinicializações e atualizações;
- não oferece suporte ou recuperação com prazo garantido;
- mantém a porta do app restrita ao host e usa um túnel de saída para HTTPS.

Participantes devem exportar periodicamente seus próprios dados. O operador mantém backups
locais, mas não promete recuperação em qualquer prazo. A política operacional completa está em
[docs/OPERATIONS.md](docs/OPERATIONS.md).

## Funcionalidades herdadas

- rotinas semanais e treino guiado;
- registro de séries, repetições, carga, esforço e cardio;
- histórico, gráficos, mapa muscular e estimativa de 1RM;
- progressão linear, Greyskull e progressão dupla;
- passkeys, perfis separados e sincronização entre dispositivos;
- importação, exportação e compartilhamento de planos;
- PWA instalável e suporte a múltiplos idiomas;
- AI Coach opcional para criação e revisão de planos.

O [guia do AI Coach](docs/AI_COACH.md) explica quais dados podem sair do servidor e como cada
perfil consente. A conta do provedor pertence ao operador da instância. Antes de abrir o Coach a
terceiros, o operador deve confirmar que esse uso respeita os termos do provedor.

## Executar localmente

Requisitos: Docker Engine e Docker Compose v2.

```bash
git clone https://github.com/IcaroAguiar/ascend-gym.git
cd ascend-gym
cp .env.example .env
docker compose up -d --build
```

Acesse `http://localhost:8080`. O primeiro início baixa as mídias de exercícios para `./media`.
Esses arquivos não são versionados e possuem termos próprios; leia [NOTICE.md](NOTICE.md).

Para verificar a aplicação:

```bash
docker compose ps
curl -fsS http://localhost:8080/api/health
```

O Compose publica a interface apenas em `127.0.0.1` por padrão. Acesso por celular com passkey
exige um hostname HTTPS definitivo. Consulte [docs/SELF_HOSTING.md](docs/SELF_HOSTING.md).

## Dados e credenciais

O diretório `./data` guarda perfis, passkeys públicas, históricos, pesos, preferências, segredo
de sessão e chaves de notificações. O cache privado do Codex fica em `./data/codex`.

Não execute `cat`, não registre em logs e não copie para issues nenhum destes arquivos:

- `data/db.json`;
- `data/secret`;
- `data/vapid.json`;
- `data/state-*.json`;
- `data/codex/auth.json`;
- arquivos em `backups/` ou `cloudflared/`.

O script `scripts/backup-local.sh` cria um arquivo local com permissões restritas. Como o backup
pode conter a credencial do provedor, trate-o como segredo e prefira criptografá-lo antes de
qualquer cópia externa.

## Privacidade da beta

Treinos, peso corporal, limitações e dados enviados ao Coach podem constituir dados pessoais
sensíveis. O rascunho do aviso da beta está em [docs/PRIVACY.md](docs/PRIVACY.md). Sua publicação
no repositório não substitui o fluxo de ciência e consentimento dentro do produto.

O cadastro público continuará bloqueado até a conclusão de
[docs/PUBLIC_LAUNCH_CHECKLIST.md](docs/PUBLIC_LAUNCH_CHECKLIST.md).

## Desenvolvimento

```bash
cd frontend
npm ci
npm test
npm run build

cd ../api
npm test
```

O frontend usa React, Vite, React Router e Zustand. A API usa Node sem framework e persiste o
estado em arquivos JSON. Leia [CONTRIBUTING.md](CONTRIBUTING.md) e [AGENTS.md](AGENTS.md) antes
de modificar o projeto.

## Publicação

Os workflows de imagens Docker e GitHub Pages são exclusivamente manuais. Um push para `main`
roda os testes, mas não publica artefatos nem altera a instância hospedada. Deploy, migração de
dados e divulgação exigem decisões separadas.

## Limites atuais

- a instância pessoal não tem alta disponibilidade;
- o armazenamento em JSON atende à beta, sem promessa de escala pública;
- o uso multiusuário do AI Coach depende dos termos do provedor;
- as imagens e animações exigem revisão de direitos antes de redistribuição pública;
- `ASCEND Gym` é uma identidade de trabalho dentro do domínio ASCEND, sem alegação de registro
  de marca.

## Créditos

- openGym: Duarte Santos;
- fork com AI Coach: [`alexpcosta/opengym`](https://github.com/alexpcosta/opengym);
- geometria corporal: MuscleMap, sob MIT;
- dados e mídias de exercícios: `hasaneyldrm/exercises-dataset`, sujeitos aos avisos próprios.

Consulte [NOTICE.md](NOTICE.md) para a atribuição completa.
