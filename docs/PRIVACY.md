# Rascunho do aviso de privacidade da beta

Este documento registra o tratamento de dados previsto para a beta privada do ASCEND Gym. Ele
deve ser revisado e apresentado dentro do produto antes da abertura pública do cadastro.

## Responsável

A instância é operada por Ícaro Aguiar como projeto pessoal. Durante a beta por convite, pedidos
de acesso, correção, exportação ou exclusão devem usar o mesmo canal privado pelo qual o convite
foi enviado. Um canal dedicado de privacidade é requisito para a abertura pública.

## Dados tratados

O ASCEND Gym pode armazenar:

- nome de exibição e identificador interno;
- credencial pública da passkey e informações necessárias à autenticação;
- rotinas, exercícios, séries, repetições, cargas, esforço e duração;
- peso corporal, meta de peso, preferências e limitações informadas ao Coach;
- preferências de idioma, unidade, tema e notificações;
- assinatura técnica de push e dados necessários à operação da sessão;
- logs operacionais do Coach, sem a credencial do provedor.

A chave privada da passkey permanece no dispositivo ou gerenciador de senhas do participante.

## Finalidades

Os dados servem para autenticar o participante, sincronizar seu histórico, executar treinos,
calcular progressão e estatísticas, gerar backups e prestar o suporte básico da beta. O painel
administrativo permite que o operador acesse históricos e peso corporal, desative contas e
administre convites.

## AI Coach

O Coach é opcional e exige consentimento separado por perfil. Quando usado, pode enviar ao
provedor selecionado o plano, uma janela do histórico de treino, pesagens e meta, respostas do
intake e preferências técnicas. Nome, identificador interno, passkeys, assinatura de push e dados
de outros perfis ficam fora do payload definido pelo aplicativo.

O provedor recebe esses dados sob seus próprios termos e pode tratá-los fora do Brasil. Antes de
consentir, o participante deve receber a identificação do provedor e links para seus termos e
política de privacidade. A conta conectada pertence ao operador da instância; esse modelo deve ser
revisto antes de oferecer o Coach ao público.

## Armazenamento e segurança

Os dados ficam em um notebook pessoal e em backups locais controlados pelo operador. O acesso web
usa HTTPS pelo domínio da instância. Os arquivos do servidor não possuem criptografia própria em
repouso; quem obtiver acesso administrativo ao host ou aos backups poderá lê-los. O serviço pode
ficar indisponível porque depende de energia, internet e equipamento residenciais.

## Compartilhamento

Fora o provedor de IA escolhido pelo participante, os dados não devem ser vendidos nem usados
para publicidade. Prestadores de infraestrutura que encaminham o tráfego podem processar dados
técnicos necessários à conexão. Qualquer novo compartilhamento exige atualização deste aviso e da
base aplicável.

## Direitos e encerramento

O participante pode solicitar confirmação do tratamento, acesso, correção, exportação e exclusão.
O produto deve oferecer um caminho seguro para excluir também o estado mantido no servidor. O
prazo de retenção e o procedimento de eliminação de backups ainda precisam ser definidos antes da
abertura pública.

## Pendências antes da publicação

- definir um canal dedicado e privado para solicitações;
- definir base legal, retenção e eliminação de backups;
- implementar ciência deste aviso dentro do produto;
- confirmar o fluxo de exclusão da conta e do estado do Coach;
- documentar provedores e transferências internacionais;
- revisar o texto com assessoria jurídica adequada ao alcance do lançamento.
