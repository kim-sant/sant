(function(){Spree.ready(function(e){return Spree.onAddress=function(){var t,r,n;return e("#checkout_form_address").is("*")?(e("#checkout_form_address").validate(),t=function(t){return e("#"+t+"country select").val()},Spree.updateState=function(r){var n;return n=t(r),null!=n?null==Spree.Checkout[n]?e.get(Spree.routes.states_search,{country_id:n},function(e){return Spree.Checkout[n]={states:e.states,states_required:e.states_required},Spree.fillStates(Spree.Checkout[n],r)}):Spree.fillStates(Spree.Checkout[n],r):void 0},Spree.fillStates=function(t,r){var n,s,i,a,d,u,p,o;return p=t.states_required,u=t.states,i=e("#"+r+"state"),a=i.find("select"),s=i.find("input"),d=i.find('[id$="state-required"]'),u.length>0?(n=parseInt(a.val()),a.html(""),o=[{name:"",id:""}].concat(u),e.each(o,function(t,r){var s;return s=e(document.createElement("option")).attr("value",r.id).html(r.name),n===r.id&&s.prop("selected",!0),a.append(s)}),a.prop("disabled",!1).show(),s.hide().prop("disabled",!0),i.show(),d.show(),p&&a.addClass("required"),a.removeClass("hidden"),s.removeClass("required")):(a.hide().prop("disabled",!0),s.show(),p?(d.show(),s.addClass("required")):(s.val(""),d.hide(),s.removeClass("required")),i.toggle(!!p),s.prop("disabled",!p),s.removeClass("hidden"),a.removeClass("required"))},e("#bcountry select").change(function(){return Spree.updateState("b")}),e("#scountry select").change(function(){return Spree.updateState("s")}),Spree.updateState("b"),r=e("input#order_use_billing"),r.change(function(){return n(r)}),(n=function(t){return t.is(":checked")?(e("#shipping .inner").hide(),e("#shipping .inner input, #shipping .inner select").prop("disabled",!0)):(e("#shipping .inner").show(),e("#shipping .inner input, #shipping .inner select").prop("disabled",!1),Spree.updateState("s"))})(r)):void 0},Spree.onAddress()})}).call(this);