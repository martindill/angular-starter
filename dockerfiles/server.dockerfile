# Usa a imagem oficial do Node.js como base
FROM node:20

# Define o diretório de trabalho dentro do container
WORKDIR /var/www/html

RUN npm install -g @angular/cli

# Copia o package.json e package-lock.json para instalar dependências
COPY src/package*.json ./

# Instala as dependências do projeto
RUN npm install

# Copia o restante dos arquivos do projeto
COPY src .

# Exponha a porta padrão do Angular (4200)
EXPOSE 4200

# Comando para iniciar a aplicação Angular
CMD ["ng", "serve", "--host", "0.0.0.0"]