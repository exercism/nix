# About

In Nix, booleans are represented by the literal values `true` and `false`.

## Conditional Expressions

Nix uses `if/then/else` expressions for conditional logic. Both the `then` and `else` branches are required — there is no standalone `if`:

```nix
if condition then value1 else value2
```

The condition must evaluate to exactly `true` or `false`. Unlike many languages, Nix has no "truthy" concept.

```nix
if 1 > 0 then "positive" else "non-positive"  # "positive"
```

`if/then/else` is an expression, not a statement, so it always produces a value and can be nested:

```nix
if x > 0 then "positive"
else if x < 0 then "negative"
else "zero"
```

## Boolean Operators

| Operator | Meaning     | Example               |
|----------|-------------|----------------------|
| `&&`     | logical AND | `true && false` → `false` |
| `\|\|`     | logical OR  | `true \|\| false` → `true`  |
| `!`      | logical NOT | `!true` → `false`     |

## Comparison Operators

Nix supports `==`, `!=`, `<`, `>`, `<=`, `>=` for comparing values:

```nix
5 > 3    # true
5 == 5   # true
5 != 3   # true
```

## Modulo in Nix

Nix has no `%` operator and no built-in remainder function. You can implement modulo using integer division (`/`) or by importing the `nixpkgs.lib.trivial.mod` function. To define it using integer division:

```nix
let
  mod = a: b: a - (b * (a / b));
in {
  test1 = mod 10 3;   # 1
  test2 = mod 9 3;    # 0
  test3 = mod 100 4;  # 0
}
```

Combining this with `==` lets you check divisibility:

```nix
mod year 4 == 0  # true if year is divisible by 4
```

Alternatively, nixpkgs provides `lib.trivial.mod`, which has the same behaviour. Since the
test files already import nixpkgs, it is available without any extra setup:

```nix
let
  lib = import <nixpkgs/lib>;
in
  lib.trivial.mod 10 3  # 1
```
