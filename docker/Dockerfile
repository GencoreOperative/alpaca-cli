# Copyright 2023 GencoreOperative
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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