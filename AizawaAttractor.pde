// source: http://www.behance.net/gallery/MathRules-Strange-Attractors/7618879

class AizawaAttractor extends Attractor {
	float pA = 0.95;
	float pB = 0.7;
	float pC = 0.6;
	float pD = 3.5;
	float pE = 0.25;
	float pF = 0.1;
	float sP = 0.01;

	AizawaAttractor() {
		maxIter = 20000;
		lastPt = new PVector(0.1, 0, 0);
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
		double ddz = pC + pA * z - (Math.pow(z, 3) / 3) - ((Math.pow(x, 2) + Math.pow(y, 2)) * (1 + pE * z)) + pF * z * Math.pow(x, 3);
		float dz = (float) ddz;
		return new PVector(dx, dy, dz);
	}

	PVector nextPt() {
		PVector delta = getDelta();
		float x = lastPt.x + sP * delta.x;
		float y = lastPt.y + sP * delta.y;
		float z = lastPt.z + sP * delta.z;
		PVector nextPt = new PVector(x, y, z);
		lastPt = nextPt;
		return nextPt;
	}
}