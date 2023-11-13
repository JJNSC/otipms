/*! function(e) {
    "use strict";
    var t = function() {
        this.$body = e("body"), this.$modal = e("#event-modal"), this.$event = "#external-events div.external-event", this.$calendar = e("#calendar"), this.$saveCategoryBtn = e(".save-category"), this.$categoryForm = e("#add-category form"), this.$extEvents = e("#external-events"), this.$calendarObj = null
    };
    t.prototype.onDrop = function(t, n) {
        var a = t.data("eventObject"),
            o = t.attr("data-class"),
            i = e.extend({}, a);
        i.start = n, o && (i.className = [o]), this.$calendar.fullCalendar("renderEvent", i, !0), e("#drop-remove").is(":checked") && t.remove()
    }, t.prototype.onEventClick = function(t, n, a) {
        var o = this,
            i = e("<form></form>");
        i.append("<label>Change event name</label>"), i.append("<div class='input-group'><input class='form-control' type=text value='" + t.title + "' /><span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span></div>"), o.$modal.modal({
            backdrop: "static"
        }), o.$modal.find(".delete-event").show().end().find(".save-event").hide().end().find(".modal-body").empty().prepend(i).end().find(".delete-event").unbind("click").on("click", function() {
            o.$calendarObj.fullCalendar("removeEvents", function(e) {
                return e._id == t._id
            }), o.$modal.modal("hide")
        }), o.$modal.find("form").on("submit", function() {
            return t.title = i.find("input[type=text]").val(), o.$calendarObj.fullCalendar("updateEvent", t), o.$modal.modal("hide"), !1
        })
    }, t.prototype.onSelect = function(t, n, a) {
        var o = this;
        o.$modal.modal({
            backdrop: "static"
        });
        var i = e("<form></form>");
        i.append("<div class='row'></div>"), i.find(".row").append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Event Name</label><input class='form-control' placeholder='Insert Event Name' type='text' name='title'/></div></div>").append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Category</label><select class='form-control' name='category'></select></div></div>").find("select[name='category']").append("<option value='bg-danger'>Danger</option>").append("<option value='bg-success'>Success</option>").append("<option value='bg-dark'>Dark</option>").append("<option value='bg-primary'>Primary</option>").append("<option value='bg-pink'>Pink</option>").append("<option value='bg-info'>Info</option>").append("<option value='bg-warning'>Warning</option></div></div>"), o.$modal.find(".delete-event").hide().end().find(".save-event").show().end().find(".modal-body").empty().prepend(i).end().find(".save-event").unbind("click").on("click", function() {
            i.submit()
        }), o.$modal.find("form").on("submit", function() {
            var e = i.find("input[name='title']").val(),
                a = (i.find("input[name='beginning']").val(), i.find("input[name='ending']").val(), i.find("select[name='category'] option:checked").val());
            return null !== e && 0 != e.length ? (o.$calendarObj.fullCalendar("renderEvent", {
                title: e,
                start: t,
                end: n,
                allDay: !1,
                className: a
            }, !0), o.$modal.modal("hide")) : alert("You have to give a title to your event"), !1
        }), o.$calendarObj.fullCalendar("unselect")
    }, t.prototype.enableDrag = function() {
        e(this.$event).each(function() {
            var t = {
                title: e.trim(e(this).text())
            };
            e(this).data("eventObject", t), e(this).draggable({
                zIndex: 999,
                revert: !0,
                revertDuration: 0
            })
        })
    }, t.prototype.init = function() {
        this.enableDrag();
        var t = new Date,
            n = (t.getDate(), t.getMonth(), t.getFullYear(), new Date(e.now())),
            a = [{
                title: "샘플2",
                start: new Date(e.now() + 158e6),
                end: new Date(e.now() + 158e6),
                className: "bg-dark"
            }, {
                title: "샘플1",
                start: n,
                end: n,
                className: "bg-danger"
            }, {
                title: "샘플3",
                start: new Date(e.now() + 338e6),
                className: "bg-primary"
            }, {
                title: "테스트1",
                start: new Date("2023-10-25T11:25:30"),
                end: new Date("2023-10-25T12:25:30"),
                className: "bg-dark"
            }, {
                title: "테스트2",
                start: 1699369200000,
                end: new Date("2023-10-25T20:25:30"),
                className: "bg-danger"
            }, {
                title: "테스트3",
                start: new Date(1699369200000),
                end: new Date("2023-10-24T24:00:00"),
                className: "bg-primary"
            }],
            o = this;
        o.$calendarObj = o.$calendar.fullCalendar({
            slotDuration: "00:15:00",
            minTime: "06:00:00",
            maxTime: "23:00:00",
            defaultView: "month",
            handleWindowResize: !0,
            height: e(window).height() - 200,
            header: {
                left: "prev,next today",
                center: "title",
                right: "month,agendaWeek,agendaDay"
            },
            events: a,
            editable: !0,
            droppable: !0,
            eventLimit: !0,
            selectable: !0,
            drop: function(t) {
                o.onDrop(e(this), t)
            },
            select: function(e, t, n) {
                o.onSelect(e, t, n)
            },
            eventClick: function(e, t, n) {
                o.onEventClick(e, t, n)
            }
        }), this.$saveCategoryBtn.on("click", function() {
            var e = o.$categoryForm.find("input[name='category-name']").val(),
                t = o.$categoryForm.find("select[name='category-color']").val();
            null !== e && 0 != e.length && (o.$extEvents.append('<div class="external-event bg-' + t + '" data-class="bg-' + t + '" style="position: relative;"><i class="fa fa-move"></i>' + e + "</div>"), o.enableDrag())
        })
    }, e.CalendarApp = new t, e.CalendarApp.Constructor = t
}(window.jQuery),
function(e) {
    "use strict";
    e.CalendarApp.init()
}(window.jQuery);*/

var list = [];
 
! function(e) {
    "use strict";
    var t = function() {
        this.$body = e("body"), this.$modal = e("#event-modal"), this.$event = "#external-events div.external-event", this.$calendar = e("#calendar"), this.$saveCategoryBtn = e(".save-category"), this.$categoryForm = e("#add-category form"), this.$extEvents = e("#external-events"), this.$calendarObj = null
    };
    t.prototype.onDrop = function(t, n) {
        var a = t.data("eventObject"),
            o = t.attr("data-class"),
            i = e.extend({}, a);
        i.start = n, o && (i.className = [o]), this.$calendar.fullCalendar("renderEvent", i, !0), e("#drop-remove").is(":checked") && t.remove()
    }, t.prototype.onEventClick = function(t, n, a) {
        var o = this,
            i = e("<form></form>");
        i.append("<label>Change event name</label>"), i.append("<div class='input-group'><input class='form-control' type=text value='" + t.title + "' /><span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span></div>"), o.$modal.modal({
            backdrop: "static"
        }), o.$modal.find(".delete-event").show().end().find(".save-event").hide().end().find(".modal-body").empty().prepend(i).end().find(".delete-event").unbind("click").on("click", function() {
            o.$calendarObj.fullCalendar("removeEvents", function(e) {
                return e._id == t._id
            }), o.$modal.modal("hide")
        }), o.$modal.find("form").on("submit", function() {
            return t.title = i.find("input[type=text]").val(), o.$calendarObj.fullCalendar("updateEvent", t), o.$modal.modal("hide"), !1
        })
    }, t.prototype.onSelect = function(t, n, a) {
        var o = this;
        o.$modal.modal({
            backdrop: "static"
        });
        var i = e("<form></form>");
        i.append("<div class='row'></div>"), i.find(".row").append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Event Name</label><input class='form-control' placeholder='Insert Event Name' type='text' name='title'/></div></div>").append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Category</label><select class='form-control' name='category'></select></div></div>").find("select[name='category']").append("<option value='bg-danger'>Danger</option>").append("<option value='bg-success'>Success</option>").append("<option value='bg-dark'>Dark</option>").append("<option value='bg-primary'>Primary</option>").append("<option value='bg-pink'>Pink</option>").append("<option value='bg-info'>Info</option>").append("<option value='bg-warning'>Warning</option></div></div>"), o.$modal.find(".delete-event").hide().end().find(".save-event").show().end().find(".modal-body").empty().prepend(i).end().find(".save-event").unbind("click").on("click", function() {
            i.submit()
        }), o.$modal.find("form").on("submit", function() {
            var e = i.find("input[name='title']").val(),
                a = (i.find("input[name='beginning']").val(), i.find("input[name='ending']").val(), i.find("select[name='category'] option:checked").val());
            return null !== e && 0 != e.length ? (o.$calendarObj.fullCalendar("renderEvent", {
                title: e,
                start: t,
                end: n,
                allDay: !1,
                className: a
            }, !0), o.$modal.modal("hide")) : alert("You have to give a title to your event"), !1
        }), o.$calendarObj.fullCalendar("unselect")
    }, t.prototype.enableDrag = function() {
        e(this.$event).each(function() {
            var t = {
                title: e.trim(e(this).text())
            };
            e(this).data("eventObject", t), e(this).draggable({
                zIndex: 999,
                revert: !0,
                revertDuration: 0
            })
        })
    }, t.prototype.init = function() {
        this.enableDrag();
        var t = new Date,
            n = (t.getDate(), t.getMonth(), t.getFullYear(), new Date(e.now())),
            a = list,
            o = this;
        o.$calendarObj = o.$calendar.fullCalendar({
            slotDuration: "00:15:00",
            minTime: "06:00:00",
            maxTime: "23:00:00",
            defaultView: "month",
            handleWindowResize: !0,
            height: e(window).height() - 200,
            header: {
                left: "prev",
                center: "title",
                right: "next"
            },
            events: a,
            editable: !0,
            droppable: !0,
            eventLimit: !0,
            selectable: !0,
            drop: function(t) {
                o.onDrop(e(this), t)
            },
            select: function(e, t, n) {
                o.onSelect(e, t, n)
            },
            eventClick: function(e, t, n) {
                o.onEventClick(e, t, n)
            }, eventAfterAllRender: function(view) {
                // 월(view) 렌더링이 완료된 후에 스타일 변경
                const elements = document.querySelectorAll('.fc-day.bg-custom');
                elements.forEach(element => {
                    element.style.removeProperty('background-color');
                    element.style.backgroundColor = '#798591';
                    // 기존의 color 스타일을 제거하거나 변경할 필요가 없다면 주석 처리
                    // element.style.removeProperty('color');
                    // element.style.color = 'white';
                });
            }
        }), this.$saveCategoryBtn.on("click", function() {
            var e = o.$categoryForm.find("input[name='category-name']").val(),
                t = o.$categoryForm.find("select[name='category-color']").val();
            null !== e && 0 != e.length && (o.$extEvents.append('<div class="external-event bg-' + t + '" data-class="bg-' + t + '" style="position: relative;"><i class="fa fa-move"></i>' + e + "</div>"), o.enableDrag())
        })
    }, e.CalendarApp = new t, e.CalendarApp.Constructor = t
}(window.jQuery),
function(e) {
    "use strict";
 // Ajax 요청
    $.ajax({
        url: "/otipms/getTaskListForCalendar",
        method: "post",
        data: {},
        success: function(data) {

            // FullCalendar의 events 속성 업데이트
            list = data.taskList.map(function(task) {
            	const startDate = new Date(task.taskStartDate);
                const endDate = new Date(task.taskEndDate);
            	console.log("시작 날짜가.... " + task.taskStartDate);
            	console.log("종료 날짜가.... " + task.taskEndDate);
            	
            	return {
        			title: task.taskName,
        			start: startDate,
        			end: endDate,
        			className: "bg-" + task.taskColor // 원하는 클래스명으로 변경
        		};
            });

            /*// FullCalendar 초기화
            var $calendar = $("#calendar"); // FullCalendar가 표시될 엘리먼트 선택자
            var calendar = $calendar.fullCalendar({
                // FullCalendar 설정 옵션
                // ...
                events: list, // AJAX 요청에서 가져온 일정 데이터를 사용
            });*/
            
            e.CalendarApp.init();
            
            // 모든 fc-time 클래스를 갖는 요소를 가져옵니다.
            const fcTimeElements = document.querySelectorAll('.fc-time');

            // 가져온 모든 요소에 대해 반복하며 display 속성을 none으로 설정합니다.
            fcTimeElements.forEach(element => {
                element.style.display = 'none';
            });
        },
        error: function(error) {
            console.log(error);
        }
    });
}(window.jQuery);

/*var taskList = [];

function(e) {
    "use strict";
    var t = function() {
        this.$body = e("body"), this.$modal = e("#event-modal"), this.$event = "#external-events div.external-event", this.$calendar = e("#taskCalendar"), this.$saveCategoryBtn = e(".save-category"), this.$categoryForm = e("#add-category form"), this.$extEvents = e("#external-events"), this.$calendarObj = null
    };
    t.prototype.onDrop = function(t, n) {
        var a = t.data("eventObject"),
            o = t.attr("data-class"),
            i = e.extend({}, a);
        i.start = n, o && (i.className = [o]), this.$calendar.fullCalendar("renderEvent", i, !0), e("#drop-remove").is(":checked") && t.remove()
    }, t.prototype.onEventClick = function(t, n, a) {
        var o = this,
            i = e("<form></form>");
        i.append("<label>Change event name</label>"), i.append("<div class='input-group'><input class='form-control' type=text value='" + t.title + "' /><span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span></div>"), o.$modal.modal({
            backdrop: "static"
        }), o.$modal.find(".delete-event").show().end().find(".save-event").hide().end().find(".modal-body").empty().prepend(i).end().find(".delete-event").unbind("click").on("click", function() {
            o.$calendarObj.fullCalendar("removeEvents", function(e) {
                return e._id == t._id
            }), o.$modal.modal("hide")
        }), o.$modal.find("form").on("submit", function() {
            return t.title = i.find("input[type=text]").val(), o.$calendarObj.fullCalendar("updateEvent", t), o.$modal.modal("hide"), !1
        })
    }, t.prototype.onSelect = function(t, n, a) {
        var o = this;
        o.$modal.modal({
            backdrop: "static"
        });
        var i = e("<form></form>");
        i.append("<div class='row'></div>"), i.find(".row").append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Event Name</label><input class='form-control' placeholder='Insert Event Name' type='text' name='title'/></div></div>").append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Category</label><select class='form-control' name='category'></select></div></div>").find("select[name='category']").append("<option value='bg-danger'>Danger</option>").append("<option value='bg-success'>Success</option>").append("<option value='bg-dark'>Dark</option>").append("<option value='bg-primary'>Primary</option>").append("<option value='bg-pink'>Pink</option>").append("<option value='bg-info'>Info</option>").append("<option value='bg-warning'>Warning</option></div></div>"), o.$modal.find(".delete-event").hide().end().find(".save-event").show().end().find(".modal-body").empty().prepend(i).end().find(".save-event").unbind("click").on("click", function() {
            i.submit()
        }), o.$modal.find("form").on("submit", function() {
            var e = i.find("input[name='title']").val(),
                a = (i.find("input[name='beginning']").val(), i.find("input[name='ending']").val(), i.find("select[name='category'] option:checked").val());
            return null !== e && 0 != e.length ? (o.$calendarObj.fullCalendar("renderEvent", {
                title: e,
                start: t,
                end: n,
                allDay: !1,
                className: a
            }, !0), o.$modal.modal("hide")) : alert("You have to give a title to your event"), !1
        }), o.$calendarObj.fullCalendar("unselect")
    }, t.prototype.enableDrag = function() {
        e(this.$event).each(function() {
            var t = {
                title: e.trim(e(this).text())
            };
            e(this).data("eventObject", t), e(this).draggable({
                zIndex: 999,
                revert: !0,
                revertDuration: 0
            })
        })
    }, t.prototype.init = function() {
        this.enableDrag();
        var t = new Date,
            n = (t.getDate(), t.getMonth(), t.getFullYear(), new Date(e.now())),
            a = taskList,
            o = this;
        o.$calendarObj = o.$calendar.fullCalendar({
            slotDuration: "00:15:00",
            minTime: "06:00:00",
            maxTime: "23:00:00",
            defaultView: "month",
            handleWindowResize: !0,
            height: e(window).height() - 200,
            header: {
                left: "prev,next today",
                center: "title",
                right: "month,agendaWeek,agendaDay"
            },
            events: a,
            editable: !0,
            droppable: !0,
            eventLimit: !0,
            selectable: !0,
            drop: function(t) {
                o.onDrop(e(this), t)
            },
            select: function(e, t, n) {
                o.onSelect(e, t, n)
            },
            eventClick: function(e, t, n) {
                o.onEventClick(e, t, n)
            }, eventAfterAllRender: function(view) {
                // 월(view) 렌더링이 완료된 후에 스타일 변경
                const elements = document.querySelectorAll('.fc-day.bg-custom');
                elements.forEach(element => {
                    element.style.removeProperty('background-color');
                    element.style.backgroundColor = '#798591';
                    // 기존의 color 스타일을 제거하거나 변경할 필요가 없다면 주석 처리
                    // element.style.removeProperty('color');
                    // element.style.color = 'white';
                });
            }
        }), this.$saveCategoryBtn.on("click", function() {
            var e = o.$categoryForm.find("input[name='category-name']").val(),
                t = o.$categoryForm.find("select[name='category-color']").val();
            null !== e && 0 != e.length && (o.$extEvents.append('<div class="external-event bg-' + t + '" data-class="bg-' + t + '" style="position: relative;"><i class="fa fa-move"></i>' + e + "</div>"), o.enableDrag())
        })
    }, e.CalendarApp = new t, e.CalendarApp.Constructor = t
}(window.jQuery),
function(e) {
    "use strict";
 // Ajax 요청
    $.ajax({
        url: "/otipms/getScheduleList",
        method: "post",
        data: {},
        success: function(data) {

            // FullCalendar의 events 속성 업데이트
        	taskList = data.scheduleList.map(function(schedule) {
            	const startDate = new Date(schedule.scheduleStartDate);
                const endDate = new Date(schedule.scheduleEndDate);
            	console.log("날짜가.... " + schedule.scheduleStartDate);
            	
            	return {
        			title: schedule.scheduleName,
        			start: startDate,
        			end: endDate,
        			className: "bg-" + schedule.scheduleColor // 원하는 클래스명으로 변경
        		};
            });

            // FullCalendar 초기화
            var $calendar = $("#calendar"); // FullCalendar가 표시될 엘리먼트 선택자
            var calendar = $calendar.fullCalendar({
                // FullCalendar 설정 옵션
                // ...
                events: list, // AJAX 요청에서 가져온 일정 데이터를 사용
            });
            
            e.CalendarApp.init();
        },
        error: function(error) {
            console.log(error);
        }
    });
    //e.CalendarApp.init()
}(window.jQuery);*/
