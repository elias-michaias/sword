# sword-onyx
Sword is a **fine-grained, functional, front-end** framework for the web that leverages the power of the *Onyx* programming language and runs on WebAssembly.

Sword is still in very early development.

## Example:
```fsharp
main :: () {

    counter_h1 := get_dom()
    |> query("h1#counter");
    
    count := signal(0);

    effect(([count, counter_h1]) => {
        counter_h1 |> set_text(count->get()?);
    });

    new_button := get_dom()
    |> create("button")
    |> set_inner("Increment")
    |> append(get_body())
    |> click((el, [count]) => {
        count->set(count->get()->unwrap() + 1);
    });

}
```