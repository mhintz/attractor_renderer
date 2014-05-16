class RosslerAttractor extends Attractor {
	float paramA = 0.2;
	float paramB = 0.2;
	float paramC = 5.7;
	float scaleParam = 0.04;

	RosslerAttractor() {
		maxIter = 75000;
		lastPt = new PVector(0.0001, 0.0001, 0.0001);
		magFactor = 20;
		adjX = 0;
		adjY = 0;
		adjZ = -500;
		colorNoiseInd = new PVector(random(10), random(10), random(10));
		genPts(); // generates the points in this attractor
	}

	PVector nextPt() {
		float x = lastPt.x + scaleParam * (-lastPt.y - lastPt.z);
		float y = lastPt.y + scaleParam * (lastPt.x + paramA * lastPt.y);
		float z = lastPt.z + scaleParam * (paramB + lastPt.z * (lastPt.x - paramC));
		PVector nextPt = new PVector(x, y, z);
		lastPt = nextPt;
		return nextPt;
	}
}