// source: http://www.3d-meier.de/tut19/Seite13.html

class HalvorsenAttractor extends Attractor {
	float pA = 1.4;
	float pB = 4;

	HalvorsenAttractor() {
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
		float dx = - pA * x - pB * y - pB * z - Util.flSq(y);
		float dy = - pA * y - pB * z - pB * x - Util.flSq(z);
		float dz = - pA * z - pB * x - pB * y - Util.flSq(x); 
		return new PVector(dx, dy, dz);
	}
}