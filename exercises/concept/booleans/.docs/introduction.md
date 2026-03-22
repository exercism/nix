# Introduction

## Booleans

In Nix, booleans are represented by the literal values `true` and `false`.

## Conditional Expressions

Nix uses `if/then/else` expressions for conditional logic. Both branches are required:

```nix
if condition then value1 else value2
```

The condition must evaluate to exactly `true` or `false`. Nix has no "truthy" values.

`if/then/else` can be nested to handle multiple conditions:

```nix
if x > 0 then "positive"
else if x < 0 then "negative"
else "zero"
```

## Boolean Operators

Nix supports `&&` (AND), `||` (OR), and `!` (NOT):

```nix
true && false  # false
true || false  # true
!true          # false
```

## Comparison Operators

Use `==`, `!=`, `<`, `>`, `<=`, `>=` to compare values:

```nix
5 > 3    # true
5 == 5   # true
5 != 3   # true
```

## Modulo in Nix

Nix has no `%` operator and no built-in remainder function. You can define modulo yourself using integer division (`/`):

```nix
let
  mod = a: b: a - (b * (a / b));
in
  mod 10 3  # 1
```

Use it with `==` to check divisibility:

```nix
mod year 4 == 0  # true if year is divisible by 4
```
