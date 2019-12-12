(window["webpackJsonp"] = window["webpackJsonp"] || []).push([
    ["fda7"], {
        fda7: function(t, i, s) {
            "use strict";
            s.r(i);
            var o = function() {
                    var t = this,
                        i = t.$createElement,
                        s = t._self._c || i;
                    return s("v-container", {
                        attrs: {
                            fluid: "",
                            "grid-list-xl": "",
                            "fill-height": ""
                        }
                    }, [s("v-layout", {
                        attrs: {
                            "justify-center": "",
                            "align-center": ""
                        }
                    }, [s("v-flex", {
                        attrs: {
                            xs12: ""
                        }
                    }, [s("material-card", {
                        attrs: {
                            color: "green"
                        }
                    }, [s("div", {
                        attrs: {
                            slot: "header"
                        },
                        slot: "header"
                    }, [s("div", {
                        staticClass: "title font-weight-light mb-2"
                    }, [t._v("Notifications")]), s("div", {
                        staticClass: "category"
                    }, [t._v("\n            Handcrafted by us with\n            "), s("v-icon", {
                        attrs: {
                            size: "17"
                        }
                    }, [t._v("\n              mdi-heart\n            ")])], 1)]), s("v-card-text", [s("v-layout", {
                        attrs: {
                            row: "",
                            wrap: ""
                        }
                    }, [s("v-flex", {
                        attrs: {
                            md6: "",
                            sm12: ""
                        }
                    }, [s("h2", {
                        staticClass: "title font-weight-light mb-3"
                    }, [t._v("Notifications Style")]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "info"
                        }
                    }, [t._v("\n                This is a plain notification\n              ")]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "info",
                            dismissible: ""
                        }
                    }, [t._v("\n                This is a notification with close button.\n              ")]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "info",
                            dismissible: "",
                            icon: "mdi-bell-plus"
                        }
                    }, [t._v("\n\n                This is a notification with close button and icon.\n              ")]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "info",
                            dismissible: "",
                            icon: "mdi-bell-plus"
                        }
                    }, [t._v("\n\n                This is a notification with close button and icon and have many lines. You can see that the icon and the close button are always vertically aligned. This is a beautiful notification. So you don't have to worry about the style.\n              ")])], 1), s("v-flex", {
                        attrs: {
                            md6: "",
                            sm12: ""
                        }
                    }, [s("h2", {
                        staticClass: "title font-weight-light"
                    }, [t._v("Notifcation States")]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "info",
                            dismissible: ""
                        }
                    }, [s("strong", [t._v("INFO")]), t._v(' - This is a regular notification made with `color="info"`\n              ')]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "success",
                            dismissible: ""
                        }
                    }, [s("strong", [t._v("SUCCESS")]), t._v(' - This is a regular notification made with `color="success"`\n              ')]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "warning",
                            dismissible: ""
                        }
                    }, [s("strong", [t._v("WARNING")]), t._v(' - This is a regular notification made with `color="warning"`\n              ')]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "error",
                            dismissible: ""
                        }
                    }, [s("strong", [t._v("DANGER")]), t._v(' - This is a regular notification made with `color="error"`\n              ')]), s("material-notification", {
                        staticClass: "mb-3",
                        attrs: {
                            color: "purple",
                            dismissible: ""
                        }
                    }, [s("strong", [t._v("PRIMARY")]), t._v(' - This is a regular notification made with `color="purple"`\n              ')])], 1)], 1), s("div", {
                        staticClass: "text-xs-center"
                    }, [s("h2", {
                        staticClass: "title font-weight-light mb-2"
                    }, [t._v("Notification Places")]), s("span", {
                        staticClass: " subheading font-weight-light grey--text"
                    }, [t._v("Click to view notifications")])]), s("v-container", {
                        attrs: {
                            "grid-list-lg": ""
                        }
                    }, [s("v-layout", {
                        attrs: {
                            "justify-center": "",
                            row: "",
                            wrap: ""
                        }
                    }, [s("v-flex", {
                        attrs: {
                            xs12: "",
                            sm4: ""
                        }
                    }, [s("v-btn", {
                        attrs: {
                            block: "",
                            color: "success"
                        },
                        on: {
                            click: function(i) {
                                t.snack("top", "left")
                            }
                        }
                    }, [t._v("\n                  Top Left\n                ")])], 1), s("v-flex", {
                        attrs: {
                            xs12: "",
                            sm4: ""
                        }
                    }, [s("v-btn", {
                        attrs: {
                            block: "",
                            color: "success"
                        },
                        on: {
                            click: function(i) {
                                t.snack("top")
                            }
                        }
                    }, [t._v("\n                  Top Center\n                ")])], 1)], 1), s("v-layout", {
                        attrs: {
                            "justify-center": "",
                            row: "",
                            wrap: ""
                        }
                    }, [s("v-flex", {
                        attrs: {
                            xs12: "",
                            sm4: ""
                        }
                    }, [s("v-btn", {
                        attrs: {
                            block: "",
                            color: "success"
                        },
                        on: {
                            click: function(i) {
                                t.snack("top", "right")
                            }
                        }
                    }, [t._v("\n                  Top Right\n                ")])], 1), s("v-flex", {
                        attrs: {
                            xs12: "",
                            sm4: ""
                        }
                    }, [s("v-btn", {
                        attrs: {
                            block: "",
                            color: "success"
                        },
                        on: {
                            click: function(i) {
                                t.snack("bottom", "left")
                            }
                        }
                    }, [t._v("\n                  Bottom Left\n                ")])], 1)], 1), s("v-layout", {
                        attrs: {
                            "justify-center": "",
                            row: "",
                            wrap: ""
                        }
                    }, [s("v-flex", {
                        attrs: {
                            xs12: "",
                            sm4: ""
                        }
                    }, [s("v-btn", {
                        attrs: {
                            block: "",
                            color: "success"
                        },
                        on: {
                            click: function(i) {
                                t.snack("bottom")
                            }
                        }
                    }, [t._v("\n                  Bottom Center\n                ")])], 1), s("v-flex", {
                        attrs: {
                            xs12: "",
                            sm4: ""
                        }
                    }, [s("v-btn", {
                        attrs: {
                            block: "",
                            color: "success"
                        },
                        on: {
                            click: function(i) {
                                t.snack("bottom", "right")
                            }
                        }
                    }, [t._v("\n                  Bottom Right\n                ")])], 1)], 1)], 1), s("v-snackbar", {
                        attrs: {
                            color: t.color,
                            bottom: t.bottom,
                            top: t.top,
                            left: t.left,
                            right: t.right,
                            dark: ""
                        },
                        model: {
                            value: t.snackbar,
                            callback: function(i) {
                                t.snackbar = i
                            },
                            expression: "snackbar"
                        }
                    }, [s("v-icon", {
                        staticClass: "mr-3",
                        attrs: {
                            color: "white"
                        }
                    }, [t._v("\n              mdi-bell-plus\n            ")]), s("div", [t._v("Welcome to "), s("b", [t._v("Vue Material Dashboard")]), t._v(" - a beautiful freebie for every web developer.")]), s("v-icon", {
                        attrs: {
                            size: "16"
                        },
                        on: {
                            click: function(i) {
                                t.snackbar = !1
                            }
                        }
                    }, [t._v("\n              mdi-close-circle\n            ")])], 1)], 1)], 1)], 1)], 1)], 1)
                },
                a = [],
                n = {
                    data: function() {
                        return {
                            color: null,
                            colors: ["purple", "info", "success", "warning", "error"],
                            top: !0,
                            bottom: !1,
                            left: !1,
                            right: !1,
                            snackbar: !1
                        }
                    },
                    methods: {
                        snack: function() {
                            this.top = !1, this.bottom = !1, this.left = !1, this.right = !1;
                            for (var t = arguments.length, i = new Array(t), s = 0; s < t; s++) i[s] = arguments[s];
                            for (var o = 0, a = i; o < a.length; o++) {
                                var n = a[o];
                                this[n] = !0
                            }
                            this.color = this.colors[Math.floor(Math.random() * this.colors.length)], this.snackbar = !0
                        }
                    }
                },
                r = n,
                c = s("2877"),
                l = Object(c["a"])(r, o, a, !1, null, null, null);
            i["default"] = l.exports
        }
    }
]);
//# sourceMappingURL=fda7.c6b4b8b0.js.map