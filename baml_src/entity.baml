enum Entity {
    MSFT
    TGO
    AAPL
    GOOGL
    AMZN
    NVDA
    INTC
    CSCO
    ORCL
    IBM
}

enum Sentiment {
    POSITIVE
    NEGATIVE
    NEUTRAL
}

class EntitySentiment {
    entity Entity @description("The entity that is being mentioned")
    sentiment Sentiment @description("The sentiment with which the entity is being mentioned")
}   

function ExtractEntitySentiments(message: string) -> EntitySentiment[] {
    client Gemini25Flash
    prompt #"

        Extract the entities and their sentiments from the following message:
        <message>
        {{ message }}
        </message>

        {{ ctx.output_format }}
    "#

}