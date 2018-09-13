import std.stdio : writeln;

import fptools.fp;

void main() {
	mixin FP!double;

	Pipe p;
	p.input(seq(1,10));
	p.proc(
		map(x => x + 1)
	);
	p.output.writeln;
}