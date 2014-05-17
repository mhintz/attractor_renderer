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
		float dz = pC + pA * z - (Util.flCu(z) / 3) - ((Util.flSq(x) + Util.flSq(y)) * (1 + pE * z)) + pF * z * Util.flCu(x);
		return new PVector(dx, dy, dz);
	}
}