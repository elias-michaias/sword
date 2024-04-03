# onyx-functional-web

An experimental functional API for more easily leveraging Onyx's JavaScript interop.

```fsharp
    x := 0;

    DOM 
    |> create("button") 
    |> append()
    |> inner("Click me!")
    |> click((this, [x]) => {
        x+=1;

        this 
        |> inner(x);

        if x < 2 {
            alert("It's reactive!");
        }
    });

    DOM
    |> get_id("grabbable")
    |> click((this) => {
        this
        |> inner("I was clicked!");
    });
```