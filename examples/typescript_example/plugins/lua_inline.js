
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });

const plugin = {
    beforeEmit(program, options, emitHost, result) {
        void program;
        void options;
        void emitHost;
        for (const file of result) {
            file.code = file.code.replace(/lua_inline\("(.*)"\)/g, '$1');
        }
    },
};

exports.default = plugin;

