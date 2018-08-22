import std.stdio : writeln;
import std.file : readText;
import std.array : split;
import std.conv : to;
import std.string : chop;

void main() {
  auto file = readText("test.csv").chop;
  auto temp = file.split("\n");
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
  container.writeln;
}
