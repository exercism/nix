# Introduction

In Nix, booleans are represented by the literal values `true` and `false`.

Nix uses `if/then/else` for conditional logic. Both branches are required:

```nix
if condition then value1 else value2
```

The condition must be exactly `true` or `false`. Nix has no "truthy" values.

Boolean operators: `&&` (AND), `||` (OR), `!` (NOT).

Nix has no `%` operator. Implement modulo using integer division:

```nix
let mod = a: b: a - (b * (a / b)); in mod 10 3  # 1
```
