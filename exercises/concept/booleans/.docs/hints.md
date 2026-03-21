# Hints

## General

- A year is a leap year if divisible by 4, _unless_ it is divisible by 100 — but years divisible by 400 are always leap years.
- Nix has no `%` operator and no built-in remainder function. Define your own `mod` using integer division.

## Implementing Modulo

```nix
let
  mod = a: b: a - (b * (a / b));
in
  mod 10 3  # 1  →  10 is not divisible by 3
  mod 9 3   # 0  →  9 is divisible by 3
```

Use `mod year divisor == 0` to check divisibility.

## Ordering Your Checks

Order from most specific to least specific:

1. Divisible by 400 → leap year
2. Divisible by 100 → not a leap year
3. Divisible by 4 → leap year
4. Otherwise → not a leap year
