import std.stdio : writeln, File;
import std.algorithm : joiner;
import std.csv;

void main() {
  auto file = File("test.csv", "r");
  file.byLine.joiner("\n").csvReader!int.writeln;
}
