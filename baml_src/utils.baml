class NameInformation {
    firstName string @description("The first name of the person")
    lastName string @description("The last name of the person")
}

function ExtractName(message: string) -> NameInformation {
    client Gemini25Flash
    prompt #"

        Extract the first and last name from the following message based on the following description:
        <message>
        {{ message }}
        </message>


        {{ ctx.output_format }}

    "#
}

test TestNameExtraction {
    functions [ExtractName]
    args {
        message "Hello, my name is Kyle Mistele and I live at 2820 McKinnon Street in Dallas TX"
    }

    @@check( check_first_name, {{ this.firstName == "Kyle" }})
    @@check( check_last_name, {{ this.lastName == "Mistele" }})

}