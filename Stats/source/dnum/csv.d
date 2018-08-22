module dnum.csv;

import dnum.tensor;

import std.file : readText;
import std.array : split;
import std.conv : to;
import std.string : chop;

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

DataFrame read(string filename, bool header = false) {
  auto file = readText(filename).chop;
  auto temp = file.split("\n");

  Header head;

  if (header) {
    head = temp[0].split(",");
    temp = temp[1 .. $][];
  }

  double[][] container;
  container.length = temp.length;
  
  foreach (i; 0.. temp.length) {
    auto values = temp[i].split(",");
    auto l = values.length;
    container[i].length = l;
    foreach (j; 0 .. l) {
      container[i][j] = values[j].to!double;
    }
  }
  if (header) {
    return DataFrame(head, Tensor(container));
  } else {
    return DataFrame(Tensor(container));
  }
}
