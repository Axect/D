import std.stdio;

void main() {
    write("What's your age? ");
    int age;
    readf(" %s", &age);

    write("What's your favorite number? ");
    int num;
    readf(" %s", &num); // Error!

    writeln("Your age is ", age, " and your favorite number is ", num);
}