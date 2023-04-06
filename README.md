<!--
Copyright 2022 GencoreOperative

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

## Overview

TODO - Links
https://github.com/antimatter15/alpaca.cpp
https://crfm.stanford.edu/2023/03/13/alpaca.html
https://github.com/tloen/alpaca-lora
https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/tree/main
https://huggingface.co/Sosaka/GPT4All-7B-4bit-ggml

A Docker command line utility to run a chat-like application locally on your computer. It provides command line access to an instruction-oriented model that can respond to requests. This project is entirely based on the excellent [alpaca.cpp](https://github.com/antimatter15/alpaca.cpp) project by Antimatter15.

The model is itself based on the [Alpaca project](https://crfm.stanford.edu/2023/03/13/alpaca.html) by Stanford University.

The project is designed to work well on laptops and defaults to using the smallest 4GB model. This brings limitations in what may be possible and how accurate the model will be at performing those tasks.

This project is able to complete tasks.

<!--
TODO - If I want to get the larger size model
curl -o ggml-alpaca-13b-q4.bin -C - https://gateway.estuary.tech/gw/ipfs/Qme6wyw9MzqbrUMpFNVq42rC1kSdko7MGT9CL7o1u9Cv9G
-->

## Detail

This is a Docker project and requires [Docker](https://www.docker.com/) to be installed on your computer. In addition, the Docker image is very large at around 4GB in size. However, it contains all of the required dependencies and model files to run the LLM. No other dependencies are required. 

## Example


## Chat Options

usage: ./chat [options]

options:
  -h, --help            show this help message and exit
  -i, --interactive     run in interactive mode
  --interactive-start   run in interactive mode and poll user input at startup
  -r PROMPT, --reverse-prompt PROMPT
                        in interactive mode, poll user input upon seeing PROMPT
  --color               colorise output to distinguish prompt and user input from generations
  -s SEED, --seed SEED  RNG seed (default: -1)
  -t N, --threads N     number of threads to use during computation (default: 4)
  -p PROMPT, --prompt PROMPT
                        prompt to start generation with (default: random)
  -f FNAME, --file FNAME
                        prompt file to start generation.
  -n N, --n_predict N   number of tokens to predict (default: 128)
  --top_k N             top-k sampling (default: 40)
  --top_p N             top-p sampling (default: 0.9)
  --repeat_last_n N     last n tokens to consider for penalize (default: 64)
  --repeat_penalty N    penalize repeat sequence of tokens (default: 1.3)
  -c N, --ctx_size N    size of the prompt context (default: 2048)
  --temp N              temperature (default: 0.1)
  -b N, --batch_size N  batch size for prompt processing (default: 8)
  -m FNAME, --model FNAME
                        model path (default: ggml-alpaca-7b-q4.bin)



## License

This project is only for academic research and any commercial use is prohibited. It is therefore [licensed](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode) as Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License.

This project builds on the work of Stanford Univeristy, and applies the same usage restrictions. The full details of this are detailed [here](https://crfm.stanford.edu/2023/03/13/alpaca.html).

> We emphasize that Alpaca is intended only for academic research and any commercial use is prohibited. There are three factors in this decision: First, Alpaca is based on LLaMA, which has a non-commercial license, so we necessarily inherit this decision. Second, the instruction data is based on OpenAI’s text-davinci-003, whose terms of use prohibit developing models that compete with OpenAI. Finally, we have not designed adequate safety measures, so Alpaca is not ready to be deployed for general use.