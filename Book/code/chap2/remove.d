import std.stdio;
import std.algorithm;

void main() {
    int[] array = [ 10, 42, 20, 30, 42, 40 ];
    array = array.remove!(a => a == 42);
    writeln(array);
}