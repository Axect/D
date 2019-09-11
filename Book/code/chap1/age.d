module Book.code.chap1.age;import std.stdio : readf, write, writeln;

void main() {
    write("How old are you? ");

    int age;
    readf(" %s", &age); // White space needed
    writeln("Got it: Your age is ", age);
}