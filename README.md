# Reencontra — Global Solution 2026.2

**FIAP | Engenharia de Software | CitizenTech**

## Integrantes

- Irana Pereira — RM 98593
- Lucas Vinicius — RM 98480
- Mariana Melo — RM 98121

## Sobre o projeto

O **Reencontra** é um projeto acadêmico de tecnologia cidadã voltado ao contexto de pessoas desaparecidas.

O MVP utiliza uma base fictícia de 100 casos e 200 retratos sintéticos para demonstrar funcionalidades de consulta, busca por características, comparação visual e registro de informações para revisão.

O projeto integra desenvolvimento web, visão computacional, infraestrutura em nuvem, segurança e observabilidade.

**Importante:** trata-se de uma demonstração acadêmica. O MVP não realiza identificação biométrica nem utiliza casos reais.

## Ficha técnica do MVP

| Campo | Descrição |
|---|---|
| Nome | Reencontra |
| Tipo | MVP acadêmico |
| Tema | Tecnologia cidadã e pessoas desaparecidas |
| Público-alvo | Cidadãos e equipes responsáveis pela análise de informações |
| Objetivo | Facilitar a consulta e a organização de informações sobre casos fictícios |
| Plataforma | Aplicação web |
| Tecnologias da aplicação | HTML, CSS e JavaScript |
| Dados | 100 casos fictícios e 200 retratos sintéticos |
| Visão computacional | Detector de cartazes com YOLO11 Nano, desenvolvido em módulo separado |
| Infraestrutura | AWS EC2, Docker e Terraform |
| Segurança | Gitleaks, Semgrep e Trivy |
| Observabilidade | Amazon CloudWatch |
| ODS relacionada | ODS 10 — Redução das Desigualdades |

## Funcionalidades do MVP

- Consulta de casos fictícios.
- Busca por características e localização.
- Busca visual demonstrativa por padrões de imagem.
- Visualização de fichas.
- Registro de informações de teste.
- Fila simulada de revisão.

A busca visual da aplicação não equivale a reconhecimento facial.

## Arquitetura e infraestrutura

O MVP foi publicado experimentalmente em uma instância Amazon EC2, utilizando Docker para executar a aplicação web.

A infraestrutura foi configurada com Terraform, incluindo os recursos necessários para a execução da demonstração.

A observabilidade foi realizada por meio do Amazon CloudWatch, com dashboard e alarme de utilização de CPU.

### Tecnologias

| Tecnologia | Finalidade |
|---|---|
| AWS EC2 | Hospedagem experimental do MVP |
| Terraform | Infraestrutura como código |
| Docker | Conteinerização da aplicação |
| GitHub Actions | Execução do pipeline de segurança |
| Gitleaks | Detecção de possíveis segredos |
| Semgrep | Análise estática de segurança |
| Trivy | Análise de vulnerabilidades |
| CloudWatch | Monitoramento e alarmes |

## Segurança e DevSecOps

O projeto utiliza verificações de segurança no GitHub Actions, incluindo Gitleaks, Semgrep e Trivy.

O pipeline de segurança foi executado durante o desenvolvimento.

**Limitação:** a implantação automática contínua na AWS não foi concluída. A publicação do MVP foi realizada durante a disponibilidade do laboratório acadêmico.

## Evidências da infraestrutura

As capturas de tela estão disponíveis em:

[Observabilidade e infraestrutura AWS](docs/evidencias/observabilidade/)

As evidências incluem:

- Dashboard do CloudWatch.
- Histórico e configuração do alarme.
- Instância EC2 em execução.
- Aplicação publicada na AWS.
- Outputs do Terraform.
- Execução do GitHub Actions.
- Configuração IAM.
- Saúde da instância.
- Security Group.

## Disponibilidade da aplicação

A aplicação foi disponibilizada temporariamente durante os testes no AWS Academy Learner Lab.

**O laboratório acadêmico foi encerrado e a URL utilizada nos testes não está mais disponível.**

As evidências da publicação foram preservadas no repositório.

## Executar o MVP localmente

Acesse a pasta da aplicação:

```powershell
cd app
py -m http.server 8000
```

Abra `http://localhost:8000` no navegador.

Para mais detalhes, consulte [a documentação da aplicação](app/README.md).

## Visão Computacional

O módulo de Visão Computacional utiliza YOLO11 Nano para detectar cartazes de desaparecimento em imagens sintéticas.

O treinamento V3 foi realizado no Google Colab, utilizando GPU NVIDIA T4.

Os resultados e as limitações estão descritos na [documentação de Visão Computacional](computer-vision/README.md).

## Organização do repositório

| Diretório | Conteúdo |
|---|---|
| `app/` | Aplicação web do MVP |
| `computer-vision/` | Modelo YOLO, notebook e script de detecção |
| `terraform/` | Infraestrutura como código |
| `monitoring/` | Monitoramento |
| `.github/workflows/` | Automação e verificações de segurança |
| `docs/evidencias/` | Capturas de tela da infraestrutura |

## Limitações e próximos passos

O Reencontra é um protótipo acadêmico com dados sintéticos.

As próximas evoluções previstas incluem a integração entre os módulos, a implementação de um backend persistente, o aperfeiçoamento da validação das informações e a implantação automática da aplicação.

Qualquer utilização futura com dados reais exigirá avaliação de privacidade, segurança e conformidade com a LGPD.

---

**Global Solution 2026.2 — FIAP**