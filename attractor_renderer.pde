import controlP5.*; // GUI library

ControlP5 cp5;
DropdownList attractorList;

Attractor attractor;

AttractorType[] attractorNames = { AttractorType.AIZAWA, AttractorType.BOUALI, AttractorType.CHENCELIKOVSKY, AttractorType.CHENLEE, AttractorType.HADLEY, AttractorType.HALVORSEN, AttractorType.IKEDA, AttractorType.LIUCHEN, AttractorType.LORENZ, AttractorType.LUCHEN, AttractorType.NOSEHOOVER, AttractorType.PICKOVER, AttractorType.QICHEN, AttractorType.RAYLEIGHBENARD, AttractorType.ROSSLER, AttractorType.THOMAS, AttractorType.TSUCS1, AttractorType.TSUCS2, AttractorType.ZHOUCHEN };

Attractor makeAttractor(AttractorType type) {
	Attractor attractor = null;
	switch (type) {
		case AIZAWA: attractor = new AizawaAttractor(); break;
		case BOUALI: attractor = new BoualiAttractor(); break;
		case CHENCELIKOVSKY: attractor = new ChenCelikovskyAttractor(); break;
		case CHENLEE: attractor = new ChenLeeAttractor(); break;
		case HADLEY: attractor = new HadleyAttractor(); break;
		case HALVORSEN: attractor = new HalvorsenAttractor(); break;
		case IKEDA: attractor = new IkedaAttractor(); break;
		case LIUCHEN: attractor = new LiuChenAttractor(); break;
		case LORENZ: attractor = new LorenzAttractor(); break;
		case LUCHEN: attractor = new LuChenAttractor(); break;
		case NOSEHOOVER: attractor = new NoseHooverAttractor(); break;
		case PICKOVER: attractor = new PickoverAttractor(); break;
		case QICHEN: attractor = new QiChenAttractor(); break;
		case RAYLEIGHBENARD: attractor = new RayleighBenardAttractor(); break;
		case ROSSLER: attractor = new RosslerAttractor(); break;
		case THOMAS: attractor = new ThomasAttractor(); break;
		case TSUCS1: attractor = new TSUCS1(); break;
		case TSUCS2: attractor = new TSUCS2(); break;
		case ZHOUCHEN: attractor = new ZhouChenAttractor(); break;
	}
	return attractor;
}

void setupAttractor(AttractorType newType) {
	attractor = makeAttractor(newType);
	attractor.genPts(); // should always be called on initialization but only after the derived class constructor
}

void setup() {
	size(displayWidth, displayHeight, P3D);

	cp5 = new ControlP5(this);
	attractorList = setupAttractorList(cp5.addDropdownList("attractorList"));

	setupAttractor(AttractorType.NOSEHOOVER);
}

boolean sketchFullScreen() {
	return true;
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

void controlEvent(ControlEvent evt) {
	if (evt.isGroup()) {
		println("group: ", evt.getGroup().getValue());
	} else if (evt.isController()) {
		println("controller: ", evt.getController().getValue());
	}
}

DropdownList setupAttractorList(DropdownList newList) {
	newList.setPosition(20, 20);
	newList.setSize(300, 60);
	newList.
	return newList;
}

// utils
static float flSin(float n) {
	return (float) Math.sin(n);
}

static float flCos(float n) {
	return (float) Math.cos(n);
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