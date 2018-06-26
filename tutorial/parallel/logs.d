module tutorial.parallel.logs;

import std.stdio : writeln;
import std.parallelism : taskPool, parallel;
import std.math : log;

void main() {
    auto logs = new double[10_000_000];

    foreach(i, ref elem; taskPool.parallel(logs)) {
        elem = log(i + 1.0);
    }

    writeln(logs.length);
}