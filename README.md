<!--
Copyright 2023 GencoreOperative

Licensed under Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License
-->

## Overview

TODO - Links
https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/tree/main
https://huggingface.co/Sosaka/GPT4All-7B-4bit-ggml

A Docker command line utility to run a chat-like application locally on your computer. It provides command line access to an instruction-oriented model that can respond to requests. This project is entirely based on the excellent [alpaca.cpp](https://github.com/antimatter15/alpaca.cpp) project by Antimatter15.

The model is itself based on the [Alpaca project](https://crfm.stanford.edu/2023/03/13/alpaca.html) by Stanford University.

The project is designed to work well on laptops and defaults to using the smallest 4GB model. This allows it to be run on modest hardware and does not require GPU acceleration. The small model size bring limitations in what may be possible and how accurate the model will be at performing those tasks.

<!--
TODO - If I want to get the larger size model
curl -o ggml-alpaca-13b-q4.bin -C - https://gateway.estuary.tech/gw/ipfs/Qme6wyw9MzqbrUMpFNVq42rC1kSdko7MGT9CL7o1u9Cv9G
-->

## Detail

This is a Docker project and requires [Docker](https://www.docker.com/) to be installed on your computer. In addition, the Docker image is very large at around 4GB in size. However, it contains all of the required dependencies and model files to run the LLM. No other dependencies are required.

## Example

```
docker run --rm -ti gencore/alpaca.cpp:latest "List the five tallest mountains in height order. Display the results as a Markdown table."
```

## Chat Options

There are other options that could be used to further tune this command. These are detailed
in the help information of the `chat` binary.
```
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
```

## License

This project builds on the work of Stanford Univeristy, and applies the same usage restrictions. The full details of this are detailed [here](https://crfm.stanford.edu/2023/03/13/alpaca.html).

> We emphasize that Alpaca is intended only for academic research and any commercial use is prohibited. There are three factors in this decision: First, Alpaca is based on LLaMA, which has a non-commercial license, so we necessarily inherit this decision. Second, the instruction data is based on OpenAI’s text-davinci-003, whose terms of use prohibit developing models that compete with OpenAI. Finally, we have not designed adequate safety measures, so Alpaca is not ready to be deployed for general use.

Therefore we have [licensed](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode) this Docker project as Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License to be in keeping with the original intention.