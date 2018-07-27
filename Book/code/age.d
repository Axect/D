import std.stdio : readf, write, writeln;

void main() {
    write("How old are you? ");

    int age;
    readf("%s", &age);
    writeln("Got it: Your age is ", age);
}