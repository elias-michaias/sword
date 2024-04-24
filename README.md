# sword
Sword is a **fine-grained, functional-first, front-end** framework for the web that leverages the power of the *Onyx* programming language and runs on WebAssembly.

Sword is still in active and early development and as of current relies on the nightly version of Onyx.

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
|> keep(el => el
    |> get_children
    |> batch(el, i => el |> set_text("I'm Div #", i))
)
|> onclick(el => el |> remove())
```

# Installation
```
onyx self-upgrade nightly
onyx add https://github.com/elias-michaias/sword
```
