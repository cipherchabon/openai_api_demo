adding a simple adjective to our prompt changes the resulting completion.

In many cases, it’s helpful to both show and tell the model what you want. Adding examples to your prompt can help communicate patterns or nuances. 

Temperature is a value between 0 and 1 that essentially lets you control how confident the model should be when making these predictions. Lowering temperature means it will take fewer risks, and completions will be more accurate and deterministic. Increasing temperature will result in more diverse completions.

It’s usually best to set a low temperature for tasks where the desired output is well-defined. Higher temperature may be useful for tasks where variety or creativity are desired, or if you'd like to generate a few variations for your end users or human experts to choose from.

We recommend using 'text-davinci-003' model or 'gpt-3.5-turbo' while experimenting since they will yield the best results. Once you’ve got things working, you can see if the other models can produce the same results with lower latency and costs. Or if you might need to move to a more powerful model like 'gpt-4'.

The total number of tokens processed in a single request (both prompt and completion) can’t exceed the model's maximum context length. For most models, this is 4,096 tokens or about 3,000 words. As a rough rule of thumb, 1 token is approximately 4 characters or 0.75 words for English text.

Pricing is pay-as-you-go per 1,000 tokens, with $5 in free credit that can be used during your first 3 months.