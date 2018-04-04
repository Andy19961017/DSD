require(["gitbook","jQuery"],function(t,n){function e(t){var e=n("<img>",{"class":"comment-avatar",src:t.user.urls.avatar}),a=n("<div>",{"class":"comment-body "}),o=n("<a>",{"class":"comment-user",target:"_blank",href:t.user.urls.profile,text:t.user.name}),i=""
t.title&&(i+=t.title,t.body&&(i+="<br>")),t.body&&(i+=t.body)
var c=n("<div>",{"class":"comment-content",html:i})
a.append(o),a.append(c)
var s=n("<div>")
return s.append(e),s.append(a),s.html()}function a(t){var e=n("<div>",{"class":"thread-body"}),a=n("<div>",{"class":"thread-title",text:t.title}),o=n("<div>",{"class":"thread-user",text:"#"+t.number+" posted by "+t.user.name})
e.append(a),e.append(o)
var i=n("<div>")
return i.append(e),i.html()}function o(n){var e=t.state.$book.find(".page-wrapper"),a=e.find(".page-inner"),o=t.state.$book.find(".navigation.navigation-next")
if(e.toggleClass("comments-open",n),e.hasClass("comments-open")){var i=330,c=a.width(),s=e.width(),r=0==o.length?0:o.width(),p=(s-c)/2-r,m=p-i
m=Math.max(m,-i),m=Math.min(m,0),a.css("left",m+"px")}else a.css("left","0px")}function i(n){return(t.state.bookRoot+"gitbook/api/"+n).replace(/([^:]\/)\/+/g,"$1")}function c(){location.href=i("login")}function s(t){var n=window.open(t,"_blank")
n.focus()}function r(t,e,a,o){n.ajax({method:t,dataType:"json",url:i(e),data:a,success:function(t,n,e){L=!0,G=!!e.getResponseHeader("X-GitBook-Auth"),o(t)},error:function(t,n){L&&(alert("Error processing comments: "+n),console.log(t,n))}})}function p(){return t.state.innerLanguage?[t.state.innerLanguage,t.state.filepath].join("/"):t.state.filepath}function m(){r("GET","discussions",{filename:p(),state:"open"},function(t){A=t.list,P()})}function u(t){r("GET","discussions/"+t+"/comments",{limit:N},function(n){E[t]=n,j(t)})}function l(n,e,a,o){r("POST","discussions",{title:n,body:e,context:{filename:p(),chapterTitle:t.state.chapterTitle,section:a}},o)}function d(t){A=n.grep(A,function(n){return n.number!=t}),P(),r("POST","discussions/"+t,{state:"closed"},function(){m()})}function f(t,n,e){r("POST","discussions/"+t+"/comments",{body:n},function(n){E[t]=E[t]||[],E[t].total=E[t].total+1,E[t].list.push(n),j(t),u(t),e(n)})}function h(t){var e=t.split(" "),a=n.map(A,function(t){var a=(t.context.section||"").split(" "),o=n.grep(a,function(t){return-1!==n.inArray(t,e)}),i=n.grep(e,function(t){return-1!==n.inArray(t,a)}),c=(o.length/a.length+i.length/e.length)/2
return{matching:c,thread:t}})
return a=n.grep(a,function(t){return t.matching>.8}),n.map(a,function(t){return t.thread})}function v(t){return t.clone().find(".comments-area,.comments-icon").remove().end().text()}function g(t,e){console.log(v(e))
var a,o,i,s=n("<div>",{"class":"comments-post"})
G?(a=n("<input>",{type:"text",placeholder:"Start a new discussion"}),o=n("<input>",{type:"text",placeholder:"Optional comment"}),i=k([{text:"Post",click:function(){l(a.val(),o.val(),v(e),function(n){A.push(n),P(),w(t,e,n)})}}]),o.hide(),a.keyup(function(t){a.val().length>3?o.show():o.val()||o.hide()}),s.append(a),s.append(o),s.append(i)):(i=k([{text:"Sign in to comment",click:c}]),s.append(i)),t.empty(),t.append(s),a&&a.focus()}function b(t){return n("<div>",{"class":"thread",html:a(t)})}function x(t,a){return n("<div>",{"class":"comment",html:e(t)})}function k(t){var e=n("<div>",{"class":"comments-toolbar"})
return n.each(t,function(t,a){var o=n("<a>",{href:"#",text:a.text,click:function(t){t.preventDefault(),a.click()}})
o.appendTo(e)}),e}function y(t,e){t.empty()
var a=n("<input>",{type:"text",placeholder:"Leave a comment"}),o=k([{text:"Post",click:function(){f(e.number,a.val(),function(){a.val("")})}}])
t.append(a),t.append(o),a.focus()}function w(t,e,a,o){u(a.number)
var i=[]
G?(a.permissions.comment&&i.push({text:"Comment",click:function(){y(s,a)}}),a.permissions.close&&i.push({text:"Close",click:function(){S(e,o),d(a.number)}}),i.push({text:"New Thread",click:function(){g(t,e)}})):i=[{text:"Sign in to comment",click:c}]
var s=n("<div>",{"class":"comments-post"})
s.append(k(i))
var r=n("<div>",{"class":"comments-list","data-thcomments":a.number})
t.empty(),t.append(x(a)),t.append(r),t.append(s),j(a.number)}function C(t,e,a){var o=n("<div>",{"class":"comments-threads"})
n.each(a,function(n,a){var i=b(a)
i.click(function(n){w(t,e,a)}),o.append(i)})
var i
i=k(G?[{text:"New Thread",click:function(){g(t,e)}}]:[{text:"Sign in to create a thread",click:c}]),t.empty(),t.append(o),t.append(i)}function T(){t.state.$book.find(".page-wrapper .comments-section").removeClass("has-comments-open")}function S(t,e){var a=!t.hasClass("has-comments-open")
if(T(),t.toggleClass("has-comments-open",a),o(a),a){t.find(".comments-area").remove()
var i=n("<div>",{"class":"comments-area"})
t.append(i),e.length>1?C(i,t,e):1==e.length?w(i,t,e[0],e):g(i,t)}}function $(t){var e=v(t)
if(!(e.length<5)){var a=h(e),o=0
n.each(a,function(t,n){o+=n.comments+1})
var i=n("<div>",{"class":"marker",text:o?o:"+"})
i.on("click",function(){S(t,a)})
var c=n("<div>",{"class":"comments-icon"})
c.append(i),t.find(".comments-icon").remove(),t.addClass("comments-section"),t.toggleClass("has-comments",o>0),O.highlightCommented&&t.toggleClass("has-highlight-comments",o>0),t.append(c)}}function P(){var e=t.state.$book.find(".page-wrapper"),a=e.find(M)
a.each(function(){$(n(this))})}function j(e){var a=n.grep(A,function(t){return t.number==e}),o=a[0]
if(E[e]&&o){var i=t.state.$book.find('.page-wrapper div[data-thcomments="'+e+'"]')
if(0!=i.length){i.empty()
var c=Math.max(0,E[e].total-N)
c>0&&i.append(k([{text:"View "+c+" more comments",click:function(){s(o.urls.details)}}]))
var r=(E[e].list||[]).reverse()
n.each(r,function(t,n){i.append(x(n))})}}}var O={},A=[],E={},G=!1,L=!1,M="p",N=4
t.events.bind("start",function(t,n){O=n.comment||{}}),t.events.bind("page.change",function(){A=[],m()})})
