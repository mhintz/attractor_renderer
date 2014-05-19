Attractor attractor;

void setup() {
	size(1000, 700, P3D);

/* attractor options */
//	attractor = new AizawaAttractor();
//	attractor = new ChenCelikovskyAttractor();
//	attractor = new ChenLeeAttractor();
//	attractor = new HadleyAttractor();
//	attractor = new HalvorsenAttractor();
//	attractor = new LiuChenAttractor();
//	attractor = new LorenzAttractor();
//	attractor = new LuChenAttractor();
//	attractor = new NoseHooverAttractor();
	attractor = new PickoverAttractor();
//	attractor = new QiChenAttractor();
//	attractor = new RayleighBenardAttractor();
//	attractor = new RosslerAttractor();
//	attractor = new ThomasAttractor();
//	attractor = new TSUCS1();
//	attractor = new TSUCS2();
//	attractor = new ZhouChenAttractor();

	attractor.genPts(); // should always be called on initialization but only after the derived class constructor
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