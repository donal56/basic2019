/*!
  ​
  =========================================================
  * Vuetify Material Dashboard - v1.0.0
  =========================================================

  * Product Page: https://www.creative-tim.com/product/vuetify-material-dashboard
  * Copyright 2019 Creative Tim (https://www.creative-tim.com)
  * Licensed under MIT

  * Coded by Creative Tim

  =========================================================

  * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    ​
  */
 (function(t) {
  function e(e) {
      for (var r, n, s = e[0], c = e[1], l = e[2], u = 0, f = []; u < s.length; u++) n = s[u], Object.prototype.hasOwnProperty.call(i, n) && i[n] && f.push(i[n][0]), i[n] = 0;
      for (r in c) Object.prototype.hasOwnProperty.call(c, r) && (t[r] = c[r]);
      d && d(e);
      while (f.length) f.shift()();
      return o.push.apply(o, l || []), a()
  }

  function a() {
      for (var t, e = 0; e < o.length; e++) {
          for (var a = o[e], r = !0, n = 1; n < a.length; n++) {
              var s = a[n];
              0 !== i[s] && (r = !1)
          }
          r && (o.splice(e--, 1), t = c(c.s = a[0]))
      }
      return t
  }
  var r = {},
      n = {
          app: 0
      },
      i = {
          app: 0
      },
      o = [];

  function s(t) {
      return c.p + "js/" + ({} [t] || t) + "." + {
          7277: "b072dd4e",
          9198: "a7d0ad7a",
          "4a39": "21744fad",
          "6d0d": "5fcce3c6",
          "9cc6": "032c62f3",
          "chunk-1e47": "1296890c",
          "chunk-23e5": "964474a3",
          fda7: "c6b4b8b0"
      } [t] + ".js"
  }

  function c(e) {
      if (r[e]) return r[e].exports;
      var a = r[e] = {
          i: e,
          l: !1,
          exports: {}
      };
      return t[e].call(a.exports, a, a.exports, c), a.l = !0, a.exports
  }
  c.e = function(t) {
      var e = [],
          a = {
              "chunk-1e47": 1,
              "chunk-23e5": 1
          };
      n[t] ? e.push(n[t]) : 0 !== n[t] && a[t] && e.push(n[t] = new Promise(function(e, a) {
          for (var r = "css/" + ({} [t] || t) + "." + {
                  7277: "31d6cfe0",
                  9198: "31d6cfe0",
                  "4a39": "31d6cfe0",
                  "6d0d": "31d6cfe0",
                  "9cc6": "31d6cfe0",
                  "chunk-1e47": "5c5a738e",
                  "chunk-23e5": "41a4938a",
                  fda7: "31d6cfe0"
              } [t] + ".css", i = c.p + r, o = document.getElementsByTagName("link"), s = 0; s < o.length; s++) {
              var l = o[s],
                  u = l.getAttribute("data-href") || l.getAttribute("href");
              if ("stylesheet" === l.rel && (u === r || u === i)) return e()
          }
          var f = document.getElementsByTagName("style");
          for (s = 0; s < f.length; s++) {
              l = f[s], u = l.getAttribute("data-href");
              if (u === r || u === i) return e()
          }
          var d = document.createElement("link");
          d.rel = "stylesheet", d.type = "text/css", d.onload = e, d.onerror = function(e) {
              var r = e && e.target && e.target.src || i,
                  o = new Error("Loading CSS chunk " + t + " failed.\n(" + r + ")");
              o.request = r, delete n[t], d.parentNode.removeChild(d), a(o)
          }, d.href = i;
          var v = document.getElementsByTagName("head")[0];
          v.appendChild(d)
      }).then(function() {
          n[t] = 0
      }));
      var r = i[t];
      if (0 !== r)
          if (r) e.push(r[2]);
          else {
              var o = new Promise(function(e, a) {
                  r = i[t] = [e, a]
              });
              e.push(r[2] = o);
              var l, u = document.createElement("script");
              u.charset = "utf-8", u.timeout = 120, c.nc && u.setAttribute("nonce", c.nc), u.src = s(t);
              var f = new Error;
              l = function(e) {
                  u.onerror = u.onload = null, clearTimeout(d);
                  var a = i[t];
                  if (0 !== a) {
                      if (a) {
                          var r = e && ("load" === e.type ? "missing" : e.type),
                              n = e && e.target && e.target.src;
                          f.message = "Loading chunk " + t + " failed.\n(" + r + ": " + n + ")", f.name = "ChunkLoadError", f.type = r, f.request = n, a[1](f)
                      }
                      i[t] = void 0
                  }
              };
              var d = setTimeout(function() {
                  l({
                      type: "timeout",
                      target: u
                  })
              }, 12e4);
              u.onerror = u.onload = l, document.head.appendChild(u)
          } return Promise.all(e)
  }, c.m = t, c.c = r, c.d = function(t, e, a) {
      c.o(t, e) || Object.defineProperty(t, e, {
          enumerable: !0,
          get: a
      })
  }, c.r = function(t) {
      "undefined" !== typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
          value: "Module"
      }), Object.defineProperty(t, "__esModule", {
          value: !0
      })
  }, c.t = function(t, e) {
      if (1 & e && (t = c(t)), 8 & e) return t;
      if (4 & e && "object" === typeof t && t && t.__esModule) return t;
      var a = Object.create(null);
      if (c.r(a), Object.defineProperty(a, "default", {
              enumerable: !0,
              value: t
          }), 2 & e && "string" != typeof t)
          for (var r in t) c.d(a, r, function(e) {
              return t[e]
          }.bind(null, r));
      return a
  }, c.n = function(t) {
      var e = t && t.__esModule ? function() {
          return t["default"]
      } : function() {
          return t
      };
      return c.d(e, "a", e), e
  }, c.o = function(t, e) {
      return Object.prototype.hasOwnProperty.call(t, e)
  }, c.p = "/vuetify-material-dashboard/", c.oe = function(t) {
      throw console.error(t), t
  };
  var l = window["webpackJsonp"] = window["webpackJsonp"] || [],
      u = l.push.bind(l);
  l.push = e, l = l.slice();
  for (var f = 0; f < l.length; f++) e(l[f]);
  var d = u;
  o.push([0, "chunk-vendors"]), a()
})({
  0: function(t, e, a) {
      t.exports = a("56d7")
  },
  "03c3": function(t, e, a) {},
  1196: function(t, e, a) {
      "use strict";
      var r = a("03c3"),
          n = a.n(r);
      n.a
  },
  "1a5d": function(t, e, a) {
      var r = {
          "./Dashboard.vue": ["7277", "7277"],
          "./Icons.vue": ["9cc6", "9cc6"],
          "./Maps.vue": ["daba", "chunk-1e47"],
          "./Notifications.vue": ["fda7", "fda7"],
          "./TableList.vue": ["6d0d", "6d0d"],
          "./Typography.vue": ["547e", "chunk-23e5"],
          "./Upgrade.vue": ["9198", "9198"],
          "./UserProfile.vue": ["4a39", "4a39"]
      };

      function n(t) {
          if (!a.o(r, t)) return Promise.resolve().then(function() {
              var e = new Error("Cannot find module '" + t + "'");
              throw e.code = "MODULE_NOT_FOUND", e
          });
          var e = r[t],
              n = e[0];
          return a.e(e[1]).then(function() {
              return a(n)
          })
      }
      n.keys = function() {
          return Object.keys(r)
      }, n.id = "1a5d", t.exports = n
  },
  "25f5": function(t, e, a) {
      "use strict";
      var r = a("c5d7"),
          n = a.n(r);
      n.a
  },
  2609: function(t, e, a) {
      "use strict";
      a.r(e), e["default"] = {
          drawer: null,
          color: "success",
          image: "https://demos.creative-tim.com/vue-material-dashboard/img/sidebar-2.32103624.jpg"
      }
  },
  2856: function(t, e, a) {},
  "2a74": function(t, e, a) {
      "use strict";
      a.r(e);
      a("28a5");
      var r = a("768b"),
          n = (a("a481"), a("ac6a"), a("c653")),
          i = {};
      n.keys().forEach(function(t) {
          if ("./index.js" !== t) {
              var e = t.replace(/(\.\/|\.js)/g, ""),
                  a = e.split("/"),
                  o = Object(r["a"])(a, 2),
                  s = o[0],
                  c = o[1];
              i[s] || (i[s] = {
                  namespaced: !0
              }), i[s][c] = n(t).default
          }
      }), e["default"] = i
  },
  "2d4d": function(t, e, a) {},
  "2de2": function(t, e, a) {},
  "3c7c": function(t, e, a) {},
  4072: function(t, e, a) {
      "use strict";
      var r = a("7ead"),
          n = a.n(r);
      n.a
  },
  "41c0": function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-navigation-drawer", {
                  attrs: {
                      id: "app-drawer",
                      app: "",
                      dark: "",
                      floating: "",
                      persistent: "",
                      "mobile-break-point": "991",
                      width: "260"
                  },
                  model: {
                      value: t.inputValue,
                      callback: function(e) {
                          t.inputValue = e
                      },
                      expression: "inputValue"
                  }
              }, [a("v-img", {
                  attrs: {
                      src: t.image,
                      height: "100%"
                  }
              }, [a("v-layout", {
                  staticClass: "fill-height",
                  attrs: {
                      tag: "v-list",
                      column: ""
                  }
              }, [a("v-list-tile", {
                  attrs: {
                      avatar: ""
                  }
              }, [a("v-list-tile-avatar", {
                  attrs: {
                      color: "white"
                  }
              }, [a("v-img", {
                  attrs: {
                      src: t.logo,
                      height: "34",
                      contain: ""
                  }
              })], 1), a("v-list-tile-title", {
                  staticClass: "title"
              }, [t._v("\n          SISREPLAN\n        ")])], 1), a("v-divider"), t._l(t.links, function(e, r) {
                  return a("v-list-tile", {
                      key: r,
                      staticClass: "v-list-item",
                      attrs: {
                          to: e.to,
                          "active-class": t.color,
                          avatar: ""
                      }
                  }, [a("v-list-tile-action", [a("v-icon", [t._v(t._s(e.icon))])], 1), a("v-list-tile-title", {
                      domProps: {
                          textContent: t._s(e.text)
                      }
                  })], 1)
              }), a("v-list-tile", {
                  staticClass: "v-list-item v-list__tile--buy",
                  attrs: {
                      "active-class": "success",
                      to: "/upgrade"
                  }
              }, [], 1)], 2)], 1)], 1)
          },
          n = [],
          i = a("db72"),
          o = a("2f62"),
          s = {
              props: {
                  opened: {
                      type: Boolean,
                      default: !1
                  }
              },
              data: function() {
                  return {
                      logo: "favicon.ico",
                      links: [
                          {
                            to: "/",
                            icon: "mdi-file-document",
                            text: "Requisiciones"
                          },
                    {
                          to: "/vuetify-material-dashboard/",
                          icon: "mdi-view-dashboard",
                          text: "Dashboard"
                      }, {
                          to: "/vuetify-material-dashboard/user-profile",
                          icon: "mdi-account",
                          text: "User Profile"
                      }, {
                          to: "/vuetify-material-dashboard/table-list",
                          icon: "mdi-clipboard-outline",
                          text: "Table List"
                      }, {
                          to: "/vuetify-material-dashboard/typography",
                          icon: "mdi-format-font",
                          text: "Typography"
                      }, {
                          to: "/vuetify-material-dashboard/icons",
                          icon: "mdi-chart-bubble",
                          text: "Icons"
                      }, {
                          to: "/vuetify-material-dashboard/maps",
                          icon: "mdi-map-marker",
                          text: "Maps"
                      }, {
                          to: "/vuetify-material-dashboard/notifications",
                          icon: "mdi-bell",
                          text: "Notifications"
                      }]
                  }
              },
              computed: Object(i["a"])({}, Object(o["c"])("app", ["image", "color"]), {
                  inputValue: {
                      get: function() {
                          return this.$store.state.app.drawer
                      },
                      set: function(t) {
                          this.setDrawer(t)
                      }
                  },
                  items: function() {
                      return this.$t("Layout.View.items")
                  }
              }),
              methods: Object(i["a"])({}, Object(o["b"])("app", ["setDrawer", "toggleDrawer"]))
          },
          c = s,
          l = (a("ff57"), a("2877")),
          u = Object(l["a"])(c, r, n, !1, null, null, null);
      e["default"] = u.exports
  },
  "42e7": function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("material-card", t._g(t._b({
                  staticClass: "v-card--material-stats"
              }, "material-card", t.$attrs, !1), t.$listeners), [a("v-card", {
                  staticClass: "pa-4",
                  class: "elevation-" + t.elevation,
                  attrs: {
                      slot: "offset",
                      color: t.color,
                      dark: ""
                  },
                  slot: "offset"
              }, [a("v-icon", {
                  attrs: {
                      size: "40"
                  }
              }, [t._v("\n      " + t._s(t.icon) + "\n    ")])], 1), a("div", {
                  staticClass: "text-xs-right"
              }, [a("p", {
                  staticClass: "category grey--text font-weight-light",
                  domProps: {
                      textContent: t._s(t.title)
                  }
              }), a("h3", {
                  staticClass: "title display-1 font-weight-light"
              }, [t._v("\n      " + t._s(t.value) + " "), a("small", [t._v(t._s(t.smallValue))])])]), a("template", {
                  slot: "actions"
              }, [a("v-icon", {
                  staticClass: "mr-2",
                  attrs: {
                      color: t.subIconColor,
                      size: "20"
                  }
              }, [t._v("\n      " + t._s(t.subIcon) + "\n    ")]), a("span", {
                  staticClass: "caption font-weight-light",
                  class: t.subTextColor,
                  domProps: {
                      textContent: t._s(t.subText)
                  }
              })], 1)], 2)
          },
          n = [],
          i = a("db72"),
          o = a("e3a9"),
          s = {
              inheritAttrs: !1,
              props: Object(i["a"])({}, o["default"].props, {
                  icon: {
                      type: String,
                      required: !0
                  },
                  subIcon: {
                      type: String,
                      default: void 0
                  },
                  subIconColor: {
                      type: String,
                      default: void 0
                  },
                  subTextColor: {
                      type: String,
                      default: void 0
                  },
                  subText: {
                      type: String,
                      default: void 0
                  },
                  title: {
                      type: String,
                      default: void 0
                  },
                  value: {
                      type: String,
                      default: void 0
                  },
                  smallValue: {
                      type: String,
                      default: void 0
                  }
              })
          },
          c = s,
          l = (a("4d79"), a("2877")),
          u = Object(l["a"])(c, r, n, !1, null, null, null);
      e["default"] = u.exports
  },
  "4d79": function(t, e, a) {
      "use strict";
      var r = a("2de2"),
          n = a.n(r);
      n.a
  },
  "56d7": function(t, e, a) {
      "use strict";
      a.r(e);
      var r = a("2b0e"),
          n = (a("a481"), a("ac6a"), a("8103")),
          i = a.n(n),
          o = a("bba4"),
          s = a.n(o),
          c = a("ffe0");
      c.keys().forEach(function(t) {
          var e = c(t),
              a = i()(s()(t.replace(/^\.\//, "").replace(/\.\w+$/, "")));
          r["default"].component(a, e.default || e)
      });
      var l = a("bc3a"),
          u = a.n(l);
      r["default"].prototype.$http = u.a;
      a("4633");
      var f = "undefined" !== typeof window ? a("84b5") : {};
      r["default"].use(f);
      var d = a("ce5b"),
          v = a.n(d),
          p = {
              primary: "#4caf50",
              secondary: "#4caf50",
              tertiary: "#495057",
              accent: "#82B1FF",
              error: "#f55a4e",
              info: "#00d3ee",
              success: "#5cb860",
              warning: "#ffa21a"
          };
      a("bf40"), a("5363");
      r["default"].use(v.a, {
          iconfont: "mdi",
          theme: p
      });
      var m = a("31bd"),
          h = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-app", [a("core-filter"), a("core-toolbar"), a("core-drawer"), a("core-view")], 1)
          },
          b = [],
          g = (a("5c0b"), a("2877")),
          y = {},
          w = Object(g["a"])(y, h, b, !1, null, null, null),
          _ = w.exports,
          x = (a("7f7f"), a("0284")),
          k = a.n(x),
          C = a("8c4f"),
          O = a("0a89"),
          j = a.n(O),
          E = [
            {
                path: "/req-requisicion",
                view: "Mis requisiciones"
            }, 
            {
              path: "",
              view: "Dashboard"
          }, {
              path: "/user-profile",
              name: "User Profile",
              view: "UserProfile"
          }, {
              path: "/table-list",
              name: "Table List",
              view: "TableList"
          }, {
              path: "/typography",
              view: "Typography"
          }, {
              path: "/icons",
              view: "Icons"
          }, {
              path: "/maps",
              view: "Maps"
          }, {
              path: "/notifications",
              view: "Notifications"
          }
        ];

      function S(t, e, r) {
          return {
              name: r || e,
              path: t,
              component: function(t) {
                  return a("1a5d")("./".concat(e, ".vue")).then(t)
              }
          }
      }
      r["default"].use(C["a"]);
      var $ = new C["a"]({
          base: "",
          mode: "hash",
          routes: E.map(function(t) {
              return S(t.path, t.view, t.name)
          }).concat([{
              path: "*",
              redirect: "/"
          }]),
          scrollBehavior: function(t, e, a) {
              return a || (t.hash ? {
                  selector: t.hash
              } : {
                  x: 0,
                  y: 0
              })
          }
      });
      r["default"].use(j.a), Object({
          NODE_ENV: "production",
          BASE_URL: "/vuetify-material-dashboard/"
      }).GOOGLE_ANALYTICS && r["default"].use(k.a, {
          id: Object({
              NODE_ENV: "production",
              BASE_URL: "/vuetify-material-dashboard/"
          }).GOOGLE_ANALYTICS,
          router: $,
          autoTracking: {
              page: !0
          }
      });
      var T = $,
          N = a("2f62"),
          D = {},
          L = {},
          P = a("2a74"),
          U = {},
          A = {};
      r["default"].use(N["a"]);
      var B = new N["a"].Store({
              actions: D,
              getters: L,
              modules: P["default"],
              mutations: U,
              state: A
          }),
          I = B;
      Object(m["sync"])(I, T), r["default"].config.productionTip = !1, new r["default"]({
          router: T,
          store: I,
          render: function(t) {
              return t(_)
          }
      }).$mount("#app")
  },
  "57c1": function(t, e, a) {},
  "5c0b": function(t, e, a) {
      "use strict";
      var r = a("2856"),
          n = a.n(r);
      n.a
  },
  "602c": function(t, e, a) {
      "use strict";
      var r = a("57c1"),
          n = a.n(r);
      n.a
  },
  6096: function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function(t) {
              return function(e, a) {
                  return e[t] = a
              }
          },
          n = function(t) {
              return function(e) {
                  return e[t] = !e[t]
              }
          };
      e["default"] = {
          setDrawer: r("drawer"),
          setImage: r("image"),
          setColor: r("color"),
          toggleDrawer: n("drawer")
      }
  },
  "78d5": function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("material-card", t._g(t._b({
                  staticClass: "v-card--material-chart"
              }, "material-card", t.$attrs, !1), t.$listeners), [a("chartist", {
                  attrs: {
                      slot: "header",
                      data: t.data,
                      "event-handlers": t.eventHandlers,
                      options: t.options,
                      ratio: t.ratio,
                      "responsive-options": t.responsiveOptions,
                      type: t.type
                  },
                  slot: "header"
              }), t._t("default"), t._t("actions", null, {
                  slot: "actions"
              })], 2)
          },
          n = [],
          i = (a("6762"), a("2fdb"), {
              inheritAttrs: !1,
              props: {
                  data: {
                      type: Object,
                      default: function() {
                          return {}
                      }
                  },
                  eventHandlers: {
                      type: Array,
                      default: function() {
                          return []
                      }
                  },
                  options: {
                      type: Object,
                      default: function() {
                          return {}
                      }
                  },
                  ratio: {
                      type: String,
                      default: void 0
                  },
                  responsiveOptions: {
                      type: Array,
                      default: function() {
                          return []
                      }
                  },
                  type: {
                      type: String,
                      required: !0,
                      validator: function(t) {
                          return ["Bar", "Line", "Pie"].includes(t)
                      }
                  }
              }
          }),
          o = i,
          s = (a("e536"), a("2877")),
          c = Object(s["a"])(o, r, n, !1, null, null, null);
      e["default"] = c.exports
  },
  "7a74": function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-footer", {
                  attrs: {
                      id: "core-footer",
                      absolute: "",
                      height: "82"
                  }
              }, 
              [
                    t._v("Footerrrrr")
              ], 1)
          },
          n = [],
          i = {
              data: function() {
                  return {
                      links: 
                      [
                    //       {
                    //       name: "Home",
                    //       Link: "/#"
                    //   }, {
                    //       name: "Creative Tim",
                    //       Link: "https://www.creative-tim.com"
                    //   }, {
                    //       name: "About Us",
                    //       Link: "https://creative-tim.com/presentation"
                    //   }, {
                    //       name: "Blog",
                    //       Link: "https://blog.creative-tim.com"
                    //   }
                    ]
                  }
              }
          },
          o = i,
          s = (a("602c"), a("2877")),
          c = Object(s["a"])(o, r, n, !1, null, null, null);
      e["default"] = c.exports
  },
  "7ead": function(t, e, a) {},
  "832b": function(t, e, a) {
      "use strict";
      var r = a("f095"),
          n = a.n(r);
      n.a
  },
  9306: function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-content", [a("div", {
                  attrs: {
                      id: "core-view"
                  }
              }, [a("v-fade-transition", {
                  attrs: {
                      mode: "out-in"
                  }
              }, [a("router-view")], 1)], 1), "Maps" !== t.$route.name ? a("core-footer") : t._e()], 1)
          },
          n = [],
          i = {
              metaInfo: function() {
                  return {
                      title: "Vuetify Material Dashboard by CreativeTim"
                  }
              }
          },
          o = i,
          s = (a("ee4f"), a("2877")),
          c = Object(s["a"])(o, r, n, !1, null, null, null);
      e["default"] = c.exports
  },
  "9d6c": function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-alert", t._g(t._b({
                  staticClass: "v-alert--notification",
                  class: ["elevation-" + t.elevation],
                  attrs: {
                      value: t.value
                  }
              }, "v-alert", t.$attrs, !1), t.$listeners), [t._t("default")], 2)
          },
          n = [],
          i = (a("c5f6"), {
              inheritAttrs: !1,
              props: {
                  elevation: {
                      type: [Number, String],
                      default: 6
                  },
                  value: {
                      type: Boolean,
                      default: !0
                  }
              }
          }),
          o = i,
          s = (a("4072"), a("2877")),
          c = Object(s["a"])(o, r, n, !1, null, null, null);
      e["default"] = c.exports
  },
  b2ab: function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-menu", {
                  attrs: {
                      "close-on-content-click": !1,
                      bottom: "",
                      left: "",
                      "min-width": "300",
                      "max-width": "300",
                      transition: "slide-y-transition"
                  }
              }, [a("v-btn", {
                  staticClass: "elevation-0",
                  staticStyle: {
                      top: "96px"
                  },
                  attrs: {
                      slot: "activator",
                      color: "grey",
                      dark: "",
                      fab: "",
                      fixed: "",
                      top: ""
                  },
                  slot: "activator"
              }, [a("v-icon", [t._v("mdi-settings")])], 1), a("v-card", [a("v-container", {
                  attrs: {
                      "grid-list-xl": ""
                  }
              }, [a("v-layout", {
                  attrs: {
                      wrap: ""
                  }
              }, [a("v-flex", {
                  attrs: {
                      xs12: ""
                  }
              }, [a("div", {
                  staticClass: "text-xs-center body-2 text-uppercase sidebar-filter"
              }, [t._v("Color")]), a("v-layout", {
                  attrs: {
                      "justify-center": ""
                  }
              }, t._l(t.colors, function(e) {
                  return a("v-avatar", {
                      key: e,
                      class: [e === t.color ? "color-active color-" + e : "color-" + e],
                      attrs: {
                          size: "23"
                      },
                      on: {
                          click: function(a) {
                              t.setColor(e)
                          }
                      }
                  })
              }), 1), a("v-divider", {
                  staticClass: "mt-3"
              })], 1), a("v-flex", {
                  attrs: {
                      xs12: ""
                  }
              }, [a("div", {
                  staticClass: "text-xs-center body-2 text-uppercase sidebar-filter"
              }, [t._v("Fondo")])]), t._l(t.images, function(e) {
                  return a("v-flex", {
                      key: e,
                      attrs: {
                          xs3: ""
                      }
                  }, [a("v-img", {
                      class: [t.image === e ? "image-active" : ""],
                      attrs: {
                          src: e,
                          height: "120"
                      },
                      nativeOn: {
                          click: function(a) {
                              t.setImage(e)
                          }
                      }
                  })], 1)
              })
               ], 2)], 1)], 1)], 1)
          },
          n = [],
          i = a("db72"),
          o = a("2b0e"),
          s = a("5299"),
          c = a.n(s),
          l = a("f676"),
          u = (a("3a06"), a("2f62"));
      o["default"].use(c.a), o["default"].use(l["a"], {
          useCache: !0
      });
      
      var f = {
              data: function() {
                  return {
                      colors: ["primary", "info", "success", "warning", "danger"],
                      images: ["https://demos.creative-tim.com/vue-material-dashboard/img/sidebar-1.23832d31.jpg", "https://demos.creative-tim.com/vue-material-dashboard/img/sidebar-2.32103624.jpg", "https://demos.creative-tim.com/vue-material-dashboard/img/sidebar-3.3a54f533.jpg", "https://demos.creative-tim.com/vue-material-dashboard/img/sidebar-4.3b7e38ed.jpg"]
                  }
              },
              computed: Object(i["a"])({}, Object(u["c"])("app", ["image", "color"]), {
                  color: function() {
                      return this.$store.state.app.color
                  }
              }),
              methods: Object(i["a"])({}, Object(u["b"])("app", ["setImage"]), {
                  setColor: function(t) {
                      this.$store.state.app.color = t
                  }
              })
          },
          d = f,
          v = (a("832b"), a("2877")),
          p = Object(v["a"])(d, r, n, !1, null, "5d92c2be", null);
      e["default"] = p.exports
  },
  c5d7: function(t, e, a) {},
  c653: function(t, e, a) {
      var r = {
          "./app/mutations.js": "6096",
          "./app/state.js": "2609",
          "./index.js": "2a74"
      };

      function n(t) {
          var e = i(t);
          return a(e)
      }

      function i(t) {
          if (!a.o(r, t)) {
              var e = new Error("Cannot find module '" + t + "'");
              throw e.code = "MODULE_NOT_FOUND", e
          }
          return r[t]
      }
      n.keys = function() {
          return Object.keys(r)
      }, n.resolve = i, t.exports = n, n.id = "c653"
  },
  c6cc: function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("div", {
                  staticClass: "v-offset",
                  class: t.classes,
                  style: t.styles
              }, [t._t("default")], 2)
          },
          n = [],
          i = (a("c5f6"), {
              props: {
                  fullWidth: {
                      type: Boolean,
                      default: !1
                  },
                  offset: {
                      type: [Number, String],
                      default: 0
                  }
              },
              computed: {
                  classes: function() {
                      return {
                          "v-offset--full-width": this.fullWidth
                      }
                  },
                  styles: function() {
                      return {
                          top: "-".concat(this.offset, "px"),
                          marginBottom: "-".concat(this.offset, "px")
                      }
                  }
              }
          }),
          o = i,
          s = (a("1196"), a("2877")),
          c = Object(s["a"])(o, r, n, !1, null, null, null);
      e["default"] = c.exports
  },
  cb2c: function(t, e, a) {
      "use strict";
      var r = a("cfda"),
          n = a.n(r);
      n.a
  },
  cfda: function(t, e, a) {},
  d23b: function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-toolbar", {
                  staticStyle: {
                      background: "#eee"
                  },
                  attrs: {
                      id: "core-toolbar",
                      app: "",
                      flat: "",
                      prominent: ""
                  }
              }, [a("div", {
                  staticClass: "v-toolbar-title"
              }, [a("v-toolbar-title", {
                  staticClass: "tertiary--text font-weight-light"
              }, [t.responsive ? a("v-btn", {
                  staticClass: "default v-btn--simple",
                  attrs: {
                      dark: "",
                      icon: ""
                  },
                  on: {
                      click: function(e) {
                          return e.stopPropagation(), t.onClickBtn(e)
                      }
                  }
              }, [a("v-icon", [t._v("mdi-view-list")])], 1) : t._e(), t._v("\n      " + t._s(t.title) + "\n    ")], 1)], 1), a("v-spacer"), a("v-toolbar-items", [a("v-flex", {
                  attrs: {
                      "align-center": "",
                      layout: "",
                      "py-2": ""
                  }
              }, [a("v-text-field", {
                  staticClass: "mr-4 purple-input",
                  attrs: {
                      label: "Search...",
                      "hide-details": "",
                      color: "purple"
                  }
              }), a("router-link", {
                  directives: [{
                      name: "ripple",
                      rawName: "v-ripple"
                  }],
                  staticClass: "toolbar-items",
                  attrs: {
                      to: "/"
                  }
              }, [a("v-icon", {
                  attrs: {
                      color: "tertiary"
                  }
              }, [t._v("mdi-view-dashboard")])], 1), a("v-menu", {
                  attrs: {
                      bottom: "",
                      left: "",
                      "content-class": "dropdown-menu",
                      "offset-y": "",
                      transition: "slide-y-transition"
                  }
              }, [a("router-link", {
                  directives: [{
                      name: "ripple",
                      rawName: "v-ripple"
                  }],
                  staticClass: "toolbar-items",
                  attrs: {
                      slot: "activator",
                      to: "/notifications"
                  },
                  slot: "activator"
              }, [a("v-badge", {
                  attrs: {
                      color: "error",
                      overlap: ""
                  }
              }, [a("template", {
                  slot: "badge"
              }, [t._v("\n              " + t._s(t.notifications.length) + "\n            ")]), a("v-icon", {
                  attrs: {
                      color: "tertiary"
                  }
              }, [t._v("mdi-bell")])], 2)], 1), a("v-card", [a("v-list", {
                  attrs: {
                      dense: ""
                  }
              }, t._l(t.notifications, function(e) {
                  return a("v-list-tile", {
                      key: e,
                      on: {
                          click: t.onClick
                      }
                  }, [a("v-list-tile-title", {
                      domProps: {
                          textContent: t._s(e)
                      }
                  })], 1)
              }), 1)], 1)], 1), a("router-link", {
                  directives: [{
                      name: "ripple",
                      rawName: "v-ripple"
                  }],
                  staticClass: "toolbar-items",
                  attrs: {
                      to: "/user-profile"
                  }
              }, [a("v-icon", {
                  attrs: {
                      color: "tertiary"
                  }
              }, [t._v("mdi-account")])], 1)], 1)], 1)], 1)
          },
          n = [],
          i = a("db72"),
          o = (a("7f7f"), a("2f62")),
          s = {
              data: function() {
                  return {
                      notifications: ["Notificación 1"],
                      title: null,
                      responsive: !1
                  }
              },
              watch: {
                  $route: function(t) {
                      this.title = t.name
                  }
              },
              mounted: function() {
                  this.onResponsiveInverted(), window.addEventListener("resize", this.onResponsiveInverted)
              },
              beforeDestroy: function() {
                  window.removeEventListener("resize", this.onResponsiveInverted)
              },
              methods: Object(i["a"])({}, Object(o["b"])("app", ["setDrawer", "toggleDrawer"]), {
                  onClickBtn: function() {
                      this.setDrawer(!this.$store.state.app.drawer)
                  },
                  onClick: function() {},
                  onResponsiveInverted: function() {
                      window.innerWidth < 991 ? this.responsive = !0 : this.responsive = !1
                  }
              })
          },
          c = s,
          l = (a("25f5"), a("2877")),
          u = Object(l["a"])(c, r, n, !1, null, null, null);
      e["default"] = u.exports
  },
  e3a9: function(t, e, a) {
      "use strict";
      a.r(e);
      var r = function() {
              var t = this,
                  e = t.$createElement,
                  a = t._self._c || e;
              return a("v-card", t._g(t._b({
                  style: t.styles
              }, "v-card", t.$attrs, !1), t.$listeners), [t.hasOffset ? a("helper-offset", {
                  attrs: {
                      inline: t.inline,
                      "full-width": t.fullWidth,
                      offset: t.offset
                  }
              }, [t.$slots.offset ? t._t("offset") : a("v-card", {
                  staticClass: "v-card--material__header",
                  class: "elevation-" + t.elevation,
                  attrs: {
                      color: t.color,
                      dark: ""
                  }
              }, [t.title || t.text ? a("span", [a("h4", {
                  staticClass: "title font-weight-light mb-2",
                  domProps: {
                      textContent: t._s(t.title)
                  }
              }), a("p", {
                  staticClass: "category font-weight-thin",
                  domProps: {
                      textContent: t._s(t.text)
                  }
              })]) : t._t("header")], 2)], 2) : t._e(), a("v-card-text", [t._t("default")], 2), t.$slots.actions ? a("v-divider", {
                  staticClass: "mx-3"
              }) : t._e(), t.$slots.actions ? a("v-card-actions", [t._t("actions")], 2) : t._e()], 1)
          },
          n = [],
          i = (a("c5f6"), {
              inheritAttrs: !1,
              props: {
                  color: {
                      type: String,
                      default: "secondary"
                  },
                  elevation: {
                      type: [Number, String],
                      default: 10
                  },
                  inline: {
                      type: Boolean,
                      default: !1
                  },
                  fullWidth: {
                      type: Boolean,
                      default: !1
                  },
                  offset: {
                      type: [Number, String],
                      default: 24
                  },
                  title: {
                      type: String,
                      default: void 0
                  },
                  text: {
                      type: String,
                      default: void 0
                  }
              },
              computed: {
                  hasOffset: function() {
                      return this.$slots.header || this.$slots.offset || this.title || this.text
                  },
                  styles: function() {
                      return this.hasOffset ? {
                          marginBottom: "".concat(this.offset, "px"),
                          marginTop: "".concat(2 * this.offset, "px")
                      } : null
                  }
              }
          }),
          o = i,
          s = (a("cb2c"), a("2877")),
          c = Object(s["a"])(o, r, n, !1, null, null, null);
      e["default"] = c.exports
  },
  e536: function(t, e, a) {
      "use strict";
      var r = a("3c7c"),
          n = a.n(r);
      n.a
  },
  ee4f: function(t, e, a) {
      "use strict";
      var r = a("f30d"),
          n = a.n(r);
      n.a
  },
  f095: function(t, e, a) {},
  f30d: function(t, e, a) {},
  ff57: function(t, e, a) {
      "use strict";
      var r = a("2d4d"),
          n = a.n(r);
      n.a
  },
  ffe0: function(t, e, a) {
      var r = {
          "./core/Drawer.vue": "41c0",
          "./core/Filter.vue": "b2ab",
          "./core/Footer.vue": "7a74",
          "./core/Toolbar.vue": "d23b",
          "./core/View.vue": "9306",
          "./helper/Offset.vue": "c6cc",
          "./material/Card.vue": "e3a9",
          "./material/ChartCard.vue": "78d5",
          "./material/Notification.vue": "9d6c",
          "./material/StatsCard.vue": "42e7"
      };

      function n(t) {
          var e = i(t);
          return a(e)
      }

      function i(t) {
          if (!a.o(r, t)) {
              var e = new Error("Cannot find module '" + t + "'");
              throw e.code = "MODULE_NOT_FOUND", e
          }
          return r[t]
      }
      n.keys = function() {
          return Object.keys(r)
      }, n.resolve = i, t.exports = n, n.id = "ffe0"
  }
});
//# sourceMappingURL=app.586b8641.js.map