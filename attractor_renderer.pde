Attractor attractor;

void setup() {
	size(1000, 600, P3D);

	attractor = new RosslerAttractor();
}

void draw() {
	background(0);
	attractor.draw();
}