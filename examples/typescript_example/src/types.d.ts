
declare function lua_inline(s:string):void
declare function dostring(s:string):void

declare namespace double {
    const nan: double
    const infinity: double
    const negativeInfinity: double
    const minPositive: double
    const maxFinite: double
}

declare namespace math {
    function clamp(vale: number, a: number, b: number): number
}
