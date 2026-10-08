(globalThis["TURBOPACK"] || (globalThis["TURBOPACK"] = [])).push([typeof document === "object" ? document.currentScript : undefined,
"[project]/components/AuthForm.tsx [app-client] (ecmascript)", ((__turbopack_context__) => {
"use strict";

__turbopack_context__.s([
    "default",
    ()=>AuthForm
]);
var __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__ = __turbopack_context__.i("[project]/node_modules/next/dist/compiled/react/jsx-dev-runtime.js [app-client] (ecmascript)");
var __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$client$2f$app$2d$dir$2f$link$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__ = __turbopack_context__.i("[project]/node_modules/next/dist/client/app-dir/link.js [app-client] (ecmascript)");
var __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$navigation$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__ = __turbopack_context__.i("[project]/node_modules/next/navigation.js [app-client] (ecmascript)");
var __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$index$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__ = __turbopack_context__.i("[project]/node_modules/next/dist/compiled/react/index.js [app-client] (ecmascript)");
;
var _s = __turbopack_context__.k.signature();
'use client';
;
;
;
function AuthForm({ mode, next }) {
    _s();
    const router = (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$navigation$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["useRouter"])();
    const isRegister = mode === 'register';
    const [form, setForm] = (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$index$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["useState"])({
        name: '',
        email: '',
        phone: '',
        password: '',
        confirm: ''
    });
    const [error, setError] = (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$index$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["useState"])('');
    const [fieldErrors, setFieldErrors] = (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$index$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["useState"])({});
    const [busy, setBusy] = (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$index$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["useState"])(false);
    const update = (field, value)=>{
        setForm((current)=>({
                ...current,
                [field]: value
            }));
        setFieldErrors((current)=>{
            if (!current[field]) return current;
            const rest = {
                ...current
            };
            delete rest[field];
            return rest;
        });
    };
    const submit = async (event)=>{
        event.preventDefault();
        setError('');
        if (isRegister && form.password !== form.confirm) {
            setFieldErrors({
                confirm: 'Konfirmasi password belum sama.'
            });
            return;
        }
        setBusy(true);
        try {
            const payload = isRegister ? {
                name: form.name,
                email: form.email,
                phone: form.phone,
                password: form.password
            } : {
                email: form.email,
                password: form.password,
                next
            };
            const response = await fetch(isRegister ? '/api/auth/register' : '/api/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(payload)
            });
            const result = await response.json();
            if (!response.ok) {
                setError(result.error ?? 'Terjadi kesalahan. Coba lagi.');
                setFieldErrors(result.fieldErrors ?? {});
                return;
            }
            router.replace(isRegister ? next : result.redirectTo ?? next);
            router.refresh();
        } catch  {
            setError('Tidak dapat terhubung ke server. Periksa koneksi lalu coba lagi.');
        } finally{
            setBusy(false);
        }
    };
    const query = next === '/akun' ? '' : `?next=${encodeURIComponent(next)}`;
    const field = (name)=>fieldErrors[name] ? /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("em", {
            className: "field-error",
            children: fieldErrors[name]
        }, void 0, false, {
            fileName: "[project]/components/AuthForm.tsx",
            lineNumber: 43,
            columnNumber: 64
        }, this) : null;
    const invalid = (name)=>fieldErrors[name] ? 'is-invalid' : undefined;
    return /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("form", {
        className: "auth-card",
        onSubmit: submit,
        noValidate: true,
        children: [
            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("div", {
                className: "checkout-field-grid auth-fields",
                children: [
                    isRegister && /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("label", {
                        children: [
                            "Nama lengkap",
                            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("input", {
                                className: invalid('name'),
                                value: form.name,
                                onChange: (event)=>update('name', event.target.value),
                                autoComplete: "name",
                                placeholder: "cth. Budi Santoso",
                                required: true
                            }, void 0, false, {
                                fileName: "[project]/components/AuthForm.tsx",
                                lineNumber: 48,
                                columnNumber: 41
                            }, this),
                            field('name')
                        ]
                    }, void 0, true, {
                        fileName: "[project]/components/AuthForm.tsx",
                        lineNumber: 48,
                        columnNumber: 22
                    }, this),
                    /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("label", {
                        children: [
                            "Email",
                            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("input", {
                                className: invalid('email'),
                                type: "email",
                                value: form.email,
                                onChange: (event)=>update('email', event.target.value),
                                autoComplete: "email",
                                inputMode: "email",
                                placeholder: "nama@email.com",
                                required: true
                            }, void 0, false, {
                                fileName: "[project]/components/AuthForm.tsx",
                                lineNumber: 49,
                                columnNumber: 19
                            }, this),
                            field('email')
                        ]
                    }, void 0, true, {
                        fileName: "[project]/components/AuthForm.tsx",
                        lineNumber: 49,
                        columnNumber: 7
                    }, this),
                    isRegister && /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("label", {
                        children: [
                            "Nomor telepon (opsional)",
                            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("input", {
                                className: invalid('phone'),
                                type: "tel",
                                value: form.phone,
                                onChange: (event)=>update('phone', event.target.value),
                                autoComplete: "tel",
                                inputMode: "tel",
                                placeholder: "08xxxxxxxxxx"
                            }, void 0, false, {
                                fileName: "[project]/components/AuthForm.tsx",
                                lineNumber: 50,
                                columnNumber: 53
                            }, this),
                            field('phone')
                        ]
                    }, void 0, true, {
                        fileName: "[project]/components/AuthForm.tsx",
                        lineNumber: 50,
                        columnNumber: 22
                    }, this),
                    /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("label", {
                        children: [
                            "Password",
                            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("input", {
                                className: invalid('password'),
                                type: "password",
                                value: form.password,
                                onChange: (event)=>update('password', event.target.value),
                                autoComplete: isRegister ? 'new-password' : 'current-password',
                                placeholder: isRegister ? 'Min. 8 karakter, huruf dan angka' : 'Password kamu',
                                required: true
                            }, void 0, false, {
                                fileName: "[project]/components/AuthForm.tsx",
                                lineNumber: 51,
                                columnNumber: 22
                            }, this),
                            field('password')
                        ]
                    }, void 0, true, {
                        fileName: "[project]/components/AuthForm.tsx",
                        lineNumber: 51,
                        columnNumber: 7
                    }, this),
                    isRegister && /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("label", {
                        children: [
                            "Ulangi password",
                            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("input", {
                                className: invalid('confirm'),
                                type: "password",
                                value: form.confirm,
                                onChange: (event)=>update('confirm', event.target.value),
                                autoComplete: "new-password",
                                required: true
                            }, void 0, false, {
                                fileName: "[project]/components/AuthForm.tsx",
                                lineNumber: 52,
                                columnNumber: 44
                            }, this),
                            field('confirm')
                        ]
                    }, void 0, true, {
                        fileName: "[project]/components/AuthForm.tsx",
                        lineNumber: 52,
                        columnNumber: 22
                    }, this)
                ]
            }, void 0, true, {
                fileName: "[project]/components/AuthForm.tsx",
                lineNumber: 47,
                columnNumber: 5
            }, this),
            error && /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("p", {
                className: "checkout-error",
                role: "alert",
                children: error
            }, void 0, false, {
                fileName: "[project]/components/AuthForm.tsx",
                lineNumber: 54,
                columnNumber: 15
            }, this),
            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("button", {
                className: "button button-dark auth-submit",
                type: "submit",
                disabled: busy,
                children: [
                    busy ? isRegister ? 'Membuat akun…' : 'Memeriksa…' : isRegister ? 'Buat akun' : 'Masuk',
                    " ",
                    /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("span", {
                        children: "→"
                    }, void 0, false, {
                        fileName: "[project]/components/AuthForm.tsx",
                        lineNumber: 55,
                        columnNumber: 180
                    }, this)
                ]
            }, void 0, true, {
                fileName: "[project]/components/AuthForm.tsx",
                lineNumber: 55,
                columnNumber: 5
            }, this),
            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("p", {
                className: "auth-alt",
                children: isRegister ? /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])(__TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["Fragment"], {
                    children: [
                        "Sudah punya akun? ",
                        /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])(__TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$client$2f$app$2d$dir$2f$link$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["default"], {
                            href: `/masuk${query}`,
                            children: "Masuk"
                        }, void 0, false, {
                            fileName: "[project]/components/AuthForm.tsx",
                            lineNumber: 56,
                            columnNumber: 63
                        }, this)
                    ]
                }, void 0, true, {
                    fileName: "[project]/components/AuthForm.tsx",
                    lineNumber: 56,
                    columnNumber: 43
                }, this) : /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])(__TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["Fragment"], {
                    children: [
                        "Belum punya akun? ",
                        /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])(__TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$client$2f$app$2d$dir$2f$link$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["default"], {
                            href: `/daftar${query}`,
                            children: "Daftar"
                        }, void 0, false, {
                            fileName: "[project]/components/AuthForm.tsx",
                            lineNumber: 56,
                            columnNumber: 131
                        }, this)
                    ]
                }, void 0, true, {
                    fileName: "[project]/components/AuthForm.tsx",
                    lineNumber: 56,
                    columnNumber: 111
                }, this)
            }, void 0, false, {
                fileName: "[project]/components/AuthForm.tsx",
                lineNumber: 56,
                columnNumber: 5
            }, this),
            /*#__PURE__*/ (0, __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$dist$2f$compiled$2f$react$2f$jsx$2d$dev$2d$runtime$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["jsxDEV"])("p", {
                className: "auth-note",
                children: "Belanja tanpa akun juga bisa — kamu tetap dapat checkout sebagai tamu."
            }, void 0, false, {
                fileName: "[project]/components/AuthForm.tsx",
                lineNumber: 57,
                columnNumber: 5
            }, this)
        ]
    }, void 0, true, {
        fileName: "[project]/components/AuthForm.tsx",
        lineNumber: 46,
        columnNumber: 10
    }, this);
}
_s(AuthForm, "q8+ZmZCZ4kFlJe6Z92KOo4XuYWQ=", false, function() {
    return [
        __TURBOPACK__imported__module__$5b$project$5d2f$node_modules$2f$next$2f$navigation$2e$js__$5b$app$2d$client$5d$__$28$ecmascript$29$__["useRouter"]
    ];
});
_c = AuthForm;
var _c;
__turbopack_context__.k.register(_c, "AuthForm");
if (typeof globalThis.$RefreshHelpers$ === 'object' && globalThis.$RefreshHelpers !== null) {
    __turbopack_context__.k.registerExports(__turbopack_context__.m, globalThis.$RefreshHelpers$);
}
}),
]);

//# sourceMappingURL=components_AuthForm_tsx_1bu4_lw._.js.map