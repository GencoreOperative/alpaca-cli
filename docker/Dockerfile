# Copyright 2023 GencoreOperative
# 
# Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License

FROM ubuntu:lunar-20230314

# ========================
# Build stage
# ========================

ARG ALPACA_COMMIT

RUN apt-get update && \
    apt-get install -y \
    	make \
    	gcc \
    	g++ \
        git && \
    apt-get clean && \
    apt-get auto-remove && \
    rm -rf /var/lib/apt/lists/

RUN mkdir work
WORKDIR work

# ========================
# Checkout Alpaca CPP
# ========================

RUN git clone https://github.com/antimatter15/alpaca.cpp

WORKDIR alpaca.cpp
RUN git checkout ${ALPACA_COMMIT}
RUN make chat

# ========================
# Run stage
# ========================

FROM ubuntu:lunar-20230314

COPY --from=0 /work/alpaca.cpp/chat /chat
ADD entrypoint.sh /entrypoint.sh
ADD ggml-alpaca-7b-q4.bin .

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]