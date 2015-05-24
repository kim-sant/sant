(function(){var t,e,n,r,a,i,o,l,s,c,h,u,p,d,m,v,f,g,y,$=[].slice,w=[].indexOf||function(t){for(var e=0,n=this.length;n>e;e++)if(e in this&&this[e]===t)return e;return-1};t=jQuery,t.payment={},t.payment.fn={},t.fn.payment=function(){var e,n;return n=arguments[0],e=2<=arguments.length?$.call(arguments,1):[],t.payment.fn[n].apply(this,e)},a=/(\d{1,4})/g,r=[{type:"maestro",pattern:/^(5018|5020|5038|6304|6759|676[1-3])/,format:a,length:[12,13,14,15,16,17,18,19],cvcLength:[3],luhn:!0},{type:"dinersclub",pattern:/^(36|38|30[0-5])/,format:a,length:[14],cvcLength:[3],luhn:!0},{type:"laser",pattern:/^(6706|6771|6709)/,format:a,length:[16,17,18,19],cvcLength:[3],luhn:!0},{type:"jcb",pattern:/^35/,format:a,length:[16],cvcLength:[3],luhn:!0},{type:"unionpay",pattern:/^62/,format:a,length:[16,17,18,19],cvcLength:[3],luhn:!1},{type:"discover",pattern:/^(6011|65|64[4-9]|622)/,format:a,length:[16],cvcLength:[3],luhn:!0},{type:"mastercard",pattern:/^5[1-5]/,format:a,length:[16],cvcLength:[3],luhn:!0},{type:"amex",pattern:/^3[47]/,format:/(\d{1,4})(\d{1,6})?(\d{1,5})?/,length:[15],cvcLength:[3,4],luhn:!0},{type:"visa",pattern:/^4/,format:a,length:[13,14,15,16],cvcLength:[3],luhn:!0}],e=function(t){var e,n,a;for(t=(t+"").replace(/\D/g,""),n=0,a=r.length;a>n;n++)if(e=r[n],e.pattern.test(t))return e},n=function(t){var e,n,a;for(n=0,a=r.length;a>n;n++)if(e=r[n],e.type===t)return e},p=function(t){var e,n,r,a,i,o;for(r=!0,a=0,n=(t+"").split("").reverse(),i=0,o=n.length;o>i;i++)e=n[i],e=parseInt(e,10),(r=!r)&&(e*=2),e>9&&(e-=9),a+=e;return a%10===0},u=function(t){var e;return null!=t.prop("selectionStart")&&t.prop("selectionStart")!==t.prop("selectionEnd")?!0:("undefined"!=typeof document&&null!==document&&null!=(e=document.selection)&&"function"==typeof e.createRange?e.createRange().text:void 0)?!0:!1},d=function(e){return setTimeout(function(){var n,r;return n=t(e.currentTarget),r=n.val(),r=t.payment.formatCardNumber(r),n.val(r)})},l=function(n){var r,a,i,o,l,s,c;return i=String.fromCharCode(n.which),!/^\d+$/.test(i)||(r=t(n.currentTarget),c=r.val(),a=e(c+i),o=(c.replace(/\D/g,"")+i).length,s=16,a&&(s=a.length[a.length.length-1]),o>=s||null!=r.prop("selectionStart")&&r.prop("selectionStart")!==c.length)?void 0:(l=a&&"amex"===a.type?/^(\d{4}|\d{4}\s\d{6})$/:/(?:^|\s)(\d{4})$/,l.test(c)?(n.preventDefault(),r.val(c+" "+i)):l.test(c+i)?(n.preventDefault(),r.val(c+i+" ")):void 0)},i=function(e){var n,r;return n=t(e.currentTarget),r=n.val(),e.meta||8!==e.which||null!=n.prop("selectionStart")&&n.prop("selectionStart")!==r.length?void 0:/\d\s$/.test(r)?(e.preventDefault(),n.val(r.replace(/\d\s$/,""))):/\s\d?$/.test(r)?(e.preventDefault(),n.val(r.replace(/\s\d?$/,""))):void 0},s=function(e){var n,r,a;return r=String.fromCharCode(e.which),/^\d+$/.test(r)?(n=t(e.currentTarget),a=n.val()+r,/^\d$/.test(a)&&"0"!==a&&"1"!==a?(e.preventDefault(),n.val("0"+a+" / ")):/^\d\d$/.test(a)?(e.preventDefault(),n.val(""+a+" / ")):void 0):void 0},c=function(e){var n,r,a;return r=String.fromCharCode(e.which),/^\d+$/.test(r)?(n=t(e.currentTarget),a=n.val(),/^\d\d$/.test(a)?n.val(""+a+" / "):void 0):void 0},h=function(e){var n,r,a;return r=String.fromCharCode(e.which),"/"===r?(n=t(e.currentTarget),a=n.val(),/^\d$/.test(a)&&"0"!==a?n.val("0"+a+" / "):void 0):void 0},o=function(e){var n,r;if(!e.meta&&(n=t(e.currentTarget),r=n.val(),8===e.which&&(null==n.prop("selectionStart")||n.prop("selectionStart")===r.length)))return/\d(\s|\/)+$/.test(r)?(e.preventDefault(),n.val(r.replace(/\d(\s|\/)*$/,""))):/\s\/\s?\d?$/.test(r)?(e.preventDefault(),n.val(r.replace(/\s\/\s?\d?$/,""))):void 0},g=function(t){var e;return t.metaKey||t.ctrlKey?!0:32===t.which?!1:0===t.which?!0:t.which<33?!0:(e=String.fromCharCode(t.which),!!/[\d\s]/.test(e))},v=function(n){var r,a,i,o;return r=t(n.currentTarget),i=String.fromCharCode(n.which),/^\d+$/.test(i)&&!u(r)?(o=(r.val()+i).replace(/\D/g,""),a=e(o),a?o.length<=a.length[a.length.length-1]:o.length<=16):void 0},f=function(e){var n,r,a;return n=t(e.currentTarget),r=String.fromCharCode(e.which),/^\d+$/.test(r)&&!u(n)?(a=n.val()+r,a=a.replace(/\D/g,""),a.length>6?!1:void 0):void 0},m=function(e){var n,r,a;return n=t(e.currentTarget),r=String.fromCharCode(e.which),/^\d+$/.test(r)?(a=n.val()+r,a.length<=4):void 0},y=function(e){var n,a,i,o,l;return n=t(e.currentTarget),l=n.val(),o=t.payment.cardType(l)||"unknown",n.hasClass(o)?void 0:(a=function(){var t,e,n;for(n=[],t=0,e=r.length;e>t;t++)i=r[t],n.push(i.type);return n}(),n.removeClass("unknown"),n.removeClass(a.join(" ")),n.addClass(o),n.toggleClass("identified","unknown"!==o),n.trigger("payment.cardType",o))},t.payment.fn.formatCardCVC=function(){return this.payment("restrictNumeric"),this.on("keypress",m),this},t.payment.fn.formatCardExpiry=function(){return this.payment("restrictNumeric"),this.on("keypress",f),this.on("keypress",s),this.on("keypress",h),this.on("keypress",c),this.on("keydown",o),this},t.payment.fn.formatCardNumber=function(){return this.payment("restrictNumeric"),this.on("keypress",v),this.on("keypress",l),this.on("keydown",i),this.on("keyup",y),this.on("paste",d),this},t.payment.fn.restrictNumeric=function(){return this.on("keypress",g),this},t.payment.fn.cardExpiryVal=function(){return t.payment.cardExpiryVal(t(this).val())},t.payment.cardExpiryVal=function(t){var e,n,r,a;return t=t.replace(/\s/g,""),a=t.split("/",2),e=a[0],r=a[1],2===(null!=r?r.length:void 0)&&/^\d+$/.test(r)&&(n=(new Date).getFullYear(),n=n.toString().slice(0,2),r=n+r),e=parseInt(e,10),r=parseInt(r,10),{month:e,year:r}},t.payment.validateCardNumber=function(t){var n,r;return t=(t+"").replace(/\s+|-/g,""),/^\d+$/.test(t)?(n=e(t),n?(r=t.length,w.call(n.length,r)>=0&&(n.luhn===!1||p(t))):!1):!1},t.payment.validateCardExpiry=function(e,n){var r,a,i,o;return"object"==typeof e&&"month"in e&&(o=e,e=o.month,n=o.year),e&&n?(e=t.trim(e),n=t.trim(n),/^\d+$/.test(e)&&/^\d+$/.test(n)&&parseInt(e,10)<=12?(2===n.length&&(i=(new Date).getFullYear(),i=i.toString().slice(0,2),n=i+n),a=new Date(n,e),r=new Date,a.setMonth(a.getMonth()-1),a.setMonth(a.getMonth()+1,1),a>r):!1):!1},t.payment.validateCardCVC=function(e,r){var a,i;return e=t.trim(e),/^\d+$/.test(e)?r?(a=e.length,w.call(null!=(i=n(r))?i.cvcLength:void 0,a)>=0):e.length>=3&&e.length<=4:!1},t.payment.cardType=function(t){var n;return t?(null!=(n=e(t))?n.type:void 0)||null:null},t.payment.formatCardNumber=function(t){var n,r,a,i;return(n=e(t))?(a=n.length[n.length.length-1],t=t.replace(/\D/g,""),t=t.slice(0,+a+1||9e9),n.format.global?null!=(i=t.match(n.format))?i.join(" "):void 0:(r=n.format.exec(t),null!=r&&r.shift(),null!=r?r.join(" "):void 0)):t}}).call(this),$(document).ready(function(){$("#new_payment").is("*")&&($(".cardNumber").payment("formatCardNumber"),$(".cardExpiry").payment("formatCardExpiry"),$(".cardCode").payment("formatCardCVC"),$(".cardNumber").change(function(){$(".ccType").val($.payment.cardType(this.value))}),$(".payment_methods_radios").click(function(){$(".payment-methods").hide(),$(".payment-methods :input").prop("disabled",!0),this.checked&&($("#payment_method_"+this.value+" :input").prop("disabled",!1),$("#payment_method_"+this.value).show())}),$(".payment_methods_radios").each(function(){this.checked?($("#payment_method_"+this.value+" :input").prop("disabled",!1),$("#payment_method_"+this.value).show()):($("#payment_method_"+this.value).hide(),$("#payment_method_"+this.value+" :input").prop("disabled",!0)),$("#card_new"+this.value).is("*")&&$("#card_new"+this.value).radioControlsVisibilityOfElement("#card_form"+this.value)}),$(".cvvLink").click(function(t){window_name="cvv_info",window_options="left=20,top=20,width=500,height=500,toolbar=0,resizable=0,scrollbars=1",window.open($(this).prop("href"),window_name,window_options),t.preventDefault()}),$("select.jump_menu").change(function(){window.location=this.options[this.selectedIndex].value}))});