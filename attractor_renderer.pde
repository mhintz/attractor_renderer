Attractor attractor;

void setup() {
	size(1000, 600, P3D);

//	attractor = new LorenzAttractor();
//	attractor = new RosslerAttractor();
	attractor = new AizawaAttractor();
}

void draw() {
	background(0);
	attractor.draw();
}