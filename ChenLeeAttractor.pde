// source: http://www.3d-meier.de/tut19/Seite8.html

class ChenLeeAttractor extends Attractor {
	float pA = 5;
	float pB = -10;
	float pC = -0.38;

	ChenLeeAttractor() {
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