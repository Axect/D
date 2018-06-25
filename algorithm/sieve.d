module algorithm.sieve;

void main() {
    import std.stdio : writeln;
    sieve(1000).writeln;
}

/++
    markSieve marks boolean flag to determine prime numbers.
+/
bool[] markSieve(int l) {
    import std.math : sqrt;
    
    bool[] marks;
    marks.length = l;
    int m = cast(int) sqrt(cast(double)l);

    // Initialize with True
    marks[] = true;

    // For 1, 2, 3
    marks[0] = false;
    marks[1] = true;
    marks[2] = true;

    // Remove even numbers
    foreach(i; 1 .. cast(int) l/2) {
        marks[i + i + 1] = false;
    }

    // Main Mark Sieve
    int n = 3;
    while (n <= m) {
        const int factor = n + n;
        int multiplier = n + factor;
        while (multiplier <= l) {
            marks[multiplier - 1] = false;
            multiplier += factor;
        }
        ++n;
    }

    return marks;
}

int[] sieve(int n) {
    bool[] ms = markSieve(n);
    int[] result;
    foreach(i; 0 .. n) {
        if (ms[i]) {
            result ~= i+1;
        }
    }
    
    return result;
}