module tutorial.structs.structs;

struct Vector3 {
    double x;
    double y;
    double z;

    double length() const {
        import std.math : sqrt;
        return sqrt(x^^2 + y^^2 + z^^2);
    }

    double dot(Vector3 rhs) const {
        return this.x * rhs.x + this.y * rhs.y + this.z * rhs.z;
    }
}

void main() {
    auto vec1 = Vector3(10, 0, 0);
    Vector3 vec2;
    vec2.x = 0;
    vec2.y = 20;
    vec2.z = 0;

    assert(vec1.length == 10);
    assert(vec2.length == 20);

    assert(vec1.dot(vec2) == 0);

    auto vec3 = Vector3(1,2,3);
    assert(vec3.dot(Vector3(1,1,1)) == 6);

    assert(vec3.dot(Vector3(3,2,1)) == 10);
}