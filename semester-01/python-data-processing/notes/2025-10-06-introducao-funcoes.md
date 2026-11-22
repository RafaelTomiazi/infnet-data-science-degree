# Aula 2025-10-06: introdução a funções

**Disciplina:** Python para Processamento de Dados · **Etapa/semana:** etapa 1, 1ª aula · **Professor:** Mateus Oliveira
**Material:** gravação de 06/10/2025 no Drive (tem a aba "Transcrição"). Base: *Python Crash Course*, 2ª ed., cap. 8.

## Mapa da gravação
A transcrição do Drive não traz os tempos, então o mapa segue a ordem da aula.
| Parte | O quê | Rever no vídeo? |
|---|---|---|
| começo | espera, fundo de tela, bibliografia | pular |
| 1º quarto | o que é função; `def` sem parâmetro; com parâmetro; erro *missing positional argument* | só se travar |
| meio | posicional x nomeado; valor padrão (`sep` e `end` do `print`) | **sim, os quizzes** |
| 3º quarto | `return` x `print`; `receber_inteiro()` com `while`; quizzes de `diferenca(a, b)` | **sim, é o que mais cai** |
| fim | exercício `make_shirt` (vira arte ASCII); `\\` em string; dúvida "quando usar return" | o exercício, sim; a arte, pular |

## Em uma frase
Função é um bloco de código com nome: você escreve uma vez e chama quantas vezes quiser. Se precisar mudar o comportamento, muda num lugar só, e não em 200.

## Conceitos

### 1. Definir e chamar
`def nome(parametros):` e o bloco indentado. Chamar = `nome(argumentos)`. Você já usava funções prontas (`print`, `math.sqrt`) sem saber o que tem dentro delas, e essa é a ideia: abstrair.

### 2. Parâmetro x argumento
- **Parâmetro** é o nome na definição (`def f(usuario)`).
- **Argumento** é o valor passado na chamada (`f("Kevin")`).
- Muita gente (e documentação) troca os dois. O professor disse que também troca e que não liga.

### 3. Três jeitos de passar argumento
- **Posicional**: a ordem importa. `descrever_animal("Luke", "cachorro")` trocado vira "Eu tenho um Luke".
- **Nomeado** (*keyword argument*): `tipo_animal="hamster"`, e aí a ordem não importa.
- **Misturado**: pode, desde que os posicionais venham **antes** dos nomeados.
- **Valor padrão**: `def f(nome, tipo="cachorro")`, e quem chama só passa o tipo se for diferente. É como o `print` faz com `sep=" "` e `end="\n"`.
- Sem padrão e sem argumento dá `TypeError: f() missing 1 required positional argument: 'b'`.

### 4. `return` x `print`
- `print` só **mostra** na tela. `return` **devolve** o valor para quem chamou guardar e usar (`x = math.sqrt(16)` → 4.0).
- Sem `return`, a função devolve `None`. Foi isso que quebrou a calculadora dele: `None + None` dá `TypeError: NoneType`.
- Quando o `return` executa, a função **acaba ali**, e o que vem depois não roda.
- Regra prática dele: vai precisar do valor depois? Use `return`.

```python
# 1) sem parametro, sem return
def bom_dia():
    print("Bom dia! Seja bem-vindo.")

# 2) parametro com valor padrao
def descrever_animal(nome_animal, tipo_animal="cachorro"):
    print(f"Eu tenho um {tipo_animal}. O nome do meu {tipo_animal} é {nome_animal}.")

# 3) return: devolve o valor pra quem chamou usar depois
def diferenca(a, b):
    return a - b

bom_dia()
descrever_animal("Luke")                         # usa o padrao
descrever_animal("Mimi", "gato")                 # posicional
descrever_animal(tipo_animal="hamster", nome_animal="Harry")  # nomeado: ordem nao importa
print(diferenca(10, 4), diferenca(b=10, a=4))    # 6 e -6
x = bom_dia()                                    # funcao sem return devolve None
print(x)
```
Saída (rodei):
```
Bom dia! Seja bem-vindo.
Eu tenho um cachorro. O nome do meu cachorro é Luke.
Eu tenho um gato. O nome do meu gato é Mimi.
Eu tenho um hamster. O nome do meu hamster é Harry.
6 -6
Bom dia! Seja bem-vindo.
None
```

### 5. Python não checa tipo antes de rodar
`nome_base(10)` com `.split(".")` dentro só quebra **na execução** (`'int' object has no attribute 'split'`). Java ou C acusariam isso na compilação.

### 6. Detalhe do fim da aula: barra invertida
`\` em string é caractere especial. Para aparecer uma barra, escreva `\\`; para aparecer duas, `\\\\`. A barra normal `/` não precisa de nada.

## Como isso cai no TP
Os TPs pedem código sem repetição: o "pedir número até o usuário digitar certo" vira uma função `receber_inteiro()` chamada várias vezes. A questão de número primo do AT também fica bem mais fácil com uma função `eh_primo(n)`.

## Exercícios da aula (fazer em `exercises/`)
- [ ] 8-1 `display_message()` e 8-2 `favorite_book(titulo)` (Crash Course)
- [ ] `make_shirt(tamanho, texto)` chamada uma vez posicional e outra nomeada
- [ ] Listar todos os primos até N, que ele ia resolver na aula seguinte
- [ ] Batalha naval refeita com funções

## Dúvidas abertas
- [ ] Quando vale mais a pena usar argumento nomeado do que posicional? Ele disse que fica claro com funções de muitos parâmetros.

## Perguntas de revisão
1. `def diferenca(a, b): return a - b`. Quanto sai de `print(diferenca(b=10, a=4))`?
2. Qual é a diferença entre parâmetro e argumento?
3. `descrever_animal(tipo_animal="gato", "Mimi")` funciona? Por quê?
4. Uma função que só faz `print(n)` é usada em `soma = f() + f()`. O que acontece?
5. Por que o `print` tem `sep` e `end` com valor padrão?

<details><summary>Respostas</summary>

1. −6. É nomeado, então `a=4` e `b=10`, e 4 − 10 = −6.
2. Parâmetro é o nome na definição; argumento é o valor passado na chamada.
3. Não: argumento posicional não pode vir depois de um nomeado (`SyntaxError`).
4. Dá `TypeError`: sem `return`, a função devolve `None`, e `None + None` não existe.
5. Porque quase sempre você quer espaço entre os itens e quebra de linha no fim. Sem padrão, teria que escrever isso em toda chamada.

</details>
