# Prompts para estudar uma aula com o Gemini Notebook

Fonte: a transcrição da aula em `.txt`, com o minuto no início de cada trecho (`[mm:ss]`).

## 1. Gerar a nota da aula

```
Você é meu assistente de estudos de Ciência de Dados. A fonte selecionada é a transcrição automática de uma aula ao vivo, com o minuto no início de cada trecho ([mm:ss]).

Regras:
- Use só o que foi falado na aula. Não invente nada.
- A transcrição tem erros. Corrija termos técnicos óbvios e marque com "(conferir)" o que não tiver certeza.
- Ignore chamada, conversa e avisos que não são matéria.
- Não cite nomes de alunos.
- Sempre que der, coloque o minuto [mm:ss] de onde tirou a informação.
- Responda só com o Markdown abaixo, sem nada antes ou depois.

# Aula AAAA-MM-DD — [tema principal]

**Disciplina:** [nome] · **Professor:** [nome] · **Duração:** [minuto inicial a final]

## Em uma frase
[o que a aula ensinou, em uma frase simples]

## Mapa da gravação
| Minutos | O quê | Rever no vídeo? |
|---|---|---|
[blocos de 5 a 15 minutos; na última coluna: "sim", "rápido" ou "pular"]

## Conceitos-chave
- **[conceito]:** definição de 1 linha + exemplo simples [mm:ss]

## Código mostrado
[A transcrição não captura a tela. Reconstrua um exemplo mínimo em Python a partir do que o professor falou, com comentários curtos, e escreva "(reconstruído da fala)" acima do bloco. Se não houve código, escreva "Nenhum código nesta aula".]

## Pontos de atenção para prova/TP
- [o que ele enfatizou, disse que cai ou apontou como erro comum] [mm:ss]

## Exercícios passados
- [exercícios ou desafios que ele pediu; se não teve, "Nenhum"]

## Perguntas de revisão
[5 perguntas, da mais fácil para a mais difícil, SEM as respostas]
```

## 2. Me testar (depois de ler a nota, sem olhar)

```
Me faça as perguntas de revisão uma de cada vez. Espere minha resposta, diga se está certa, corrija com base na aula e diga o minuto para eu rever. No final, liste os temas que eu errei.
```

## 3. Print da tela (código ou slide importante)

```
Esta imagem é um print da aula no minuto [mm:ss]. Transcreva o código (ou o texto do slide) e explique linha por linha o que ele faz.
```

## Depois
- Assista só os trechos marcados como "sim", a 1,5x, digitando o código no Colab.
- Salve a nota em `semester-XX/<disciplina>/notes/AAAA-MM-DD-tema.md` e o código que você digitou em `exercises/`.
