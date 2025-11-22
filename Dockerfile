# Base leve do Debian/Ubuntu
FROM ubuntu:22.04

WORKDIR /app

# Instala as dependências que o binário do Lazarus precisa no Linux
# libssl-dev: para HTTPS/OpenSSL (quase todo Horse usa)
# libpq5: Cliente do Postgres (ESSENCIAL para conectar no banco)
# ca-certificates: Para chamadas HTTPS externas funcionarem
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libpq5 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copia o executável (Substitua 'SeuExecutavel' pelo nome real)
COPY sics_api .

# Dá permissão e expõe a porta padrão do Horse
RUN chmod +x sics_api
EXPOSE 9000

# Comando de execução
CMD ["./sics_api"]
