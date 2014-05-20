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

// source: http://www.3d-meier.de/tut19/Seite7.html
class ChenCelikovskyAttractor extends Attractor {
	float pA = 36;
	float pB = 3;
	float pC = 20;

	ChenCelikovskyAttractor() {
		name = "Chen-Celikovsky";
		maxIter = 40000;
		lastPt = new PVector(1, 1, 1);
		sP = 0.002;
		magFactor = 8;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = pA * (lastPt.y - lastPt.x);
		float dy = -lastPt.x * lastPt.z + pC * lastPt.y;
		float dz = lastPt.x * lastPt.y - pB * lastPt.z;
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
	}

	PVector getDelta() {
		float dx = pA * lastPt.x - lastPt.y * lastPt.z;
		float dy = pB * lastPt.y + lastPt.x * lastPt.z;
		float dz = pC * lastPt.z + lastPt.x * lastPt.y / 3;
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite12.html
class HadleyAttractor extends Attractor {
	float pA = 0.2;
	float pB = 4;
	float pF = 8;
	float pG = 1;

	HadleyAttractor() {
		name = "Hadley";
		maxIter = 40000;
		lastPt = new PVector(0.1, 0, 0);
		sP = 0.005;
		magFactor = 125;
		adjX = 0;
		adjY = 0;
		adjZ = -100;
	}

	PVector getDelta() {
		float dx = -flSq(lastPt.y) - flSq(lastPt.z) - pA * lastPt.x + pA * pF;
		float dy = lastPt.x * lastPt.y - pB * lastPt.x * lastPt.z - lastPt.y + pG;
		float dz = pB * lastPt.x * lastPt.y + lastPt.x * lastPt.z - lastPt.z;
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

// source: http://jlswbs.blogspot.com/2012/03/ikeda.html
class IkedaAttractor extends Attractor {
	float pA = 1;
	float pB = 0.9;
	float pC = 0.4;
	float pD = 6;

	IkedaAttractor() {
		name = "Ikeda";
		maxIter = 50000;
		lastPt = new PVector(0, 0, 0);
		sP = 0.04;
		magFactor = 0.5;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = pA + pB * (lastPt.x * flCos(lastPt.z) - lastPt.y * flSin(lastPt.z));
		float dy = pB * (lastPt.x * flSin(lastPt.z) + lastPt.y * flCos(lastPt.z));
		float dz = pC - pD / (1 + flSq(lastPt.x) + flSq(lastPt.y));
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite46.html
class LiuChenAttractor extends Attractor {
	float pA = 2.4;
	float pB = -3.78;
	float pC = 14;
	float pD = -11;
	float pE = 4;
	float pF = 5.58;
	float pG = -1;

	LiuChenAttractor() {
		name = "Liu-Chen";
		maxIter = 40000;
		lastPt = new PVector(1, 3, 5);
		sP = 0.001;
		magFactor = 12;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = pA * lastPt.y + pB * lastPt.x + pC * lastPt.y * lastPt.z;
		float dy = pD * lastPt.y - lastPt.z + pE * lastPt.x * lastPt.z;
		float dz = pF * lastPt.z + pG * lastPt.x * lastPt.y;
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
	}

	PVector getDelta() {
		float dx = paramA * (lastPt.y - lastPt.x);
		float dy = lastPt.x * (paramB - lastPt.z) - lastPt.y;
		float dz = lastPt.x * lastPt.y - paramC * lastPt.z;
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite81.html
class LuChenAttractor extends Attractor {
	float pA = -10;
	float pB = -4;
	float pC = 18.1;

	LuChenAttractor() {
		name = "Lu-Chen";
		maxIter = 40000;
		lastPt = new PVector(0, 0, 2);
		sP = 0.01;
		magFactor = 10;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = -(pA * pB * lastPt.x) / (pA + pB) - lastPt.y * lastPt.z + pC;
		float dy = pA * lastPt.y + lastPt.x * lastPt.z;
		float dz = pB * lastPt.z + lastPt.x * lastPt.y;
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite15.html
class NoseHooverAttractor extends Attractor {
	float pA = 1.5;

	NoseHooverAttractor() {
		name = "Nose-Hoover";
		maxIter = 40000;
		lastPt = new PVector(1, 0, 0);
		sP = 0.009;
		magFactor = 58;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = lastPt.y;
		float dy = -lastPt.x + lastPt.y * lastPt.z;
		float dz = pA - flSq(lastPt.y);
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite70.html (set 1)
// http://www.nahee.com/spanky/www/fractint/pickover.html (set 2)
class PickoverAttractor extends Attractor {
	// param set 1
	float pA = -0.759;
	float pB = 2.449;
	float pC = 1.253;
	float pD = 1.5;

	// param set 2
	/*float pA = 2.24;
	float pB = 0.43;
	float pC = -0.65;
	float pD = -2.43;*/

	PickoverAttractor() {
		name = "Pickover";
		maxIter = 20000;
		lastPt = new PVector(0, 0, 0);
		sP = 1;
		magFactor = 500; // param set 1
//		magFactor = 150; // param set 2
		adjX = 0;
		adjY = 250; // param set 1
//		adjY = 0; // param set 2
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = flSin(pA  * lastPt.y) - lastPt.z * flCos(pB * lastPt.x) - lastPt.x;
		float dy = lastPt.z * flSin(pC * lastPt.x) - flCos(pD * lastPt.y) - lastPt.y;
		float dz = flSin(lastPt.x) - lastPt.z;
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
	}

	PVector getDelta() {
		float dx = pA * (lastPt.y - lastPt.x) + lastPt.y * lastPt.z;
		float dy = pC * lastPt.x + lastPt.y - lastPt.x * lastPt.z;
		float dz = lastPt.x * lastPt.y - pB * lastPt.z;
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite16.html
class RayleighBenardAttractor extends Attractor {
	float pA = 9;
	float pR = 12;
	float pB = 5;

	RayleighBenardAttractor() {
		name = "Rayleigh-Benard";
		maxIter = 40000;
		lastPt = new PVector(0.1, 0, 0);
		sP = 0.05;
		magFactor = 17;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = -pA * lastPt.x + pA * lastPt.y;
		float dy = pR * lastPt.x - lastPt.y - lastPt.x * lastPt.z;
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
		maxIter = 50000;
		lastPt = new PVector(0.0001, 0.0001, 0.0001);
		sP = 0.02;
		magFactor = 20;
		adjX = 0;
		adjY = 0;
		adjZ = -500;
	}

	PVector getDelta() {
		float dx = -lastPt.y - lastPt.z;
		float dy = lastPt.x + paramA * lastPt.y;
		float dz = paramB + lastPt.z * (lastPt.x - paramC);
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite41.html
class ThomasAttractor extends Attractor {
	float pB = 0.19;

	ThomasAttractor() {
		name = "Thomas";
		maxIter = 50000;
		lastPt = new PVector(0.1, 0, 0);
		sP = 0.05;
		magFactor = 62;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = -pB * lastPt.x + flSin(lastPt.y);
		float dy = -pB * lastPt.y + flSin(lastPt.z);
		float dz = -pB * lastPt.z + flSin(lastPt.x);
		return new PVector(dx, dy, dz);
	}
}

// source: http://chaoticatmospheres.com/125670/1204030/gallery/mathrules-strange-attractors
class TSUCS1 extends Attractor {
	float pA = 40;
	float pB = 0.833;
	float pC = 0.5;
	float pD = 0.65;
	float pE = 20;

	TSUCS1() {
		name = "Three_Scroll_Unified_Chaotic_System";
		maxIter = 50000;
		lastPt = new PVector(0.1, 1.0, -0.1);
		sP = 0.0005;
		magFactor = 0.5;
		adjX = 0;
		adjY = 0;
		adjZ = 300;
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
	}

	PVector getDelta() {
		float dx = pA * (lastPt.y - lastPt.x) + pD * lastPt.x * lastPt.z;
		float dy = pB * lastPt.x - lastPt.x * lastPt.z + pF * lastPt.y;
		float dz = pC * lastPt.z + lastPt.x * lastPt.y - pE * flSq(lastPt.x);
		return new PVector(dx, dy, dz);
	}
}

// source: http://www.3d-meier.de/tut19/Seite127.html
class ZhouChenAttractor extends Attractor {
	float pA = 2.97;
	float pB = 0.15;
	float pC = -3;
	float pD = 1;
	float pE = -8.78;

	ZhouChenAttractor() {
		name = "Zhou-Chen";
		maxIter	= 50000;
		lastPt = new PVector(3, 1, 1);
		sP = 0.002;
		magFactor = 6;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
	}

	PVector getDelta() {
		float dx = pA * lastPt.x + pB * lastPt.y + lastPt.y * lastPt.z;
		float dy = pC * lastPt.y - lastPt.x * lastPt.z + pD * lastPt.y * lastPt.z;
		float dz = pE * lastPt.z - lastPt.x * lastPt.y;
		return new PVector(dx, dy, dz);
	}
}