import { b } from "../baml_client/async_client";

console.log(
	await b.ExtractEntitySentiments(
		"I love Microsoft and I hate Google; Oracle's stock is down 10% but I am still very bullish on the company; and Apple's products are oversaturated.",
	),
);
