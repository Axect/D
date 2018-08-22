module dnum.csv;

import dnum.tensor;

import std.csv;
import std.stdio : File;

Tensor readcsv(string filename) {
  auto file = File(filename, "r");
  string st = file.readln();

}
