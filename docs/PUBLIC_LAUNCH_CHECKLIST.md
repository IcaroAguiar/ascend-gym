# Checklist para abertura pública

O repositório pode ser público enquanto a instância permanece em beta por convite. A divulgação
com cadastro aberto só deve ocorrer quando todos os bloqueadores abaixo estiverem resolvidos.

## Código e licença

- [ ] O app implantado aponta para o commit ou a tag imutável em “Código-fonte”.
- [ ] O commit implantado está identificado e o código correspondente pode ser obtido.
- [ ] `LICENSE`, `NOTICE.md`, créditos e avisos de modificação estão preservados.
- [ ] Nenhum dado, backup, `.env`, credencial do Codex ou arquivo do Tunnel foi versionado.

## Privacidade

- [ ] Existe um aviso de privacidade revisado e apresentado dentro do produto.
- [ ] Existe um canal privado para solicitações dos titulares.
- [ ] Bases legais, retenção, exclusão e restauração de backups foram definidas.
- [ ] O fluxo de exclusão remove conta, estado e dados do Coach conforme informado.
- [ ] Provedores, subprocessadores e transferências internacionais estão documentados.
- [ ] Existe um procedimento de resposta a incidente.

## AI Coach

- [ ] O modelo de conta do provedor foi validado para múltiplos usuários.
- [ ] O uso da conta pessoal do operador por terceiros foi eliminado ou autorizado pelo provedor.
- [ ] Limites por usuário e por instância estão configurados.
- [ ] O consentimento identifica o provedor e as categorias enviadas.

## Conteúdo e marca

- [ ] As imagens e animações foram licenciadas ou substituídas.
- [ ] As atribuições da Gym Visual e do dataset estão corretas.
- [ ] O nome foi pesquisado no INPI antes de investimento comercial ou registro em lojas.
- [ ] A divulgação descreve o ASCEND Gym como versão modificada do openGym.

## Operação

- [ ] A disponibilidade best-effort e a ausência de SLA aparecem na apresentação pública.
- [ ] Cadastro por convite permanece ativo enquanto o ambiente for uma beta controlada.
- [ ] Dependências de runtime foram auditadas e cada alerta foi corrigido ou teve sua não aplicabilidade comprovada.
- [ ] Backup e restauração foram testados sem tocar na instância principal.
- [ ] Existe um procedimento de atualização, rollback e comunicação de downtime.
- [ ] O domínio HTTPS, as passkeys e a jornada autenticada foram validados depois do último deploy.
