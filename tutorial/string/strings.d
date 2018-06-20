void main() {
  import std.stdio : writeln, writefln;
  import std.range : walkLength;
  import std.uni : byGrapheme;
  import std.string : format;

  string str = format("%s %s", "Hellő", "Wőrld");
  writeln("My string: ", str);
  writeln("Array length (code unit count)" ~ " of string: ", str.length);
  writeln("Range length (code point count)" ~ " of string: ", str.walkLength);
  writeln("Character length (grapheme count)" ~ " of string: ", str.byGrapheme.walkLength);

  import std.array : replace;
  writeln(replace(str, "lő", "lo"));
  import std.algorithm : endsWith;
  writefln("Does %s end with 'rld'? %s", str, endsWith(str, "rld"));

  import std.conv : to;
  dstring dstr = to!dstring(str);
  writeln("My dstring: ", dstr);
}
