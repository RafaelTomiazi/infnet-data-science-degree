# Aula 2026-10-26: CRISP-DM com prompts, fases 5 (avaliação) e 6 (implantação e comunicação)

**Disciplina:** Engenharia de Prompts para Ciência de Dados (DR4) · **Etapa/semana:** aula 6 · **Professor:** Claudio Bonel
**Material:** gravação de 26/10 no Moodle (1h40). O conteúdo vai de 0:05 a 1:08; depois disso é exercício livre e conversa.

## Mapa da gravação (o que vale rever no vídeo)
| Tempo | O quê | Rever? |
|---|---|---|
| 0:00–0:05 | chamada, papo sobre eleição | pular |
| 0:05–0:10 | recap do caso: fintech quer saber onde orientar bloqueio de celular roubado (ISP-RJ, 1º sem 25 x 1º sem 26) | só se esqueceu o caso |
| **0:10–0:16** | **prompt da fase 5: revisor crítico** | **sim, ver o prompt na tela** |
| 0:16–0:20 | resposta: queda geral, mas aumento concentrado em poucas CISPs | rápido |
| **0:20–0:40** | **dashboard de outliers (boxplot, histograma, média x mediana) e semântica do público** | **sim, é a parte de estatística** |
| **0:40–0:46** | **prompt da fase 6: conferência, seleção, 3 frases, limites** | **sim** |
| 0:46–0:50 | documento de "percurso metodológico" | rápido |
| **0:50–1:00** | **declaração de uso de IA + tabela de critérios C1–C5 com evidência** | **sim, serve pra todo TP** |
| 1:00–1:08 | "prompt ingênuo" falhando ao editar o docx; lições | rápido |
| 1:08–1:40 | exercício: refazer o estudo de caso da aula 1 com as técnicas novas e mandar no formulário; conversa | pular |

## Em uma frase
Um prompt bom para análise de dados segue o método (CRISP-DM): cada fase tem papel, contexto, o que **não** fazer, tarefa em passos e formato de saída. A fase de avaliação serve para achar limites, não para aprovar por cortesia.

## Conceitos

### 1. Anatomia do prompt que o professor usa
1. **Papel** específico: não "analista", e sim "revisor crítico de análise de dados que **não fez** esta análise". Isso é uma heurística para a IA olhar de fora e diminuir o viés de confirmar o que já fez.
2. **Contexto** copiado do enunciado: quem decide, o quê, em quanto tempo.
3. **Restrições** (o que não fazer): "não aprove nada por cortesia", "use somente o que está abaixo", "não invente bairro, delegacia ou número", "não afirme causa", "não culpe moradores".
4. **Tarefa em passos numerados**, na ordem.
5. **Dados**: só o que já está na conversa (os quadros aprovados nas fases anteriores), sem anexar o CSV de novo.
6. **Exemplo de formato** (few-shot de formato) e **formato de saída**: pt-BR, tabela com colunas X/Y/Z, no máximo N palavras, "se o número não estiver nos quadros, escreva *não confirmado*".

Prompt "ingênuo" (escrito às pressas, sem formato) dá resultado errado e gasta mais tokens refazendo. Na aula ele pediu para inserir gráficos no docx e a IA não fez duas vezes, até ele colocar o formato de saída.

### 2. Fase 5: avaliação = achar limitações
Passos do prompt: (1) listar problemas com evidência tirada dos quadros; (2) para cada um, a fase do CRISP-DM para onde voltar (ou "só aviso na nota"); (3) conferência: sem evidência, não lista; (4) concluir "pode seguir" ou "voltar à fase X".
- Limitação não é vergonha: quase toda decisão corporativa é tomada com limites. O importante é **declarar**.
- Decisões como "tirar os outliers" se tomam **a quatro mãos**, com o especialista do domínio, não sozinho.

### 3. Outliers, média e mediana
- Boxplot: Q1, Q2 (= mediana), Q3; IQR = Q3 − Q1; o que passa de Q3 + 1,5·IQR ou fica abaixo de Q1 − 1,5·IQR é outlier.
- Média **acima** da mediana → puxada pelos outliers de cima; **abaixo** → pelos de baixo.
- Cuidado: outliers dos dois lados podem se cancelar e deixar a média "bonita" sem ela representar nada. O exemplo dele: pé a 0 °C e mão a 78 °C dão média de 39 °C, e você está morrendo.

```python
import pandas as pd

# variacao de roubos por delegacia (dados inventados, so pra treinar)
var = pd.Series([-60, -45, -40, -35, -33, -30, -28, -25, -20, 10, 45, 92],
                index=[f"DP{i}" for i in range(1, 13)])

q1, q3 = var.quantile(0.25), var.quantile(0.75)
iqr = q3 - q1
lim_inf, lim_sup = q1 - 1.5 * iqr, q3 + 1.5 * iqr
print(f"Q1={q1:.1f} Q3={q3:.1f} IQR={iqr:.1f} limites=[{lim_inf:.1f}, {lim_sup:.1f}]")
print("outliers:", var[(var < lim_inf) | (var > lim_sup)].to_dict())

media, mediana = var.mean(), var.median()
# quanto a media se afasta da mediana (o calculo que o professor fez na calculadora)
print(f"media={media:.1f} mediana={mediana:.1f} diferenca={(media - mediana) / abs(mediana):+.0%}")
```
Saída (rodei):
```
Q1=-36.2 Q3=-12.5 IQR=23.8 limites=[-71.9, 23.1]
outliers: {'DP11': 45, 'DP12': 92}
media=-14.1 mediana=-29.0 diferenca=+51%
```
A média ficou 51% acima da mediana por causa de dois outliers de cima, então aqui a mediana resume melhor.

### 4. Falar a língua de quem vai ler
Para um investigador da Polícia Civil, use "CISP"; para um conselho comunitário, use "DP" (CISP é a delegacia, AISP é o batalhão da PM). Ninguém de fora sabe ler "Δ", "IQR" ou "r = 0,93". Se o público é leigo, traduza ("duas delegacias concentram muitos roubos") ou faça um treinamento funcional antes.

### 5. Fase 6: implantação e comunicação
Passos: (1) **conferência**, uma prova real (a soma do quadro 2 bate com o quadro 1?); (2) seleção: tabela das 5 CISPs com maior aumento **em número**, não em %; (3) três frases: evolução geral, onde subiu apesar da queda, sugestão **condicional** ("se julho a setembro confirmarem…"); (4) linha "Atenção:" com os limites.
- Registro policial ≠ crime ocorrido (subnotificação).
- Percentual em base pequena engana.
- Estatística não prova causa.

### 6. Declaração de uso de IA e evidência
- Depois da capa, uma declaração de uso de IA citando a portaria do CNPq que ele mostrou (conferir o número exato no material dele antes de citar). Ela diz onde a IA foi usada em cada etapa e que a autoria e a responsabilidade são humanas. Usar no TCC e em artigo; esconder isso pode custar o título.
- Tabela de critérios C1–C5 (ex.: "os números conferem com os quadros", "não inventa bairro", "não afirma causa"), cada um com **print de evidência**. Na aula, a execução 1 **falhou** no C "não inventa bairro": o dashboard colocou nomes de bairro tirados da internet.

## Como isso cai no TP
- **DR4 TP3 (25/11):** o encadeamento fase 5 → fase 6 é exatamente **prompt chaining** (a saída aprovada de uma fase vira o input da próxima). As restrições "use somente o que está abaixo" e "não invente" são a base das **defesas contra prompt injection** e do `validar_saida`. A tabela de critérios com evidência serve para medir a acurácia nos testes T1–T8.
- **Qualquer TP/AT:** declaração de uso de IA na primeira página e sugestão sempre condicional, com limites.

## Dúvidas abertas
- [ ] Qual é o número certo da portaria do CNPq? O professor ficou de compartilhar o modelo.
- [ ] Ele ia mandar um percurso metodológico anonimizado "na próxima aula": procurar no Moodle.
- [ ] Exercício da aula: refazer o estudo de caso da aula 1 com as técnicas novas e enviar no formulário. Fiz?

## Perguntas de revisão
1. Por que o papel da fase 5 diz "você **não** fez esta análise"?
2. A média deu −14 e a mediana −29. Para que lado estão os outliers, e qual métrica você usaria no relatório?
3. Na seleção da fase 6, por que ordenar pelo aumento em número e não em percentual?
4. Dê duas restrições de prompt que também funcionam como defesa contra a IA inventar dados.
5. Mesmo painel para a Polícia Civil e para moradores: o que muda?

<details><summary>Respostas</summary>

1. Para a IA revisar como alguém de fora, sem o viés de defender a análise que acabou de fazer. É uma heurística, porque os dados continuam na memória da conversa.
2. A média está acima da mediana, então os outliers estão em cima. No relatório, a mediana, citando os outliers à parte.
3. Percentual em base pequena engana: uma DP que foi de 2 para 6 roubos tem +200%, mas pesa pouco no total. O cliente precisa saber onde estão mais casos.
4. "Use somente os números dos quadros; se não estiver lá, escreva *não confirmado*" e "não invente nome de bairro, delegacia nem número".
5. O vocabulário: "CISP" vira "DP", e "assimetria positiva" vira "poucas delegacias concentram muitos roubos". Para leigos também cabe explicar antes como se lê o gráfico.

</details>
