module tutorial.parallel.logs_single;

import std.stdio : writeln;
import std.math : log;

void main() {
    auto logs = new double[10_000_000];

    foreach(i, ref elem; logs) {
        elem = log(i + 1.0);
    }

    writeln(logs.length);
}