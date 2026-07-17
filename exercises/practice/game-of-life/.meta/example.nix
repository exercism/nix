let
  inherit (import <nixpkgs/lib>)
    genList
    elemAt
    length
    cartesianProduct
    remove
    range
    ;

  cellAt =
    matrix:
    { x, y }:
    if x < 0 || x >= length matrix || y < 0 || y >= length (elemAt matrix 0) then
      0
    else
      elemAt (elemAt matrix x) y;

  nextCell =
    matrix:
    { x, y }@curPos:
    let
      alive = cellAt matrix curPos == 1;
      neighbors = remove curPos (cartesianProduct {
        x = map (builtins.add x) (range (-1) 1);
        y = map (builtins.add y) (range (-1) 1);
      });
      liveNeighbors = builtins.foldl' (acc: pos: cellAt matrix pos + acc) 0 neighbors;
    in
    if alive && liveNeighbors == 2 || liveNeighbors == 3 then 1 else 0;
in
{
  tick =
    matrix:
    let
      rows = length matrix;
      cols = if rows == 0 then 0 else length (elemAt matrix 0);
    in
    genList (x: genList (y: nextCell matrix { inherit x y; }) cols) rows;
}
