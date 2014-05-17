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