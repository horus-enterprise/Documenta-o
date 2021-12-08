#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Olá! Bem-vindo(a) ao assistente de instalação HORUS."
echo  "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Verificando se já existe o Java em sua máquina..."
sleep 3

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Ótimo! Você já possui o Java instalado."
		echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Baixando nossa aplicação do GitHub..."
		sleep 5
		git clone https://github.com/horus-enterprise/horus-cli
		clear
		echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Download concluído."
		echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Iniciando aplicação..."
		sudo java -jar horus-cli/target/horus-cli-jar-with-dependencies.jar
	else
		echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Você não possui o Java instalado!"
		echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7)  Deseja instalar o Java (s/n)?"
	read inst
	if [ \"$inst\" == \"s\" ]
		then
			echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Iniciando instalação do Java..."
			echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Adicionando repositório..."
			sleep 3
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Atualizando... Quase lá!"
			sudo apt update -y
			clear
			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado ;D"
					sudo apt install default-jre -y; apt install openjdk-11-jre-headless -y;
					clear
					echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Java (JRE 11) instalado com sucesso!"
					echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Baixando aplicação do GitHub..."
					sleep 5
					git clone https://github.com/horus-enterprise/horus-cli
					clear
					echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Download concluído."
					echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Iniciando aplicação..."
					sudo java -jar horus-cli/target/horus-cli-jar-with-dependencies.jar
				fi
		else 	
		echo "$(tput setaf 10)[HORUS INSTALLER]:$(tput setaf 7) Impossível prosseguir! (Java não encontrado)"
	fi
fi
#stop 10


# ===================================================================
# Todos direitos reservados para o autor: Dra. Profa. Marise Miranda.
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================
