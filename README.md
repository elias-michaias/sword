# sword
Sword is a **fine-grained, functional, front-end** framework for the web that leverages the power of the *Onyx* programming language and runs on WebAssembly.

Sword is still in very early development.

## Example:
```fsharp
main :: () {

    count := signal(0);

    counter_h1 := get_dom()
    |> query("h1#counter")
    |> react_inner("Count: ", count);

    new_button := get_dom()
    |> create("button")
    |> set_inner("Increment")
    |> append(get_body())
    |> click(([count]) => {
        count->set(count->get() + 1);
    });

}
```

## Installation:
`onyx  add https://github.com/elias-michaias/sword`