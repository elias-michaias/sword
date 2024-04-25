# sword
Sword is a **fine-grained, function-first, front-end** framework for the web that leverages the power of the *Onyx* programming language and runs on WebAssembly.

Sword is still in active and early development and as of current relies on the nightly version of Onyx.

```fsharp
greeting :: (name: str) =>
    div(class="greeting", id=name)(
        // Get excited!
        h1("Hello ", name) |> onclick(el => el |> extend("!"))
        style("text-decoration: underline")
    )

greeting("Bob") |> append(get_body())
greeting("Sarah") |> append(get_body())
```

# Philosophy
Sword seeks to stay away from a very macro-heavy way of web development which is very common. Macros can enable very
nice and exact syntax, but they can also introduce a lot of complexity, forcing the library developer and the programmer
to fight with a new syntax, in which everything is redefined in such a way that has to be effectively compatible with the
host language. Instead, Sword wants to enable markup inside of true Onyx syntax, and tap into the powers that the language
has available to it by default without reinventing four-hundred wheels. As a result there is not a distinct notion of a "component" or a "property" in Sword as is common in
most web frameworks - and this is because every "component" and "property" is, in actuality, just a procedure (or function)
with arguments. This greatly boosts flexibility and allows you to be much more programmatic with your markup manipulation
and introduces some very nice benefits like type-safety on properties and easy handling of state. 

Sword is philosophically comprised of three core tenents: ***simplicity, composability, and beauty.*** 
1. Sword is ***simple.*** If you have a good understanding of HTML and CSS, and a decent working knowledge
of core programming concepts, it should be easy to pick up Sword and begin creating UIs that are dynamic,
interactive, and performant. No more of a framework jumping out with lots of complex classes and APIs that cause you to feel like you're no longer working with the language that you are - Sword is designed to feel like you're using Onyx how it is. Instead of crowding the developer with a ridiculous amount of features, Sword wants to get out of your way.
2. Sword is ***composable.*** Every piece of a UI can quickly and easily be pulled into components, manipulated and extended upon
as a template for further components, and ultimately handled however the programmer may wish. There is no view macro, there is no alternative syntax, there is no special rule for defining components and properties, and there is nothing besides pure programming
power. Composability doesn't just apply to the macro level; it also applies to the micro. Every individual HTML element can be composed of reusable attributes via currying and piped into extension functions to truly leverage composability at every level of programming.
3. Sword is ***beautiful.*** If a tool is not fun to use (either to write or read) it will never truly sustain itself. Sword is
designed to be beautiful to look at, to write in, to work with - abstracting away what deserves to be abstracted without removing agency from the programmer and taking control out of their hands. Sword should be *fun* to work with everyday, so that your job won't suck. 

# Examples
Here are some examples of Sword in action:

## Reactivity
```fsharp
count := signal(0)

div (
    "Count: ", count
    div (
        style("color: blue; padding: 2em; border: 1px solid blue")
        "Increment"
    ) |> onclick(([count]) => count->set(count->get() + 1))
)
```

## DOM querying
```fsharp
count := signal(0)

counter_h1 := get_dom()
|> query("h1#counter")
|> react_inner("Count: ", count)

new_button := get_dom()
|> create("button")
|> set_inner("Increment")
|> append(get_body())
|> onclick(([count]) => count->set(count->get() + 1))
```

## View templating
```fsharp
reusable_attr_div := div(class="curried" id="composable" style="color: blue")

header_text := h1(style="color: green") (
    "Hello World!"
)

main_view :=
    div (
        id("non-curried")
        style("color: red; margin: 1em")

        header_text
        |> extend(
            "Extend onto existing elements."
            div (
                "A div in an h1"
            )
        )

        "Check it out!"

        reusable_attr_div (
            "Use the curried form to define attributes first and reuse them!"
        )
    )
    |> append(get_body())
```

## Batch functions
```fsharp
div(
    div()
    div()
    div()
)
// Could batch right away, but want to preserve parent div for later piping
|> keep(el => el
    |> get_children
    |> batch(el, i => el |> set_text("I'm Div #", i))
)
|> onclick(el => el |> remove())
```

## Properties and Components
```fsharp
count := signal(0)

// "Components" and "props" are just functions and arguments
counter :: (input: Signal(i32), num: i32) =>
    div(class="main")(
        h1("Count #", num, ": ", input)
        button("Increment") |> onclick(([input]) => input->increment())
        button("Decrement") |> onclick(([input]) => input->decrement())
    )

counter(count, 1) |> append(get_body())

// Sync state across components with signal arguments
counter(count, 2) |> append(get_body())

// Pass anonymous signals as props to isolate state
counter(signal(0), 3) |> append(get_body())
```

# Installation
```
onyx self-upgrade nightly
onyx add https://github.com/elias-michaias/sword
```
