class HalvorsenAttractor extends Attractor {
	float pA = 1.4;
	float pB = 4;
	float sP = 0.005;

	HalvorsenAttractor() {
		maxIter = 20000;
		lastPt = new PVector(1, 0, 0);
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
		float dx = - pA * x - pB * y - pB * z - Util.flSq(y);
		float dy = - pA * y - pB * z - pB * x - Util.flSq(z);
		float dz = - pA * z - pB * x - pB * y - Util.flSq(x); 
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