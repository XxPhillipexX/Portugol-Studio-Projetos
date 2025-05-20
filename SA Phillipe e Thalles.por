programa
{
	inclua biblioteca Texto
	
	cadeia nomeA[10], emailA[10], curso[10], nomeR[10], emailR[10], turno2[10]
     inteiro idade[10], nm[10], turno[10], i = 0, j = 0, ValFicha, opcficha, DDD[10], telefone[10], nm2[10]
	
	funcao preencha_ficha(){
		escreva("\n----------------------------Bem Vindo----------------------------\n")
		escreva("\nPor favor preencha os dados a seguir com as informações do aluno\n", "!! Se o aluno for menor de idade será necessário que um responsável insira alguns dados !!\n")
		escreva("\nNome do aluno ", i + 1, ": ")
		leia (nomeA[i])
		escreva("Idade do aluno ", i + 1, ": ")
		leia (idade[i])
			idade[i] = ValIdade (idade[i])
          		se (idade[i] == 0){
		  			enquanto (idade[i] == 0){
          				escreva("\nDigite a idade do aluno novamente : ")
						leia (idade[i])
							idade[i] = ValIdade (idade[i])
		  			}
          		}	
		escreva("Email do aluno ", i + 1, ": ")
		leia (emailA[i])
		emailA[i] = ValEmail(emailA[i])
		escreva("Número da matrícula: ")
		leia (nm[i])
			nm2[i] = ValM (nm, i)
		escreva("Curso desejado para o aluno ", i + 1, ": ")
		leia (curso[i])
		escreva("Turno:\n")
		escreva("1)Matutino\n", "2)Vespertino\n", "3)Noturno\n")
		escreva("Digite o turno desejado (1,2,3) para o aluno ", i + 1, ": ")
		leia (turno[i])
          	turno2[i]=VerTurno(turno[i])
          		se (turno2[i] == "0"){
		  			enquanto (turno2[i] == "0"){
          				escreva("\nTurno:\n")
	        				escreva("1)Matutino\n", "2)Vespertino\n", "3)Noturno\n")
		     			escreva("Digite o turno desejado novamente (1,2,3) para o aluno ", i + 1, ": ")
		     			leia (turno[i])
		     				turno2[i] = VerTurno (turno[i])
          			}
		  		}
	     	se (idade[i] < 18){
				escreva("Nome do Responsável ", i +1, ": ")
				leia (nomeR[i])
				escreva("Email do Responsável ", i +1, ": ")
				leia (emailR[i])
				emailR[i] = ValEmail(emailR[i])
				escreva("Digite o DDD do Telefone do Responsável ", i + 1, " sem '()' e 0: ")
				leia (DDD[i])
					se(DDD[i] < 1 ou DDD[i] > 99){
						enquanto(DDD[i] < 1 ou DDD[i] > 99){
							escreva("\nDDD inválido, Tente Novamente\n")
							escreva("\nDigite o DDD do Telefone do Responsável ", i + 1, " sem '()' e 0: ")
							leia (DDD[i])
						}
					}
				escreva("Digite o telefone do responsável ", i + 1, " sem o DDD: ")
				leia (telefone[i])
					se(telefone[i] < 100000000 ou telefone[i] > 999999999){
						enquanto(telefone[i] < 100000000 ou telefone[i] > 999999999){
							escreva("\nTelefone inválido, Tente Novamente\n")
							escreva("\nDigite o Telefone do Responsável ", i + 1, " sem o DDD: ")
							leia (telefone[i])
						}
					}
			}
	escreva_ficha()
		escreva("\nOpções:\n")
		escreva("1)Sim\n","2)Não\n")
		escreva("Sua ficha está correta? (1,2): ")
		leia (ValFicha)
			ValFicha = ficha(ValFicha)
	     		enquanto(ValFicha == 0){
		     		escreva_ficha()
		     		escreva("\nOpções:\n")
		     		escreva("1)Sim\n","2)Não\n")
					escreva("Sua ficha está correta? (1,2): ")
		     		leia (ValFicha)
		     			ValFicha = ficha(ValFicha)
	     		}
		escolha (ValFicha){
			caso 1:
				escreva("\nFicha concluída, obrigado!!!\n")
			pare
			caso 2:
				enquanto (ValFicha == 2){
          			preencha_ficha()
				}
			pare
		}
	}
     funcao escreva_ficha(){
		escreva("\n----------------------------Ficha do Aluno ", i + 1, "----------------------------\n")
		escreva("\n")
		escreva("Nome do aluno: ", nomeA[i])
		escreva("\nIdade do aluno: ", idade[i])
		escreva("\nEmail do aluno: ", emailA[i])
		escreva("\nNúmero da matrícula: ", nm2[i])
		escreva("\nNúmero do aluno: ", i + 1)
		escreva("\nCurso do aluno: ", curso[i])
		escreva("\nTurno escolhido: ", turno2[i], "\n")
			se (idade[i] < 18){
		 		escreva("Nome do responsável: ", nomeR[i])
				escreva("\nEmail do responsável: ", emailR[i])
		 		escreva("\nTelefone do responsável: (", DDD[i], ")", telefone[i], "\n")
		 	}
    }
	funcao inteiro ValIdade (inteiro a){
		se (a < 1 ou a > 100){
			escreva("\nIdade Inválida\n")
			retorne 0
		}
		retorne a
	}
	funcao cadeia ValEmail (cadeia Email){
		inteiro ValA, ValP, TamT, l
		TamT = Texto.numero_caracteres(Email)
		para(l = 0;l <= TamT;l++){
			ValA = Texto.posicao_texto("@", Email, l)
			ValP = Texto.posicao_texto(".com", Email, l)
				se (ValA >= 0 e ValP >= 0){
					retorne  Email
				}
				senao se(ValA < 0 ou ValP < 0){
					enquanto (ValA < 0 ou ValP < 0){
						escreva("\nFormato de Email inválido. Tente Novamente\n")
						escreva("Digite o seu email: ")
						leia (Email)
							ValA = Texto.posicao_texto("@", Email, l)
							ValP = Texto.posicao_texto(".com", Email, l)
					}
				}
		}
		retorne  Email
	}
	funcao inteiro ValM (inteiro a[],inteiro k){
		inteiro m = a[k]
		se (a[k] < 1){
			faca{
				escreva("\nNúmero de matrícula inválido, o valor deve ser positivo\n")
				escreva("\nDigite o número de matrícula novamente: ")
				leia (a[k])
			}enquanto(a[k] < 10)
			faca{
				para(i = 0;i < k;i++){
					se (a[i] == a[k]){
						escreva("\nNúmero de matrícula já foi utlizado. Tente Novamente\n")
						escreva("\nNúmero da matrícula: ")
						leia (m)
					}
		
				}
			}enquanto (m == a[k])
		}
		senao se (k > 0){
			para(i = 0;i < k;i++){
				se (a[i] == a[k]){
					faca{
						escreva("\nNúmero de matrícula já foi utlizado. Tente Novamente\n")
						escreva("\nNúmero da matrícula: ")
						leia (m)
							se (m < 1){
								faca{
									escreva("\nNúmero de matrícula inválido, o valor deve ser positivo\n")
									escreva("\nDigite o número de matrícula novamente: ")
									leia (m)
								}enquanto(m < 1)
							}
					}enquanto (m == a[k])
				}
			}
		}
		retorne m
	}
	funcao cadeia VerTurno (inteiro a){
		cadeia m = "Matutino", v = "Vespertino", n = "Noturno", b = "0"
		se (a == 1){
			retorne m
		}
		senao se (a == 2){
			retorne v
		}
		senao se (a == 3){
			retorne n
		}
		senao{
			escreva("\nOpção inválida\n")
			retorne b
		}
	}
	funcao inteiro ficha (inteiro a){
		se (a == 1){ 
			retorne 1
		}
		senao se (a == 2){
			retorne 2
		}
		senao{
			escreva("\nOpção inválida. Tente Novamente\n")
		}
		retorne 0
	}
	funcao inteiro VerFicha(inteiro a){
		se (a > 10 ou a <= 0){
			escreva("Valor Inválido. Tente novamente")
			retorne 0
		}
		retorne a
	}
	funcao VisFicha(){
		escreva("\nDigite o número do aluno para ver sua ficha: ")
		leia(i)
			i = VerFicha(i)
				enquanto(i == 0){
					escreva("\nDigite o número do aluno para ver sua ficha: ")
					leia(i)
						i = VerFicha(i)
				}
		i--
		escreva_ficha()
		escreva("\nOpções:\n")
		escreva("1)Sim\n","2)Não\n")
		escreva("Deseja ver outra ficha? (1,2): ")
		leia(opcficha)
	}
	funcao inicio(){
		para (i = 0; i < 10;i++){
			preencha_ficha()
		}
		para (i = 0; i < 10;i++){
			escreva_ficha()
		}
		VisFicha()
			enquanto(opcficha == 1){
				VisFicha()
			}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6453; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */