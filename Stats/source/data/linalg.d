module data.linalg;

import data.tensor;
import std.typecons : tuple;

Tensor eye(long n) {
    auto I = Tensor(0, n, n);
    foreach(i, ref rows; I.data) {
        rows[i] = 1;
    }
    return I;
}

auto lu(Tensor m) {
    auto n = m.nrow;

    auto u = Tensor(0, n, n);
    auto l = eye(n);

    u.data[0] = m.data[0][];

    foreach(i; 0 .. n) {
        foreach(k; i .. n) {
            double s = 0;
            foreach(j; 0 .. i) {
                s += l[i, j] * u[j, k];
            }
            u[i, k] = m[i, k] - s;
        }

        foreach(k; i+1 .. n) {
            double s = 0;
            foreach(j; 0 .. i) {
                s += l[k, j] * u[j, i];
            }
            l[k, i] = (m[k, i] - s) / u[i, i];
        }
    }
    return tuple(l, u);
}

auto det(Tensor m) {
    auto u = m.lu[1];
    double s = 1;

    foreach(i, ref rows; u.data) {
        s *= rows[i];
    }
    return s;
}