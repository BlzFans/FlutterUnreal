   IPLR          L  �     ����   x  �
     �
  #    q                GLSL.std.450                     main    ,   �           G  ,          H  k       #       H  k      #      G  k      G  m   "       G  m   !   @   G  �   "       G  �   !   A   G  �               !                            +          HB+         �;E+            @+     '     �?   +         ;  +   ,        6   +     :       +     B     @@+     J   ��@+     P   333�+     Q   ���@+     V   33�?+     W   ��9@+     `      ?  k            l      k   ;  l   m        n          +  n   o          p         +     u   ��L=+  n   v         w         +     �     �@+     �      A  �            	 �                              �   �      �       �   ;  �   �         �         +  �   �          �      �   ;  �   �      +     e    �>+     f    �A+     g     B+     j  ��L>+     l  ��y>+     m    �B+     o  ff&�+     p    ��6               �     =       ,   A  p   q   m   o   =     r   q   �     s     r   A  w   x   m   v   =     y   x   �     {   y   e       |      
   {   �  -      �  �     �    �       |   `                  �  6       u   �  !      �       !  �     �  -  �  !  �     $    f  �     '  $  $       h         *     2   h  g  B        i  '       ,     2   i  *  '   �  -  �  -  �     c  :      ,  !  �     �   y   j       �      
   �        4     2   J   �   o  �     6  Q   4       7        6  �     :  W   4       ;        :  �     <  V   ;       =     2   P   7  <       @     2   =  l  `   �     �   @  c       �      .   :   �   �        �      .   :   �   �   Q     �   s      �     F  �           G        F  �     H     G  �     J  G  m  �     L  J  H       M     
   L       O     2       M  p       �         O       �      (   O  :   �     �   �   �        �         �   �     �   �   �   �     �   �   �   P     �   �   :   �     �   �   r   �     �   s   �   P     �   �   :   �     �   �   r        �   �   P     �   �   :   �     �   �   r   �     �   �   �   �     �   �   �   =  �   �   �   W  �   �   �   �   W  �   �   �   �   W  �   �   �   �   Q     �   �      Q     �   �       �     �   �   �   Q     �   �      Q     �   �      �     �   �   �   Q     �   �      Q     �   �      �     �   �   �        �      (   �   �        �      (   �   �   P  �     �   �   �   '   �  �       �   >  �     �  8     �       $                   (         @                      1   _RESERVED_IDENTIFIER_FIXUP_gl_DefaultUniformBlock                                       uTex       ui_glitch_fragment_main j���   p  �     �  #version 100
precision mediump float;
precision highp int;

uniform highp vec2 uResolution;
uniform highp float uTime;
uniform highp sampler2D uTex;

varying highp vec2 _fragCoord;

void main()
{
    highp vec2 _113 = _fragCoord / uResolution;
    highp float _347 = 0.0;
    for (int spvDummy29 = 0; spvDummy29 < 1; spvDummy29++)
    {
        highp float _276 = abs(fract(uTime * 0.25) - 0.5);
        if (_276 > 0.0500000007450580596923828125)
        {
            _347 = 0.0;
            break;
        }
        highp float _284 = _276 * 20.0;
        _347 = (-(_284 * _284)) * ((-_276) * 40.0 + 3.0) + 1.0;
        break;
    }
    highp float _300 = 6.4899997711181640625 * fract(uTime * 0.20000000298023223876953125) + (-0.64999997615814208984375);
    highp float _137 = (((-0.699999988079071044921875) * sin(6.80000019073486328125 * _300) + (1.39999997615814208984375 * sin(2.900000095367431640625 * _300))) * 0.2439024448394775390625 + 0.5) + _347;
    highp float _143 = mix(0.0, 5.0, _137);
    highp float _319 = sin(_113.y * 3000.0);
    highp float _327 = 2.0 * fract((_319 * 100.0) * (50.0 * _319)) + (-1.0);
    highp float _155 = max(_327, 0.0);
    highp vec2 _170 = _113 + (vec2((floor((_155 * _155) + float(0.5)) * sign(_327)) * mix(0.0, 8.0, _137), 0.0) / uResolution);
    highp vec4 _206 = texture2D(uTex, _170 + (vec2(_143, 0.0) / uResolution));
    highp vec4 _211 = texture2D(uTex, _170);
    highp vec4 _216 = texture2D(uTex, _170 + (vec2(-_143, 0.0) / uResolution));
    highp float _219 = _206.w;
    highp float _226 = _211.w;
    highp float _232 = _216.w;
    gl_FragData[0] = vec4(_206.x / _219, _211.y / _226, _216.z / _232, 1.0) * max(_219, max(_226, _232));
}

   �   <      ����$                                  uTex    ����(                                       uTime                                             uResolution    ui_glitch_fragment_main                 8
  P	     B	  // This SkSL shader is autogenerated by spirv-cross.

float4 flutter_FragCoord;

uniform vec2 uResolution;
uniform float uTime;
uniform shader uTex;
uniform half2 uTex_size;

vec4 oColor;

vec2 FLT_flutter_local_FlutterFragCoord()
{
    return flutter_FragCoord.xy;
}

float FLT_flutter_local_cubicPulse(float c, float w, inout float x)
{
    x = abs(x - c);
    if (x > w)
    {
        return 0.0;
    }
    x /= w;
    return 1.0 - ((x * x) * (3.0 - (2.0 * x)));
}

float FLT_flutter_local_twoSin(inout float x)
{
    x = (6.4899997711181640625 * x) - 0.64999997615814208984375;
    float t = ((-0.699999988079071044921875) * sin(6.80000019073486328125 * x)) + (1.39999997615814208984375 * sin(2.900000095367431640625 * x));
    t = (t / 4.099999904632568359375) + 0.5;
    return t;
}

float FLT_flutter_local_hash_1d(float v)
{
    float u = 50.0 * sin(v * 3000.0);
    return (2.0 * fract((2.0 * u) * u)) - 1.0;
}

void FLT_main()
{
    vec2 uv = vec2(FLT_flutter_local_FlutterFragCoord()) / uResolution;
    float param = 0.5;
    float param_1 = 0.0500000007450580596923828125;
    float param_2 = fract(uTime / 4.0);
    float _127 = FLT_flutter_local_cubicPulse(param, param_1, param_2);
    float t_2 = _127;
    float param_3 = fract(uTime / 5.0);
    float _134 = FLT_flutter_local_twoSin(param_3);
    float t_1 = _134;
    float glitchScale = mix(0.0, 8.0, t_1 + t_2);
    float aberrationSize = mix(0.0, 5.0, t_1 + t_2);
    float param_4 = uv.y;
    float h = FLT_flutter_local_hash_1d(param_4);
    float hs = sign(h);
    h = max(h, 0.0);
    h *= h;
    h = floor(h + float(0.5)) * hs;
    uv += (vec2(h * glitchScale, 0.0) / uResolution);
    vec2 redOffset = vec2(aberrationSize, 0.0) / uResolution;
    vec2 greenOffset = vec2(0.0) / uResolution;
    vec2 blueOffset = vec2(-aberrationSize, 0.0) / uResolution;
    vec2 redUv = uv + redOffset;
    vec2 greenUv = uv + greenOffset;
    vec2 blueUv = uv + blueOffset;
    vec2 ra = uTex.eval(uTex_size * ( redUv)).xw;
    vec2 ga = uTex.eval(uTex_size * ( greenUv)).yw;
    vec2 ba = uTex.eval(uTex_size * ( blueUv)).zw;
    ra.x /= ra.y;
    ga.x /= ga.y;
    ba.x /= ba.y;
    float alpha = max(ra.y, max(ga.y, ba.y));
    oColor = vec4(ra.x, ga.x, ba.x, 1.0) * alpha;
}

half4 main(float2 iFragCoord)
{
      flutter_FragCoord = float4(iFragCoord, 0, 0);
      FLT_main();
      return oColor;
}
     �   `         (             $                                  uTex   ,              (                                       uTime  $                                               uResolution    ui_glitch_fragment_main 