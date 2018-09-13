import std.stdio : writeln;

void main() {
    qsort([5,5,8,9,2,4,3,3,1]).writeln;
}

alias array = double[];

array qsort(array xs) {
    if (xs.length == 0 || xs.length == 1) {
        return xs;
    }
    double p = xs[xs.length / 2];
    array less;
    array more;
    array equal;
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