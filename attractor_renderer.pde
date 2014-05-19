Attractor attractor;

void setup() {
	size(1000, 600, P3D);

//	attractor = new AizawaAttractor();
//	attractor = new ChenLeeAttractor();
//	attractor = new HalvorsenAttractor();
//	attractor = new LorenzAttractor();
//	attractor = new QiChenAttractor();
//	attractor = new RosslerAttractor();
	attractor = new TSUCS2();
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

static float flSq(float n) {
	return (float) Math.pow(n, 2);
}

static float flCu(float n) {
	return (float) Math.pow(n, 3);
}

static void calcVecMax(PVector store, PVector pt) {
	store.x = Math.max(store.x, pt.x);
	store.y = Math.max(store.y, pt.y);
	store.z = Math.max(store.z, pt.z);
}

static void calcVecMin(PVector store, PVector pt) {
	store.x = Math.min(store.x, pt.x);
	store.y = Math.min(store.y, pt.y);
	store.z = Math.min(store.z, pt.z);
}