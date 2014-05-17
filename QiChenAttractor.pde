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