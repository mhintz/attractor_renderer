class MathUtil {
	// utils
	float flSin(float n) {
		return (float) Math.sin(n);
	}

	float flCos(float n) {
		return (float) Math.cos(n);
	}

	float flSq(float n) {
		return (float) Math.pow(n, 2);
	}

	float flCu(float n) {
		return (float) Math.pow(n, 3);
	}

	void calcVecMax(PVector store, PVector pt) {
		store.x = Math.max(store.x, pt.x);
		store.y = Math.max(store.y, pt.y);
		store.z = Math.max(store.z, pt.z);
	}

	void calcVecMin(PVector store, PVector pt) {
		store.x = Math.min(store.x, pt.x);
		store.y = Math.min(store.y, pt.y);
		store.z = Math.min(store.z, pt.z);
	}

	float roundTo(float n, int places) {
		return round(n * pow(10, places)) / pow(10, places);
	}

	float noiseIndex = random(20);

	float noiseRandom(float min, float max) {
		noiseIndex += 0.1;
		return min + (noise(noiseIndex) * (max - min));
	}
}
