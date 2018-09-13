/* Enter your code here. Read input from STDIN. Print output to STDOUT */
import std.stdio : writeln, readln;
import std.algorithm: map, splitter;
import std.array : array;
import std.conv : to;

void main() {
    list xs;
    string temp;
    temp = readln;
    temp = readln;
    xs = temp.splitter().map!(to!double).array;
    writeln(xs.mean);
    writeln(xs.median);
    writeln(xs.mode);
    writeln(xs.std);
}

alias list = double[];

double mean(list xs) {
    double s = 0;
    foreach(x; xs) {
        s += x;
    }
    return s / cast(double)(xs.length);
}

double median(list xs) {
    list result = qsort(xs);
    return result[xs.length / 2];
}

double mode(list xs) {
    double max;
    int history = 0;
    foreach(i, ref x; xs) {
        int count = 0;
        foreach(j; (i+1)..xs.length) {
            if (xs[j] == x) {
                count++;
            }
        }
        if (history <= count) {
            history = count;
            max = x;
        }
    }
    return max;
}

double std(list xs) {
    import std.math : sqrt;
    double s = 0;
    double m = mean(xs);
    foreach(x; xs) {
        s += (x - m) ^^ 2;
    }
    return sqrt(s / cast(double)(xs.length));
}

list qsort(list xs) {
    if (xs.length == 0 || xs.length == 1) {
        return xs;
    }
    double p = xs[xs.length / 2];
    list less;
    list more;
    list equal;
    foreach(x; xs) {
        if (x < p) {
            less ~= x;
        } else if (x == p) {
            equal ~= x;
        } else {
            more ~= x;
        }
    }
    return qsort(less) ~ equal ~ qsort(more);
}