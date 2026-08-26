# Operação da instância pessoal

Este documento define o que os participantes podem esperar da instância de referência do
ASCEND Gym. Ele não descreve um ambiente de alta disponibilidade.

## Disponibilidade

O serviço roda em um notebook pessoal conectado à rede local do operador. A aplicação pode ficar
indisponível por queda de energia ou internet, reinicialização, manutenção, atualização, falha do
equipamento ou mudança na rede residencial. Não existe SLA, plantão ou prazo garantido de
restabelecimento.

O domínio público termina HTTPS fora da aplicação e encaminha o tráfego por um Cloudflare
Tunnel iniciado no próprio notebook. A porta do app permanece vinculada a `127.0.0.1`.

## Mudanças e manutenção

Deploy e atualização são ações distintas de desenvolver ou publicar código. Antes de alterar a
instância em `/opt/opengym`:

1. confirme o commit, a branch e o estado do working tree remoto;
2. crie e valide um backup local;
3. confirme que a mudança não inclui dados ou credenciais;
4. registre a janela de manutenção para os participantes quando for razoável;
5. execute a atualização com Docker Compose;
6. valide containers, logs, health check, página principal e acesso HTTPS;
7. confirme que os serviços anteriores do notebook continuam saudáveis.

Nunca reinicie o host, remova volumes, execute `docker system prune` ou altere SSH, Tailscale,
firewall e DNS como efeito colateral de um deploy do ASCEND Gym.

## Backup

O diretório `/opt/opengym/data` é a fonte de verdade da instância. Execute:

```bash
sudo /opt/opengym/scripts/backup-local.sh
```

O arquivo resultante contém dados pessoais e pode incluir `data/codex/auth.json`. Guarde-o com
permissão `0600`, em diretório `0700`, e trate-o como uma credencial. A existência de um backup
não prova que a restauração funciona; valide periodicamente o arquivo por nomes e planeje um
teste de restauração isolado. O script valida a integridade do tar antes de publicar o nome final,
mas copia uma aplicação em execução: ele não produz um snapshot transacional entre vários
arquivos. Planeje uma janela de escrita controlada antes de depender dele para migração.

## Recuperação e comunicação

Em uma indisponibilidade, preserve os dados antes de tentar recuperar o serviço. Não prometa um
horário de retorno sem evidência. Informe aos participantes somente o estado confirmado e deixe
claro quando a causa ainda estiver em investigação.

Cada participante deve exportar periodicamente seu JSON pela tela de configurações. Essa cópia
individual reduz a dependência do notebook, sem substituir o backup do servidor.

## Critérios mínimos de saúde

```bash
docker compose ps
curl -fsS http://127.0.0.1:8080/api/health
docker compose logs --tail=200
```

O serviço só deve ser considerado recuperado depois que o health check, a página principal e a
jornada autenticada pelo domínio HTTPS forem confirmados.
