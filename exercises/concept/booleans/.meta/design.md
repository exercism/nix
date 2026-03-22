# Design

## Goal

Teach boolean values and conditional expressions through the well-known leap year algorithm.

## Learning Objectives

- Know that booleans in Nix are `true` and `false`
- Know how to use `if/then/else` expressions (both branches required; no standalone `if`)
- Know that Nix has no "truthy" values — conditions must be boolean
- Know how to use `&&`, `||`, `!` boolean operators
- Know how to use comparison operators: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Know how to use `builtins.rem` for modulo (Nix has no `%` operator)

## Concepts

`booleans`

## Prerequisites

None

## Rationale

The leap year algorithm is ideal for teaching booleans because:

- It requires multiple boolean conditions combined with `&&` and `||`
- The nested divisibility rules map directly to nested `if/then/else`
- The lack of a `%` operator forces students to discover `builtins.rem` early
- The algorithm is widely understood so students can focus on the language, not the problem
