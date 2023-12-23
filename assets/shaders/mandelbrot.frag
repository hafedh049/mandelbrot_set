#version 460 core

#include <flutter/runtime_effect.glsl>

uniform float screen_ratio;
uniform vec2 screen_size;
uniform float zoom;

const float itr = 100.0;
const vec2 center = vec2(0,0);

out vec4 colorOut;

vec4 map_to_color(float t) {
    float r = 9.0 * (1.0 - t) * t * t * t;
    float g = 15.0 * (1.0 - t) * (1.0 - t) * t * t;
    float b = 8.5 * (1.0 - t) * (1.0 - t) * (1.0 - t) * t;

    return vec4(r, g, b, 1);
}

void main() {
    vec2 z = vec2(0,0), c = vec2(0,0);
    c.x = screen_ratio * (gl_FragCoord.x / screen_size.x - 0.5);
    c.y = (gl_FragCoord.y / screen_size.y - 0.5);

    c.x /= zoom;
    c.y /= zoom;

    c.x += center.x;
    c.y += center.y;

    int i;

    for(i = 0; i < int(itr); i+=1) {
        float x = (z.x * z.x - z.y * z.y) + c.x;
        float y = (z.y * z.x + z.x * z.y) + c.y;

        if((x * x + y * y) > 2.0) {
            break;
        }
        z.x = x;
        z.y = y;
    }

    float t = float(i) / itr;

    colorOut = map_to_color(t);
}