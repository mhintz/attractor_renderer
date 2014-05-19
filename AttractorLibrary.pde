// source: http://www.behance.net/gallery/MathRules-Strange-Attractors/7618879
class AizawaAttractor extends Attractor {
	float pA = 0.95;
	float pB = 0.7;
	float pC = 0.6;
	float pD = 3.5;
	float pE = 0.25;
	float pF = 0.1;

	AizawaAttractor() {
		name = "Aizawa";
		maxIter = 20000;
		lastPt = new PVector(0.1, 0, 0);
		sP = 0.01;
		magFactor = 160;
		adjX = 0;
		adjY = 0;
		adjZ = -100;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts(); // generates the points in this attractor
	}

	PVector getDelta() {
		float x = lastPt.x;
		float y = lastPt.y;
		float z = lastPt.z;
		float dx = (z - pB) * x - pD * y;
		float dy = pD * x + (z - pB) * y;
		float dz = pC + pA * z - (flCu(z) / 3) - ((flSq(x) + flSq(y)) * (1 + pE * z)) + pF * z * flCu(x);
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite8.html
class ChenLeeAttractor extends Attractor {
	float pA = 5;
	float pB = -10;
	float pC = -0.38;

	ChenLeeAttractor() {
		name = "Chen-Lee";
		maxIter = 20000;
		lastPt = new PVector(1, 0, 4.5);
		sP = 0.004;
		magFactor = 12;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts();
	}

	PVector getDelta() {
		float dx = pA * lastPt.x - lastPt.y * lastPt.z;
		float dy = pB * lastPt.y + lastPt.x * lastPt.z;
		float dz = pC * lastPt.z + lastPt.x * lastPt.y / 3;
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite13.html
class HalvorsenAttractor extends Attractor {
	float pA = 1.4;
	float pB = 4;

	HalvorsenAttractor() {
		name = "Halvorsen";
		maxIter = 40000;
		lastPt = new PVector(1, 0, 0);
		sP = 0.004;
		magFactor = 23;
		adjX = 40;
		adjY = 50;
		adjZ = -100;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts();
	}

	PVector getDelta() {
		float x = lastPt.x;
		float y = lastPt.y;
		float z = lastPt.z;
		float dx = - pA * x - pB * y - pB * z - flSq(y);
		float dy = - pA * y - pB * z - pB * x - flSq(z);
		float dz = - pA * z - pB * x - pB * y - flSq(x); 
		return new PVector(dx, dy, dz);
	}
}

// source: http://paulbourke.net/fractals/lorenz/
class LorenzAttractor extends Attractor {
	// parameter set 1
/*	float paramA = 10;
	float paramB = 28;
	float paramC = 8 / 3;*/

	// parameter set 2
	float paramA = 28;
	float paramB = 46.92;
	float paramC = 4;

	LorenzAttractor() {
		name = "Lorenz";
		maxIter = 40000;
		lastPt = new PVector(0.1, 0, 0);
//		sP = 0.002; // goes with param set 1
		sP = 0.0006; // goes with param set 2
		magFactor = 8;
		adjX = 0;
		adjY = -20;
		adjZ = -400;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts(); // generates the points in this attractor
	}

	PVector getDelta() {
		float dx = paramA * (lastPt.y - lastPt.x);
		float dy = lastPt.x * (paramB - lastPt.z) - lastPt.y;
		float dz = lastPt.x * lastPt.y - paramC * lastPt.z;
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite83.html
class QiChenAttractor extends Attractor {
	float pA = 38;
	float pB = 2.666;
	float pC = 80;

	QiChenAttractor() {
		name = "Qi-Chen";
		maxIter = 40000;
		lastPt = new PVector(3, -4, 3);
		sP = 0.0005;
		magFactor = 2;
		adjX = 0;
		adjY = 0;
		adjZ = -50;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts();
	}

	PVector getDelta() {
		float dx = pA * (lastPt.y - lastPt.x) + lastPt.y * lastPt.z;
		float dy = pC * lastPt.x + lastPt.y - lastPt.x * lastPt.z;
		float dz = lastPt.x * lastPt.y - pB * lastPt.z;
		return new PVector(dx, dy, dz);
	}
}

// source: http://paulbourke.net/fractals/rossler/
class RosslerAttractor extends Attractor {
	float paramA = 0.2;
	float paramB = 0.2;
	float paramC = 5.7;

	RosslerAttractor() {
		name = "Rossler";
		maxIter = 75000;
		lastPt = new PVector(0.0001, 0.0001, 0.0001);
		sP = 0.02;
		magFactor = 20;
		adjX = 0;
		adjY = 0;
		adjZ = -500;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts(); // generates the points in this attractor
	}

	PVector getDelta() {
		float dx = -lastPt.y - lastPt.z;
		float dy = lastPt.x + paramA * lastPt.y;
		float dz = paramB + lastPt.z * (lastPt.x - paramC);
		return new PVector(dx, dy, dz);
	}
}

// source: http://chaoticatmospheres.com/125670/1204030/gallery/mathrules-strange-attractors
class TSUCS extends Attractor {
	float pA = 40;
	float pB = 0.833;
	float pC = 0.5;
	float pD = 0.65;
	float pE = 20;

	TSUCS() {
		name = "Three_Scroll_Unified_Chaotic_System";
		maxIter = 50000;
		lastPt = new PVector(0.1, 1.0, -0.1);
		sP = 0.0005;
		magFactor = 0.5;
		adjX = 0;
		adjY = 0;
		adjZ = 300;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts();
	}

	PVector getDelta() {
		float dx = pA * (lastPt.y - lastPt.x) + pC * lastPt.x * lastPt.z;
		float dy = pE * lastPt.y - lastPt.x * lastPt.z;
		float dz = pB * lastPt.z + lastPt.x * lastPt.y - pD * flSq(lastPt.x);
		return new PVector(dx, dy, dz);
	}
}

// source: http://chaoticatmospheres.com/125670/1204030/gallery/mathrules-strange-attractors
class TSUCS2 extends Attractor {
	float pA = 40;
	float pB = 55;
	float pC = 11 / 6;
	float pD = 0.16;
	float pE = 0.65;
	float pF = 20;

	TSUCS2() {
		name = "Three_Scroll_Unified_Chaotic_System_2";
		maxIter = 50000;
		lastPt = new PVector(0.1, 1.0, -0.1);
		sP = 0.0005;
		magFactor = 0.5;
		adjX = 0;
		adjY = 0;
		adjZ = 200;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts();
	}

	PVector getDelta() {
		float dx = pA * (lastPt.y - lastPt.x) + pD * lastPt.x * lastPt.z;
		float dy = pB * lastPt.x - lastPt.x * lastPt.z + pF * lastPt.y;
		float dz = pC * lastPt.z + lastPt.x * lastPt.y - pE * flSq(lastPt.x);
		return new PVector(dx, dy, dz);
	}
}