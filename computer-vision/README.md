# Reencontra — Detecção de Cartazes com YOLO11

## Sobre o projeto

O Reencontra é um projeto acadêmico de tecnologia cidadã
voltado ao contexto de pessoas desaparecidas.

Este módulo utiliza visão computacional para detectar
cartazes de desaparecimento em imagens.

O sistema não realiza reconhecimento facial.

## Tecnologias

- Python
- Ultralytics YOLO11 Nano
- PyTorch
- Google Colab
- GPU NVIDIA T4

## Dataset

O treinamento V3 utilizou:

- 241 imagens de treinamento
- 20 imagens de validação
- Cartazes verticais e horizontais
- Exemplos negativos sem cartazes

Classe detectada: `cartaz_desaparecido`

O dataset foi produzido com imagens sintéticas.

## Resultados do YOLO V3

| Métrica | Resultado |
|---|---|
| Precisão | 99,75% |
| Recall | 100,00% |
| mAP50 | 99,50% |
| mAP50-95 | 99,50% |

Teste com cartaz horizontal:

- 1 cartaz detectado
- Confiança: 93,76%
- Tempo de inferência: 10,2 ms na GPU utilizada

## Instalação

Instale as dependências:

    pip install -r requirements.txt

## Execução

Coloque o modelo e o script na mesma pasta.

Execute:

    python detectar_cartazes.py --imagem cartaz_teste.jpg

O resultado visual será salvo em `runs/detect`.

## Arquivos

- `detectar_cartazes.py`: script de detecção
- `reencontra_yolo_v3.pt`: modelo treinado
- `requirements.txt`: dependências
- `README.md`: documentação

## Limitações

O treinamento e a validação utilizaram dados sintéticos,
com variedade limitada de fotografias e layouts.

As métricas não representam necessariamente o desempenho
em imagens reais.

O detector localiza cartazes, mas não identifica pessoas
nem verifica a veracidade das informações.

## Contexto acadêmico

Global Solution 2026.2 — FIAP

Applied Computer Vision — Projeto Reencontra.
