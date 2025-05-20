programa
{
	inclua biblioteca Util --> u

	inteiro fila[20]
	inteiro inicia = 0
    	inteiro tam = 19, fim = -1
    
    funcao enfileirar(inteiro valor)
    {
        se (fim == tam) {
            escreva("Erro: Fila cheia!\n")
        }
        senao {
            fim = fim + 1
            fila[fim] = valor
            escreva("Enfileirado: ", valor, "\n")
        }
    }
    funcao desenfileirar()
    {
        se (inicia > fim) {
            escreva("Erro: Fila vazia!\n")
        }
        senao {
            escreva("Desenfileirado: ", fila[inicia], "\n")
            inicia = inicia + 1
        }
    }
    funcao mostrarFila()
    {
        escreva("\nConteúdo da fila:\n")
        se (inicia > fim) {
            escreva("Fila vazia\n")
        }
        senao {
            para (inteiro i = inicia; i <= fim; i = i + 1) {
                escreva(fila[i], "\n")
            }
        }
    }
    funcao adiciona_numeros()
    {
        para (inteiro j = 0; j < 10; j = j + 1) {
            inteiro valor = u.sorteia(0, 999)
            enfileirar(valor)
        }
    }
    funcao bubble_sort(){
        inteiro i, j, x
        para (i = inicia; i < fim; i = i + 1){
            para (j = inicia; j < fim - (i - inicia); j = j + 1){
                se (fila[j] > fila[j + 1]){
                    x = fila[j]
                    fila[j] = fila[j + 1]
                    fila[j + 1] = x
                }
            }
        }
        escreva("\nFila ordenada com bubble sort:\n")
        mostrarFila()
    }
    funcao merge_sort(inteiro inicioM, inteiro fimM){
        se (inicioM < fimM){
            inteiro meio = (inicioM + fimM) / 2
            merge_sort(inicioM, meio)
            merge_sort(meio + 1, fimM)
            merge(inicioM, meio, fimM)
        }
    }
    funcao merge(inteiro inicioM, inteiro meio, inteiro fimM){
        inteiro i = inicioM, j = meio + 1, k = 0
        inteiro x[20]

        enquanto (i <= meio e j <= fimM){
            se (fila[i] <= fila[j]){
                x[k] = fila[i]
                i = i + 1
            }
            senao{
                x[k] = fila[j]
                j = j + 1
            }
            k = k + 1
        }

        enquanto (i <= meio){
            x[k] = fila[i]
            i = i + 1
            k = k + 1
        }

        enquanto (j <= fimM){
            x[k] = fila[j]
            j = j + 1
            k = k + 1
        }

        para (i = 0; i < k; i = i + 1){
            fila[inicioM + i] = x
            [i]
        }
    }
    funcao inicio(){
		inteiro metodo = 0
		
		escreva("====================================================Senhas na fila======================================================\n")
		fim = -1
		inicia = 0
		adiciona_numeros()
		mostrarFila()
		escreva("\n=====================================Qual método de organização você deseja usar?=====================================\n")
		escreva("1)Bubble Sort\n", "2)Merge Sort\n")
		leia(metodo)
		enquanto(metodo <= 0 ou metodo > 2){
			escreva("\nOpção inválida tente novamente.\n")
			escreva("\n=====================================Qual método de organização você deseja usar?=====================================\n")
			escreva("1)Bubble Sort\n", "2)Merge Sort\n")
			leia(metodo)
		}

		escolha (metodo){
			caso 1:
			bubble_sort()
			pare
			caso 2:
			merge_sort(inicia, fim)
				escreva("\nFila ordenada com merge sort:\n")
        			mostrarFila()
			pare
		}
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3445; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */