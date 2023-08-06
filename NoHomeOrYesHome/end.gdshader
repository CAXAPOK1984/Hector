shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float amount : hint_range(0.0, 1.0) = 0.05;
uniform float offset : hint_range(-1.0, 1.0) = 0.002;

void fragment() {
    vec2 uv = SCREEN_UV;
    vec4 color = texture(SCREEN_TEXTURE, uv);
    vec4 red = texture(SCREEN_TEXTURE, uv + vec2(offset, 0.0));
    vec4 green = texture(SCREEN_TEXTURE, uv);
    vec4 blue = texture(SCREEN_TEXTURE, uv - vec2(offset, 0.0));
    color.r = mix(color.r, red.r, amount);
    color.g = mix(color.g, green.g, amount);
    color.b = mix(color.b, blue.b, amount);
    COLOR = color;
}