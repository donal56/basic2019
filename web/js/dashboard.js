(window["webpackJsonp"] = window["webpackJsonp"] || []).push([
    ["7277"], {
        7277: function(t, a, s) {
            "use strict";
            s.r(a);
            var e = function() {
                    var t = this,
                        a = t.$createElement,
                        s = t._self._c || a;
                    return s("v-container", {
                        attrs: {
                            "fill-height": "",
                            fluid: "",
                            "grid-list-xl": ""
                        }
                    }, [s("v-layout", {
                        attrs: {
                            wrap: ""
                        }
                    }, [s("v-flex", {
                        attrs: {
                            md12: "",
                            sm12: "",
                            lg4: ""
                        }
                    }, [s("material-chart-card", {
                        attrs: {
                            data: t.dailySalesChart.data,
                            options: t.dailySalesChart.options,
                            color: "info",
                            type: "Line"
                        }
                    }, [s("h4", {
                        staticClass: "title font-weight-light"
                    }, [t._v("Daily Sales")]), s("p", {
                        staticClass: "category d-inline-flex font-weight-light"
                    }, [s("v-icon", {
                        attrs: {
                            color: "green",
                            small: ""
                        }
                    }, [t._v("\n            mdi-arrow-up\n          ")]), s("span", {
                        staticClass: "green--text"
                    }, [t._v("55%")]), t._v(" \n          increase in today's sales\n        ")], 1), s("template", {
                        slot: "actions"
                    }, [s("v-icon", {
                        staticClass: "mr-2",
                        attrs: {
                            small: ""
                        }
                    }, [t._v("\n            mdi-clock-outline\n          ")]), s("span", {
                        staticClass: "caption grey--text font-weight-light"
                    }, [t._v("updated 4 minutes ago")])], 1)], 2)], 1), s("v-flex", {
                        attrs: {
                            md12: "",
                            sm12: "",
                            lg4: ""
                        }
                    }, [s("material-chart-card", {
                        attrs: {
                            data: t.emailsSubscriptionChart.data,
                            options: t.emailsSubscriptionChart.options,
                            "responsive-options": t.emailsSubscriptionChart.responsiveOptions,
                            color: "red",
                            type: "Bar"
                        }
                    }, [s("h4", {
                        staticClass: "title font-weight-light"
                    }, [t._v("Email Subscription")]), s("p", {
                        staticClass: "category d-inline-flex font-weight-light"
                    }, [t._v("Last Campaign Performance")]), s("template", {
                        slot: "actions"
                    }, [s("v-icon", {
                        staticClass: "mr-2",
                        attrs: {
                            small: ""
                        }
                    }, [t._v("\n            mdi-clock-outline\n          ")]), s("span", {
                        staticClass: "caption grey--text font-weight-light"
                    }, [t._v("updated 10 minutes ago")])], 1)], 2)], 1), s("v-flex", {
                        attrs: {
                            md12: "",
                            sm12: "",
                            lg4: ""
                        }
                    }, [s("material-chart-card", {
                        attrs: {
                            data: t.dataCompletedTasksChart.data,
                            options: t.dataCompletedTasksChart.options,
                            color: "green",
                            type: "Line"
                        }
                    }, [s("h3", {
                        staticClass: "title font-weight-light"
                    }, [t._v("Completed Tasks")]), s("p", {
                        staticClass: "category d-inline-flex font-weight-light"
                    }, [t._v("Last Last Campaign Performance")]), s("template", {
                        slot: "actions"
                    }, [s("v-icon", {
                        staticClass: "mr-2",
                        attrs: {
                            small: ""
                        }
                    }, [t._v("\n            mdi-clock-outline\n          ")]), s("span", {
                        staticClass: "caption grey--text font-weight-light"
                    }, [t._v("campaign sent 26 minutes ago")])], 1)], 2)], 1), s("v-flex", {
                        attrs: {
                            sm6: "",
                            xs12: "",
                            md6: "",
                            lg3: ""
                        }
                    }, [s("material-stats-card", {
                        attrs: {
                            color: "green",
                            icon: "mdi-store",
                            title: "Revenue",
                            value: "$34,245",
                            "sub-icon": "mdi-calendar",
                            "sub-text": "Last 24 Hours"
                        }
                    })], 1), s("v-flex", {
                        attrs: {
                            sm6: "",
                            xs12: "",
                            md6: "",
                            lg3: ""
                        }
                    }, [s("material-stats-card", {
                        attrs: {
                            color: "orange",
                            icon: "mdi-content-copy",
                            title: "Used Space",
                            value: "49/50",
                            "small-value": "GB",
                            "sub-icon": "mdi-alert",
                            "sub-icon-color": "error",
                            "sub-text": "Get More Space...",
                            "sub-text-color": "text-primary"
                        }
                    })], 1), s("v-flex", {
                        attrs: {
                            sm6: "",
                            xs12: "",
                            md6: "",
                            lg3: ""
                        }
                    }, [s("material-stats-card", {
                        attrs: {
                            color: "red",
                            icon: "mdi-information-outline",
                            title: "Fixed Issues",
                            value: "75",
                            "sub-icon": "mdi-tag",
                            "sub-text": "Tracked from Github"
                        }
                    })], 1), s("v-flex", {
                        attrs: {
                            sm6: "",
                            xs12: "",
                            md6: "",
                            lg3: ""
                        }
                    }, [s("material-stats-card", {
                        attrs: {
                            color: "info",
                            icon: "mdi-twitter",
                            title: "Followers",
                            value: "+245",
                            "sub-icon": "mdi-update",
                            "sub-text": "Just Updated"
                        }
                    })], 1), s("v-flex", {
                        attrs: {
                            md12: "",
                            lg6: ""
                        }
                    }, [s("material-card", {
                        attrs: {
                            color: "orange",
                            title: "Employee Stats",
                            text: "New employees on 15th September, 2016"
                        }
                    }, [s("v-data-table", {
                        attrs: {
                            headers: t.headers,
                            items: t.items,
                            "hide-actions": ""
                        },
                        scopedSlots: t._u([{
                            key: "headerCell",
                            fn: function(a) {
                                var e = a.header;
                                return [s("span", {
                                    staticClass: "font-weight-light text-warning text--darken-3",
                                    domProps: {
                                        textContent: t._s(e.text)
                                    }
                                })]
                            }
                        }, {
                            key: "items",
                            fn: function(a) {
                                var e = a.index,
                                    i = a.item;
                                return [s("td", [t._v(t._s(e + 1))]), s("td", [t._v(t._s(i.name))]), s("td", {
                                    staticClass: "text-xs-right"
                                }, [t._v(t._s(i.salary))]), s("td", {
                                    staticClass: "text-xs-right"
                                }, [t._v(t._s(i.country))]), s("td", {
                                    staticClass: "text-xs-right"
                                }, [t._v(t._s(i.city))])]
                            }
                        }])
                    })], 1)], 1), s("v-flex", {
                        attrs: {
                            md12: "",
                            lg6: ""
                        }
                    }, [s("material-card", {
                        staticClass: "card-tabs",
                        attrs: {
                            color: "green"
                        }
                    }, [s("v-flex", {
                        attrs: {
                            slot: "header"
                        },
                        slot: "header"
                    }, [s("v-tabs", {
                        attrs: {
                            color: "transparent",
                            "slider-color": "white"
                        },
                        model: {
                            value: t.tabs,
                            callback: function(a) {
                                t.tabs = a
                            },
                            expression: "tabs"
                        }
                    }, [s("span", {
                        staticClass: "subheading font-weight-light mr-3",
                        staticStyle: {
                            "align-self": "center"
                        }
                    }, [t._v("Tasks:")]), s("v-tab", {
                        staticClass: "mr-3"
                    }, [s("v-icon", {
                        staticClass: "mr-2"
                    }, [t._v("mdi-bug")]), t._v("\n              Bugs\n            ")], 1), s("v-tab", {
                        staticClass: "mr-3"
                    }, [s("v-icon", {
                        staticClass: "mr-2"
                    }, [t._v("mdi-code-tags")]), t._v("\n              Website\n            ")], 1), s("v-tab", [s("v-icon", {
                        staticClass: "mr-2"
                    }, [t._v("mdi-cloud")]), t._v("\n              Server\n            ")], 1)], 1)], 1), s("v-tabs-items", {
                        model: {
                            value: t.tabs,
                            callback: function(a) {
                                t.tabs = a
                            },
                            expression: "tabs"
                        }
                    }, t._l(3, function(a) {
                        return s("v-tab-item", {
                            key: a
                        }, [s("v-list", {
                            attrs: {
                                "three-line": ""
                            }
                        }, [s("v-list-tile", {
                            on: {
                                click: function(a) {
                                    t.complete(0)
                                }
                            }
                        }, [s("v-list-tile-action", [s("v-checkbox", {
                            attrs: {
                                value: t.list[0],
                                color: "green"
                            }
                        })], 1), s("v-list-tile-title", [t._v('\n                  Sign contract for "What are conference organized afraid of?"\n                ')]), s("div", {
                            staticClass: "d-flex"
                        }, [s("v-tooltip", {
                            attrs: {
                                top: "",
                                "content-class": "top"
                            }
                        }, [s("v-btn", {
                            staticClass: "v-btn--simple",
                            attrs: {
                                slot: "activator",
                                color: "success",
                                icon: ""
                            },
                            slot: "activator"
                        }, [s("v-icon", {
                            attrs: {
                                color: "primary"
                            }
                        }, [t._v("mdi-pencil")])], 1), s("span", [t._v("Edit")])], 1), s("v-tooltip", {
                            attrs: {
                                top: "",
                                "content-class": "top"
                            }
                        }, [s("v-btn", {
                            staticClass: "v-btn--simple",
                            attrs: {
                                slot: "activator",
                                color: "danger",
                                icon: ""
                            },
                            slot: "activator"
                        }, [s("v-icon", {
                            attrs: {
                                color: "error"
                            }
                        }, [t._v("mdi-close")])], 1), s("span", [t._v("Close")])], 1)], 1)], 1), s("v-divider"), s("v-list-tile", {
                            on: {
                                click: function(a) {
                                    t.complete(1)
                                }
                            }
                        }, [s("v-list-tile-action", [s("v-checkbox", {
                            attrs: {
                                value: t.list[1],
                                color: "success"
                            }
                        })], 1), s("v-list-tile-title", [t._v("\n                  Lines From Great Russian Literature? Or E-mails From My Boss?\n                ")]), s("div", {
                            staticClass: "d-flex"
                        }, [s("v-tooltip", {
                            attrs: {
                                top: "",
                                "content-class": "top"
                            }
                        }, [s("v-btn", {
                            staticClass: "v-btn--simple",
                            attrs: {
                                slot: "activator",
                                color: "success",
                                icon: ""
                            },
                            slot: "activator"
                        }, [s("v-icon", {
                            attrs: {
                                color: "primary"
                            }
                        }, [t._v("mdi-pencil")])], 1), s("span", [t._v("Edit")])], 1), s("v-tooltip", {
                            attrs: {
                                top: "",
                                "content-class": "top"
                            }
                        }, [s("v-btn", {
                            staticClass: "v-btn--simple",
                            attrs: {
                                slot: "activator",
                                color: "danger",
                                icon: ""
                            },
                            slot: "activator"
                        }, [s("v-icon", {
                            attrs: {
                                color: "error"
                            }
                        }, [t._v("mdi-close")])], 1), s("span", [t._v("Close")])], 1)], 1)], 1), s("v-divider"), s("v-list-tile", {
                            on: {
                                click: function(a) {
                                    t.complete(2)
                                }
                            }
                        }, [s("v-list-tile-action", [s("v-checkbox", {
                            attrs: {
                                value: t.list[2],
                                color: "success"
                            }
                        })], 1), s("v-list-tile-title", [t._v("\n                  Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit\n                ")]), s("div", {
                            staticClass: "d-flex"
                        }, [s("v-tooltip", {
                            attrs: {
                                top: "",
                                "content-class": "top"
                            }
                        }, [s("v-btn", {
                            staticClass: "v-btn--simple",
                            attrs: {
                                slot: "activator",
                                color: "success",
                                icon: ""
                            },
                            slot: "activator"
                        }, [s("v-icon", {
                            attrs: {
                                color: "primary"
                            }
                        }, [t._v("mdi-pencil")])], 1), s("span", [t._v("Edit")])], 1), s("v-tooltip", {
                            attrs: {
                                top: "",
                                "content-class": "top"
                            }
                        }, [s("v-btn", {
                            staticClass: "v-btn--simple",
                            attrs: {
                                slot: "activator",
                                color: "danger",
                                icon: ""
                            },
                            slot: "activator"
                        }, [s("v-icon", {
                            attrs: {
                                color: "error"
                            }
                        }, [t._v("mdi-close")])], 1), s("span", [t._v("Close")])], 1)], 1)], 1)], 1)], 1)
                    }), 1)], 1)], 1)], 1)], 1)
                },
                i = [],
                o = {
                    data: function() {
                        return {
                            dailySalesChart: {
                                data: {
                                    labels: ["M", "T", "W", "T", "F", "S", "S"],
                                    series: [
                                        [12, 17, 7, 17, 23, 18, 38]
                                    ]
                                },
                                options: {
                                    lineSmooth: this.$chartist.Interpolation.cardinal({
                                        tension: 0
                                    }),
                                    low: 0,
                                    high: 50,
                                    chartPadding: {
                                        top: 0,
                                        right: 0,
                                        bottom: 0,
                                        left: 0
                                    }
                                }
                            },
                            dataCompletedTasksChart: {
                                data: {
                                    labels: ["12am", "3pm", "6pm", "9pm", "12pm", "3am", "6am", "9am"],
                                    series: [
                                        [230, 750, 450, 300, 280, 240, 200, 190]
                                    ]
                                },
                                options: {
                                    lineSmooth: this.$chartist.Interpolation.cardinal({
                                        tension: 0
                                    }),
                                    low: 0,
                                    high: 1e3,
                                    chartPadding: {
                                        top: 0,
                                        right: 0,
                                        bottom: 0,
                                        left: 0
                                    }
                                }
                            },
                            emailsSubscriptionChart: {
                                data: {
                                    labels: ["Ja", "Fe", "Ma", "Ap", "Mai", "Ju", "Jul", "Au", "Se", "Oc", "No", "De"],
                                    series: [
                                        [542, 443, 320, 780, 553, 453, 326, 434, 568, 610, 756, 895]
                                    ]
                                },
                                options: {
                                    axisX: {
                                        showGrid: !1
                                    },
                                    low: 0,
                                    high: 1e3,
                                    chartPadding: {
                                        top: 0,
                                        right: 5,
                                        bottom: 0,
                                        left: 0
                                    }
                                },
                                responsiveOptions: [
                                    ["screen and (max-width: 640px)", {
                                        seriesBarDistance: 5,
                                        axisX: {
                                            labelInterpolationFnc: function(t) {
                                                return t[0]
                                            }
                                        }
                                    }]
                                ]
                            },
                            headers: [{
                                sortable: !1,
                                text: "ID",
                                value: "id"
                            }, {
                                sortable: !1,
                                text: "Name",
                                value: "name"
                            }, {
                                sortable: !1,
                                text: "Salary",
                                value: "salary",
                                align: "right"
                            }, {
                                sortable: !1,
                                text: "Country",
                                value: "country",
                                align: "right"
                            }, {
                                sortable: !1,
                                text: "City",
                                value: "city",
                                align: "right"
                            }],
                            items: [{
                                name: "Dakota Rice",
                                country: "Niger",
                                city: "Oud-Tunrhout",
                                salary: "$35,738"
                            }, {
                                name: "Minerva Hooper",
                                country: "Curaçao",
                                city: "Sinaai-Waas",
                                salary: "$23,738"
                            }, {
                                name: "Sage Rodriguez",
                                country: "Netherlands",
                                city: "Overland Park",
                                salary: "$56,142"
                            }, {
                                name: "Philip Chanley",
                                country: "Korea, South",
                                city: "Gloucester",
                                salary: "$38,735"
                            }, {
                                name: "Doris Greene",
                                country: "Malawi",
                                city: "Feldkirchen in Kārnten",
                                salary: "$63,542"
                            }],
                            tabs: 0,
                            list: {
                                0: !1,
                                1: !1,
                                2: !1
                            }
                        }
                    },
                    methods: {
                        complete: function(t) {
                            this.list[t] = !this.list[t]
                        }
                    }
                },
                l = o,
                r = s("2877"),
                n = Object(r["a"])(l, e, i, !1, null, null, null);
            a["default"] = n.exports
        }
    }
]);
//# sourceMappingURL=7277.b072dd4e.js.map