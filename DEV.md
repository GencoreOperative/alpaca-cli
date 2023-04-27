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


## Performance Testing

Looking at the performance of the LLM when given the same task, we can see how its
performance changes based on the number of CPUs allocated. This test was conducted
on a Intel(R) Core(TM) i9-10885H CPU @ 2.40GHz with the following specifications:

```
CPU(s):                          16
On-line CPU(s) list:             0-15
Thread(s) per core:              2
Core(s) per socket:              8
```

Timing the output of this LLM has proven tricky. The `--seed` command does not appear 
to fix the output generated, so instead we have aimed to use a prompt that should
tend towards a consistent output.

The primary cost of time when generating answers is the per-word count of the output. 
We want to measure how long on average it takes to complete a task based on the number
of CPUs that are provided to the LLM. Our basic assumption is that more CPUs are better.

By modifing the number of `--threads` we provide to `./chat` we can use the following
script to then repeatedly time how long it takes to generate the output:

```
./time.sh.
```

| CPUs | Percentage |  Average (seconds) |
|------|------------|--------------------|
| 1    | 6.25%      | 139.1              |
| 2    | 12.5%      | 70.7               |
| 4    | 25%        | 39.1               |
| 8    | 50%        | 31.6               |
| 10   | 62.5%      | 25.7               |
| 12   | 75%        | 34.2               |
| 14   | 87.5%      | 27.4               |
| 16   | 100%       | 63.9

This shows that once we allocate around half the number of system CPUs we are achieving close to the 
optimal performance. This is useful to be aware of as we do not want to swamp the system for little
additional gain.

## Larger Models

This download link may no longer exist.

TODO - If I want to get the larger size model
curl -o ggml-alpaca-13b-q4.bin -C - https://gateway.estuary.tech/gw/ipfs/Qme6wyw9MzqbrUMpFNVq42rC1kSdko7MGT9CL7o1u9Cv9G