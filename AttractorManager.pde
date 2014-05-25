class AttractorManager {

	Attractor mainAttractor = new Attractor();

	void setupAttractor(int index) {
		mainAttractor = makeAttractor(index);
		mainAttractor.genPts();
	}

	void draw() {
		mainAttractor.draw();
	}

	void saveFrame() {
		save("frames/"+mainAttractor.name+"-"+(System.currentTimeMillis() / 1000L)+".png"); // use unix time seconds as a uuid
	}

	Attractor makeAttractor(int index) {
		Attractor newAtrctr;
		switch (index) {
			case 0: newAtrctr = new AizawaAttractor(); break;
			case 1: newAtrctr = new BoualiAttractor(); break;
			case 2: newAtrctr = new ChenCelikovskyAttractor(); break;
			case 3: newAtrctr = new ChenLeeAttractor(); break;
			case 4: newAtrctr = new HadleyAttractor(); break;
			case 5: newAtrctr = new HalvorsenAttractor(); break;
			case 6: newAtrctr = new IkedaAttractor(); break;
			case 7: newAtrctr = new LiuChenAttractor(); break;
			case 8: newAtrctr = new LorenzAttractor(); break;
			case 9: newAtrctr = new LuChenAttractor(); break;
			case 10: newAtrctr = new NoseHooverAttractor(); break;
			case 11: newAtrctr = new PickoverAttractor(); break;
			case 12: newAtrctr = new QiChenAttractor(); break;
			case 13: newAtrctr = new RayleighBenardAttractor(); break;
			case 14: newAtrctr = new RosslerAttractor(); break;
			case 15: newAtrctr = new ThomasAttractor(); break;
			case 16: newAtrctr = new TSUCS1(); break;
			case 17: newAtrctr = new TSUCS2(); break;
			case 18: newAtrctr = new ZhouChenAttractor(); break;
			default: newAtrctr = new Attractor(); break;
		}
		return newAtrctr;
	}

	String[] getAvailableAttractors() {
		return attractorNames;
	}

	String[] attractorNames = { "Aizawa", "Bouali", "Chen-Celikovsky", "Chen-Lee", "Hadley", "Halvorsen", "Ikeda", "Liu-Chen", "Lorenz", "Lu-Chen", "Nose-Hoover", "Pickover", "Qi-Chen", "Rayleigh-Benard", "Rossler", "Thomas", "Three-Scroll Unified Chaotic System 1", "Three-Scroll Unified Chaotic System 2", "Zhou-Chen" };
}