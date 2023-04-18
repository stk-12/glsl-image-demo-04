varying vec2 vUv;
varying float vDistortion;
uniform float uTime;
uniform float uProg;
uniform float uScroll;

#pragma glslify: pnoise = require(glsl-noise/periodic/3d);

float PI = 3.1415926535897932384626433832795;

void main() {
  vUv = uv;
  vec3 pos = position;

  float scroll = uScroll * 0.005;

  // float distortion = pnoise((pos + uTime * 10.0), vec3(10.0) * 1.5) * 50.0 * uProg;
  // pos.z += distortion;

  // vDistortion = distortion * 0.001;

  // pos.y += smoothstep(0.0, 0.5, uv.x) * 0.1 - smoothstep(0.5, 1.0, uv.x) * 0.1;
  // pos.y += sin(uv.x * 0.5);

  // pos.y += cos(pos.x * PI) * 0.1;

  pos.y += cos(pos.x * PI) * 0.1 * scroll;

  gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
}