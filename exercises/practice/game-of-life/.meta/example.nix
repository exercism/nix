let
  inherit (import <nixpkgs/lib>)
    genList
    elemAt
    length
    cartesianProduct
    remove
    ;

  cellAt =
    matrix:
    { x, y }:
    if x < 0 || x >= length matrix || y < 0 || y >= length (elemAt matrix 0) then
      0
    else
      elemAt (elemAt matrix x) y;

  nextCell =
    matrix: x: y:
    let
      curPos = { inherit x y; };
      alive = cellAt matrix curPos == 1;
      neighbors = remove curPos (cartesianProduct {
        x = [
          (x - 1)
          x
          (x + 1)
        ];
        y = [
          (y - 1)
          y
          (y + 1)
        ];
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
    genList (row: genList (col: nextCell matrix row col) cols) rows;
}
