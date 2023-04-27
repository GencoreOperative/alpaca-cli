<!--
Copyright 2023 GencoreOperative

Licensed under Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License
-->

## Overview


A Docker command line utility to run a chat-like Large Language Model (LLM) locally on your computer. It provides command line access to an instruction-oriented model that can respond to requests. This project is entirely based on the excellent [alpaca.cpp](https://github.com/antimatter15/alpaca.cpp) project by Antimatter15.

The model is itself based on the [Alpaca project](https://crfm.stanford.edu/2023/03/13/alpaca.html) by Stanford University.

The project is designed to work well on laptops and defaults to using the smallest 4GB model. This allows it to be run on modest hardware and does not require GPU acceleration. The small model size does however bring limitations in what may be possible and how accurate the model will be at performing those tasks. Larger models may be available for individuals to explore.

## Detail

This is a Docker project and requires [Docker](https://www.docker.com/) to be installed on your computer. In addition, the Docker image is very large at around 4GB in size. The Docker image is self-contained and packaged all required dependencies and model files in order to run the LLM. No other dependencies are required.

## Example: Ask

A simple script is provided with the project that will invoke the Docker image with a provided prompt question:

```
ask "List the five tallest mountains in height order. Display the results as a table."
```

This will output something along these lines:

```
Name                         | Elevation (ft) 
------------------------|---------------
Mount McKinley            | 20,319 ft  
Mount Kilimanjaro       | 19,854 ft   
Mount Everest             | 16,764 ft    
Kangchenjunga              | 18,800 ft     
Lhotse                        | 20,310 ft
```

## Example: Interactive

If we want to initiate the interactive mode we can use the interactive mode. Please note that this LLM does not have a chat memory like other larger models. The main benefit of this mode is to avoid the repeated startup time of the model.

```
ask-interactive "What are the tallest mountains in the world?"
```



## Limitations

This LLM is limited in its capability. These limitations are part of the model that is used. From the [Stanford Alpaca](https://crfm.stanford.edu/2023/03/13/alpaca.html) article on the subject:

> Alpaca also exhibits several common deficiencies of language models, including hallucination, toxicity, and stereotypes. Hallucination in particular seems to be a common failure mode for Alpaca, even compared to text-davinci-003.

As per the Standford Alpaca license, this model should not be considered suitable for commerical or production usage.

## License

This project builds on the work of Stanford Univeristy. Therefore, we have sought to apply the same usage restrictions with a Creative Commons [license](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode) to this Docker project.

The full details of the Stanford license are detailed in the [article](https://crfm.stanford.edu/2023/03/13/alpaca.html).

> We emphasize that Alpaca is intended only for academic research and any commercial use is prohibited. There are three factors in this decision: First, Alpaca is based on LLaMA, which has a non-commercial license, so we necessarily inherit this decision. Second, the instruction data is based on OpenAI’s text-davinci-003, whose terms of use prohibit developing models that compete with OpenAI. Finally, we have not designed adequate safety measures, so Alpaca is not ready to be deployed for general use.