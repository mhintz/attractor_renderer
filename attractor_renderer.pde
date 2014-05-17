Attractor attractor;

void setup() {
	size(1000, 600, P3D);

//	attractor = new LorenzAttractor();
//	attractor = new RosslerAttractor();
//	attractor = new AizawaAttractor();
//	attractor = new HalvorsenAttractor();
//	attractor = new ChenLeeAttractor();
	attractor = new QiChenAttractor();
}

void draw() {
	background(0);
	attractor.draw();
}

void keyPressed() {
	if (key == ' ') {
		save("frames/"+attractor.name+"-"+(System.currentTimeMillis() / 1000L)+".png"); // use unix time seconds as a uuid
	}
}

static class Util {
	public static float flSq(float n) {
		return (float) Math.pow(n, 2);
	}

	public static float flCu(float n) {
		return (float) Math.pow(n, 3);
	}
}