module dnum.csv;

import dnum.tensor;

import std.csv;
import std.conv : to;
import std.stdio : File;
import std.algorithm : joiner;
import std.typecons : Tuple;
import std.range : take, drop;
import std.array : array;

alias Header = string[];

struct DataFrame {
  Header header;
  Tensor data;

  this(Header h, Tensor t) {
    this.header = h;
    this.data = t;
  }

  this(Tensor t) {
    this.data = t;

    Header h;
    h.length = t.ncol;
    foreach (i, ref head; h) {
      head = to!string(i);
    }
    this.header = h;
  }
}

DataFrame readcsv(string filename, bool header=false) {
  auto file = File(filename, "r");
  if (!header) {
    auto l = file.byLine.array.length;
    auto value = file.byLine.joiner("\n").csvReader!double;
    double[][] container;
    container.length = l;
    foreach (i; 0 .. l) {
      container[i] = value[i];
    }
    return DataFrame(Tensor(container));
  } else {
    auto value = file.byLine.joiner("\n");
    auto h = value.csvReader(null);
    auto t = value.drop(1).csvReader!double;
    return DataFrame(h, Tensor(t));
  }
}
