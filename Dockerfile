from rust:latest

# Get Aptos core and run dev setup
RUN git clone https://github.com/aptos-labs/aptos-core.git
WORKDIR /aptos-core
RUN ./scripts/dev_setup.sh -b

# Move CLI
RUN cargo install --git https://github.com/diem/move move-cli --branch main

# Aptos CLI
RUN apt-get update && apt-get -y install build-essential pkg-config openssl libssl-dev libclang-dev
RUN cargo install --git https://github.com/aptos-labs/aptos-core.git aptos --tag aptos-cli-latest

WORKDIR workspace/
