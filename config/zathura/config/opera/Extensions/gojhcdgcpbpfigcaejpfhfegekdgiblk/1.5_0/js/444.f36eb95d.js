(self["webpackChunkdesktop_wallet"]=self["webpackChunkdesktop_wallet"]||[]).push([[444],{48796:function(e,t,s){"use strict";s.d(t,{Z:function(){return c}});var i=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("label",{staticClass:"wrapper"},[s("input",{attrs:{type:"checkbox"},domProps:{checked:e.isChecked,value:e.value},on:{change:e.updateInput}}),s("span",{staticClass:"checkmark"})])},a=[],n=(s(57658),{name:"OperaCheckbox",model:{event:"change",prop:"modelValue"},props:{modelValue:{default:!1,type:[Array,Boolean]},value:{default:void 0,type:[Object,String]}},computed:{isChecked(){return this.modelValue instanceof Array?this.modelValue.includes(this.value):this.modelValue===this.value}},methods:{updateInput(e){const t=e.target.checked;if(this.modelValue instanceof Array){const e=[...this.modelValue];t?e.push(this.value):e.splice(e.indexOf(this.value),1),this.$emit("change",e)}else this.$emit("change",t)}}}),r=n,o=s(1001),l=(0,o.Z)(r,i,a,!1,null,"8d8c1508",null),c=l.exports},37643:function(e,t,s){"use strict";s.d(t,{Z:function(){return d}});var i=function(){var e=this,t=e.$createElement,s=e._self._c||t;return e.disabled?e._e():s("div",{staticClass:"bg-dark-N16 border border-black border-opacity-10 cursor-pointer flex items-center justify-between mb-2 px-6 py-3 rounded-lg t-token_item-click",on:{click:e.click}},[s("token-icon",{staticClass:"h-9 w-9",attrs:{address:e.address,chain:e.chain,"icon-uri":e.value.logoURI}}),s("div",{staticClass:"flex-1 mx-4"},[s("div",{staticClass:"font-bold tracking-wider"},[e._v(e._s(e.name))]),s("div",{staticClass:"flex items-center text-dark-N77 text-xs"},[s("span",{staticClass:"mr-2"},[e._v(e._s(e.symbol))]),s("chain-badge",{attrs:{"background-color":"bg-input-bg",chain:e.chain}}),e.type&&e.type!==e.symbol?s("div",{staticClass:"bg-input-bg inline-block ml-1 px-2 py-0 rounded-full"},[e._v(" "+e._s(e.type)+" ")]):e._e()],1)]),e.selectable?s("opera-checkbox",{ref:"checkbox",staticClass:"pointer-events-none",attrs:{"model-value":e.modelValue,value:e.value},on:{change:e.onChange}}):e._e()],1)},a=[],n=s(88080),r=s(48796),o=s(56258),l=s(67990),c={name:"TokenItem",components:{ChainBadge:n.Z,OperaCheckbox:r.Z,TokenIcon:l.Z},model:{event:"change",prop:"modelValue"},props:{address:{default:"",type:String},chain:{default:void 0,type:Object},disabled:{default:!1,type:Boolean},modelValue:{default:void 0,type:[String,Object,Array]},name:{default:"",type:String},selectable:{default:!0,type:Boolean},symbol:{default:"",type:String},value:{default:void 0,type:[String,Object,Array]}},computed:{type(){const e=this.value.type??this.value.contract?.type;if(e)return!1}},methods:{click(){this.selectable?this.$refs.checkbox.$el.click():this.$emit("change",this.value)},getStatsEventName(){if("WatchListSelect"===this.$route.name){const e=this.$refs.checkbox.isChecked?"selected":"unselected";return`wt_watch_coin_${e}`}return"ReceiveToken"===this.$route.name?"wt_receive_select":"wt_coin_selected"},onChange(e){const[t,s]=[this.$store.getters.getNetworkName(this.chain),this.symbol],i=this.getStatsEventName();o.Z.sendStatsEvent(o.Z.types.CLICK,i,{network:t,symbol:s}),this.$emit("change",e)}}},p=c,u=s(1001),h=(0,u.Z)(p,i,a,!1,null,null,null),d=h.exports},88080:function(e,t,s){"use strict";s.d(t,{Z:function(){return p}});var i=function(){var e=this,t=e.$createElement,s=e._self._c||t;return e.chainNameFriendly?s("div",{staticClass:"flex mr-2 px-2 py-0.5 rounded-full space-x-1 t-chain-badge text-dark-N77",class:[e.backgroundColor]},[e.chainLogo?s("img",{staticClass:"object-contain w-3.5",attrs:{alt:"",src:e.chainLogo}}):e._e(),s("span",{staticClass:"t-chain-badge-name"},[e._v(e._s(e.chainNameFriendly))])]):e._e()},a=[],n=s(6445),r={name:"ChainBadge",props:{backgroundColor:{default:"bg-dark-N16",type:String},chain:{default:void 0,type:Object}},computed:{chainLogo(){if(this.chain)return(0,n.Z)(this.chain).icon()},chainNameFriendly(){if(this.chain)return this.$store.getters.chainNameFriendly(this.chain)}}},o=r,l=s(1001),c=(0,l.Z)(o,i,a,!1,null,null,null),p=c.exports},79340:function(e,t,s){"use strict";s.d(t,{Z:function(){return h}});var i=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"flex flex-row overflow-x-auto rtl-space-x-reverse space-x-4"},e._l(e.percentageValues,(function(t){var i=t.label,a=t.divisor;return s("button",{key:i,staticClass:"border font-bold px-2 py-1 rounded-md text-brand-primary text-sm w-14",class:[{"border-brand-primary bg-brand-primary bg-opacity-5":i===e.selected,"border-black border-opacity-20 bg-gray":i!==e.selected},"t-perc-btn t-perc-btn-"+i],on:{click:function(t){return e.select({label:i,divisor:a})}}},[s("span",1===a?[e._v(e._s(e.$t("general.max")))]:[e._v(e._s(e.localizePercentage(i)))])])})),0)},a=[],n=s(70794),r=s(4634),o=s(98180),l={name:"PercentageButtons",props:{token:{default:void 0,type:Object},value:{default:void 0,type:[n.Z,Number,String]}},data(){return{calculatedAmount:null,percentageValues:[{divisor:4,label:"25"},{divisor:2,label:"50"},{divisor:1,label:"100"}],selected:null}},watch:{value(){this.value!==this.calculatedAmount&&(this.selected=null)}},methods:{calculateAmount(e){const t=Object.assign({},this.token,{balance:new n.Z(this.token.balance).dividedBy(e)});this.calculatedAmount=o.Z.tokenDecimal(t)||(0,n.Z)(0),this.$emit("change",this.calculatedAmount)},localizePercentage:r.ZP.localizePercentage,select({label:e,divisor:t}){this.selected=e,this.calculateAmount(t)}}},c=l,p=s(1001),u=(0,p.Z)(c,i,a,!1,null,null,null),h=u.exports},26444:function(e,t,s){"use strict";s.r(t),s.d(t,{default:function(){return ie}});var i=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"pb-8"},[i("div",{staticClass:"flex flex-col flex-grow h-full"},[i("top-bar",{attrs:{"test-parent-name":"swap_view",title:e.$t("general.swap")}},[e.showRefresh?i("div",{staticClass:"bg-dark-N16 mr-4 px-5 py-3 rounded-3xl text-dark-N77"},[e._v(" "+e._s(e.$t("views.swapView.refreshingRates",{refreshTime:e.refreshTime}))+" ")]):e._e()]),i("div",{key:e.timesSwappableTokensUpdated,staticClass:"flex flex-col flex-grow justify-start mt-4 mx-4"},[i("swap-input",{staticClass:"mb-4 t-swap-from_balance",class:[{"pointer-events-none":e.isLoading}],attrs:{balance:e.fromBalance,type:"from"},on:{changeSwapInfo:e.changeSwapInfo},model:{value:e.from,callback:function(t){e.from=t},expression:"from"}}),i("div",{staticClass:"flex flex-col items-center"},[i("horizontal-divider",{staticClass:"my-3"},[i("button",{staticClass:"bg-brand-primary bg-opacity-10 flex-shrink-0 h-10 rounded-full t-swap-switch w-10",class:{"cursor-not-allowed":e.disableTokenSwitch},attrs:{disabled:e.disableTokenSwitch,title:e.disableTokenSwitch?e.$t("general.youDontOwnAny",{asset:e.toSymbol}):""},on:{click:e.switchTokens,mouseleave:function(t){e.exchangeHover=!1},mouseover:function(t){e.exchangeHover=!0}}},[i("i",{staticClass:"align-bottom icon text-brand-primary",class:{"icon-exchange":e.exchangeHover,"icon-swap_arrow":!e.exchangeHover}})])])],1),i("swap-input",{staticClass:"t-swap-to_balance",class:[{"pointer-events-none":e.isLoading}],attrs:{balance:e.toBalance,"read-only":"",type:"to"},model:{value:e.to,callback:function(t){e.to=t},expression:"to"}}),e.error?e._e():i("swap-info",{class:[{"pointer-events-none":e.isLoading}],attrs:{conversion:e.conversion,price:e.price,"show-info":e.from.value&&e.to.value&&e.showInfo,"to-token-amount":e.toTokenAmount},on:{changeSlippage:e.changeSlippage}})],1),e.error?i("div",{staticClass:"flex justify-center m-8 text-center text-sm text-spectrum-red"},[i("img",{staticClass:"mx-2",attrs:{alt:"",src:s(98498)}}),i("span",[e._v(e._s(e.error))])]):e._e(),i("p",{staticClass:"text-2xs text-center text-dark-N77"},[e._v(" "+e._s(e.$t("views.swapView.providedByOpera"))+" ")]),i("primary-button",{staticClass:"mt-4 mx-4 relative t-swap-swap",attrs:{"allow-click-while-loading":!!e.currentPendingApprovalHash,disabled:!(!e.isSwapUnavailable||!e.isApproveUnavailable||e.currentPendingApprovalHash),loading:e.isLoading||!!e.currentPendingApprovalHash,title:e.isLoading?e.$t("views.swapView.fetchingQuotes"):e.$t("general.next")},on:{click:function(t){e.currentPendingApprovalHash||e.isApproveRequired?e.getApprove():e.getSwap()}}},[i("lottie-component",{staticClass:"absolute",attrs:{src:"loader_button.json"}})],1)],1)])},a=[],n=(s(57658),s(39765));const r=(e,t)=>{let s;return function(...i){return void 0!==s&&t||e.apply(this,i),clearTimeout(s),s=setTimeout((()=>e.apply(this,i)),t),s}};var o,l=s(35210),c=s(70794),p=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"border-opacity-10 line-divider w-full"},[e._t("default")],2)},u=[],h={name:"HorizontalDivider"},d=h,m=s(1001),g=(0,m.Z)(d,p,u,!1,null,"0c0ab06d",null),f=g.exports,v=s(39944),k=s(90108),w=s(56258),b=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"mt-8 w-full"},[e.showInfo?s("div",[s("div",{staticClass:"bg-dark-N16-op50 flex items-center justify-center px-6 py-4 rounded-4xl"},[s("div",{staticClass:"max-w-full text-sm"},[s("p",{staticClass:"max-w-fit truncate"},[s("span",[e._v(e._s(e.conversion)+" ")]),s("span",{staticClass:"text-dark-N77"},[e._v(e._s(e.price))])])])]),s("div",{staticClass:"bg-dark-N16-op50 mb-3 mt-8 px-6 py-4 rounded-xl"},[s("div",{staticClass:"flex items-center justify-between"},[s("div",[s("div",{staticClass:"text-[13px] text-dark-N77"},[e._v(" "+e._s(e.$t("components.swapInfo.slippageTolerance"))+" ")]),e.showSlippageSettings?s("p",{staticClass:"text-dark-N77-op50 text-xs"},[e._v(" "+e._s(e.$t("components.swapInfo.selectSuggested"))+" ")]):s("div",{staticClass:"mt-1"},[e._v(" "+e._s(e.localizePercentage(e.slippage.toString()))+" ")])]),s("div",{staticClass:"flex items-center"},[s("i",{staticClass:"cursor-pointer icon-trans",class:[{"text-dark-N77":!e.showSlippageSettings,"text-accent":e.showSlippageSettings}],on:{click:function(t){e.showSlippageSettings=!e.showSlippageSettings}}})])]),e.showSlippageSettings?s("div",[s("slippage-buttons",{staticClass:"mt-5"}),e.errorStage&&!e.isSafeSlippage?s("div",{staticClass:"mt-5 pb-5 pt-4 px-6 rounded-lg",class:[{"text-red bg-red-10":[e.SlippageErrorStages.Insufficient,e.SlippageErrorStages.Excessive].includes(e.errorStage),"text-orange bg-orange-10":[e.SlippageErrorStages.TxMayFail,e.SlippageErrorStages.BadRate].includes(e.errorStage),"text-yellow bg-yellow-10":[e.SlippageErrorStages.ModerateRate].includes(e.errorStage)}]},[e._v(" "+e._s(e.errorList.get(e.errorStage))+" ")]):e._e()],1):e._e()]),e.isValidSlippage?s("div",{staticClass:"bg-dark-N16-op50 flex items-center justify-between mb-3 mt-1 px-6 py-4 rounded-xl"},[s("div",[s("div",{staticClass:"text-dark-N77 text-xs"},[e._v(" "+e._s(e.$t("components.swapInfo.minimumReceive",{slippage:e.localizePercentage(e.slippage.toString())}))+" ")]),s("div",{staticClass:"mt-1"},[e._v(" "+e._s(e.formatNumber(e.minAmountReceived))+" "+e._s(e.currentSwap.toToken.symbol)+" ")])])]):e._e()]):s("div",{staticClass:"border-2 border-dark-N16 flex h-60 items-center justify-center rounded-3xl"},[s("span",{staticClass:"opacity-50 text-base text-dark-N77"},[e._v(e._s(e.$t("components.swapInfo.enterSwapAmount")))])])])},y=[];s(52262),s(24506);(function(e){e[e["Insufficient"]=1]="Insufficient",e[e["TxMayFail"]=2]="TxMayFail",e[e["ModerateRate"]=3]="ModerateRate",e[e["BadRate"]=4]="BadRate",e[e["Excessive"]=5]="Excessive"})(o||(o={}));var x=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"flex flex-row justify-between overflow-x-auto rtl-space-x-reverse space-x-2 t-slippage_buttons"},[e._l(e.slippageOptions,(function(t){return s("button",{key:t,staticClass:"border flex-1 font-bold leading-6 py-1 rounded-md text-brand-primary text-sm w-11",class:[{"border-brand-primary bg-brand-primary bg-opacity-5":t===e.slippage&&!e.showInput,"border-black border-opacity-20 bg-gray":t!==e.slippage||e.showInput}],on:{click:function(s){return e.select(t)}}},[s("span",[e._v(e._s(e.localizePercentage(t.toString())))])])})),s("div",{staticClass:"flex-1 h-8.5 w-28"},[e.showInput?s("div",{staticClass:"border flex font-bold h-8.5 items-center justify-between px-2 py-1 rounded-md text-brand-primary text-sm w-28"},[s("input",{ref:"customSlippageInput",staticClass:"bg-transparent flex-1 t-slippage_buttons-custom_slippage_input text-right w-12",attrs:{type:"string"},domProps:{value:e.slippage},on:{input:e.changeSlippage}}),s("span",{staticClass:"opacity-50 text-dark-N77"},[e._v("%")]),s("div",{staticClass:"flex-1"})]):s("button",{staticClass:"bg-gray border border-black border-opacity-20 font-bold leading-6 px-2 py-1 rounded-md text-brand-primary text-sm w-28",on:{click:e.handleShowInput}},[e._v(" "+e._s(e.$t("general.custom"))+" ")])])],2)},S=[],T=s(20144),_=s(4634),$=T.Z.extend({name:"SlippageButtons",data(){return{showInput:!1,slippageOptions:this.$store.state.swap.slippageOptions,slippageUpdateTimer:null}},computed:{isValidSlippage(){return this.getIsValidSlippage(this.slippage)},slippage(){return this.$store.getters.slippage},slippageDecimal(){return this.$store.getters.slippageData.slippageDecimal}},methods:{changeSlippage(e){clearTimeout(this.slippageUpdateTimer);const t=this.sanitizeValue(e);t!==this.slippage&&(this.slippageUpdateTimer=window.setTimeout((()=>{this.$store.dispatch("setSlippage",t)}),this.getIsValidSlippage(t)?1e3:0))},getIsValidSlippage(e){return this.$store.getters.isValidSlippage(e)},handleShowInput(){this.showInput=!0,this.$nextTick((()=>{this.$refs.customSlippageInput?.focus()}))},isValidSlippagePattern(e){const t=new RegExp(`^(0|[1-9]\\d{0,1})([\\.\\,]\\d{1,${this.slippageDecimal}})?$`),s=[".",","].some((t=>e.endsWith(t)));return t.test((s?+e:e).toString())},localizePercentage:_.ZP.localizePercentage,sanitizeValue({target:e}){let{value:t}=e;t=t?.replace(",",".");const s=new Map([["isTruthy",!!t&&!isNaN(+t)],["isValidSlippage",this.isValidSlippagePattern(t)],["isValidSlippagePercentage",+t>=0||+t<100]]);return[...s.values()].some((e=>!e))&&(t="0",e.value=null),+t},select(e){this.showInput=!1,this.$store.dispatch("setSlippage",e)}}}),C=$,A=(0,m.Z)(C,x,S,!1,null,null,null),I=A.exports,Z=T.Z.extend({name:"SwapInfo",components:{SlippageButtons:I},props:{conversion:{default:"",type:String},price:{default:"",type:String},showInfo:{default:!1,type:Boolean},toTokenAmount:{default:new c.Z(0),type:c.Z}},data(){return{SlippageErrorStages:o,errorStage:void 0,showSlippageSettings:!1,slippageOptions:this.$store.state.swap.slippageOptions}},computed:{currentSwap(){return this.$store.getters.currentSwap},errorIndex(){const{max:e,min:t,slippageOptions:s}=this,{Insufficient:i,TxMayFail:a,ModerateRate:n,BadRate:r,Excessive:l}=o;return new Map([[t,i],[s.at(0),a],[s.at(-1),n],[e+t,r],[100,l]])},errorList(){const{max:e,min:t,slippage:s}=this,{Insufficient:i,TxMayFail:a,ModerateRate:n,BadRate:r,Excessive:l}=o;return new Map([[i,this.$i18n.t("components.swapInfo.minimumSlippageRate",{slippage:this.localizePercentage(t.toString())})],[a,this.$i18n.t("components.swapInfo.yourTransactionMayFail")],[n,this.$i18n.t("components.swapInfo.youMayReceive",{slippage:this.localizePercentage(s.toString())})],[r,this.$i18n.t("components.swapInfo.youMayReceiveAnd",{slippage:this.localizePercentage(s.toString())})],[l,this.$i18n.t("components.swapInfo.maximumSlippageRate",{slippage:this.localizePercentage(e.toString())})]])},isSafeSlippage(){return this.slippage>=this.slippageOptions.at(0)&&this.slippage<=1},isValidSlippage(){return this.$store.getters.isValidSlippage()},max(){return this.slippageData.slippageMax},min(){return this.slippageData.slippageMin},minAmountReceived(){return this.toTokenAmount.times(1-this.slippage/100)},slippage(){return this.$store.getters.slippage},slippageData(){return this.$store.getters.slippageData}},watch:{slippage(e){this.errorStage=[...this.errorIndex.entries()].find((([t])=>e<t))?.at(1)}},methods:{formatNumber:_.ZP.formatNumber,localizePercentage:_.ZP.localizePercentage}}),P=Z,N=(0,m.Z)(P,b,y,!1,null,"106d39ee",null),E=N.exports,O=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"w-full"},[s("div",{staticClass:"flex flex-col items-center"},[s("div",{staticClass:"flex items-end justify-between mb-3 w-full"},[s("div",{staticClass:"bg-dark-N16 cursor-pointer flex items-center justify-center pl-3 pr-4 py-1 rounded-full t-swap_input-show_dialog",on:{click:e.showDialog}},[s("token-icon",{staticClass:"h-7 mr-2 w-7",attrs:{address:e.address,chain:e.chain}}),s("div",{staticClass:"mr-4"},[s("div",{staticClass:"font-bold text-base"},[e._v(e._s(e.name))]),s("div",{staticClass:"font-semibold opacity-50 text-dark-N77 text-sm"},[e._v(" "+e._s(e.chainNameFriendly)+" ")])]),s("i",{staticClass:"icon-chevron_down"})],1),s("div",{staticClass:"grow mb-1 ml-2 mr-5 text-right text-sm"},[s("span",{staticClass:"text-dark-N77-op50"},[e._v(e._s(e.$t("general.balance"))+": ")]),s("span",{staticClass:"text-dark-N77 whitespace-pre-wrap",class:[{"text-accent":!e.readOnly}]},[e._v(e._s(e.fullBalance))])])]),s("div",{staticClass:"flex flex-col justify-center text-center w-full"},[s("input",{staticClass:"bg-neutral-01 focus:text-brand-primary input placeholder:text-white px-5 py-3.5 text-right w-full",class:[{"input-error pr-10":e.error,"cursor-not-allowed placeholder:text-neutral-06":e.readOnly}],attrs:{disabled:e.readOnly,placeholder:e.inputPlaceholder,title:""},domProps:{value:e.value.value},on:{input:function(t){return e.handleValueInput(t)},paste:function(t){return e.handleValueChanged(t)}}})]),e.error?s("div",{staticClass:"mt-2 text-center text-sm text-spectrum-red"},[e._v(" "+e._s(e.error)+" ")]):e._e(),e.readOnly?e._e():s("percentage-buttons",{staticClass:"mt-5",attrs:{token:Object.assign({},e.token,{balance:e.balanceWithoutDecimals}),value:e.value.value},on:{change:e.assignNewAmount}})],1),s("swap-token-dialog",{ref:"dialog",attrs:{type:e.type}})],1)},V=[],R=s(79340),q=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{directives:[{name:"show",rawName:"v-show",value:e.showing,expression:"showing"}],staticClass:"bg-background bottom-0 fixed left-0 right-0 top-0 z-10"},[s("div",{staticClass:"flex flex-col h-full"},[s("top-bar",{attrs:{"emit-back":"","test-parent-name":"swap_token_dialog",title:e.$t("general.selectAssets")},on:{back:e.close}}),s("div",{staticClass:"px-4"},[s("opera-input",{staticClass:"t-swap_token_dialog-query",attrs:{placeholder:e.$t("general.search"),"prepend-icon":"icon-search text-brand-primary text-opacity-40",round:"",type:"search"},model:{value:e.query,callback:function(t){e.query=t},expression:"query"}})],1),s("div",{staticClass:"h-full overflow-y-scroll pb-4 px-4",on:{scroll:e.onScroll}},[e.loading&&e.query?s("div",{staticClass:"flex flex-1 items-center justify-center w-full"},[s("i",{staticClass:"animate-spin icon-spinner text-xl"})]):e._l(e.filteredTokens,(function(t,i){return s("token-item",{key:i,attrs:{address:t.address,chain:t.chain,disabled:e.isTokenDisabled(t),name:t.name,selectable:!1,symbol:t.symbol,value:t},on:{change:e.itemClicked}})}))],2)],1)])},j=[],B=s(49314),D=s(37643),L=s(38423),z=s(98180);const F=20;var M={name:"SwapTokenDialog",components:{OperaInput:B.Z,TokenItem:D.Z,TopBar:L.Z},props:{type:{default:"",type:String}},data(){return{callback:null,filteredAssets:[],loading:!1,n:F,query:"",showing:!1}},computed:{currentSwap(){return this.$store.getters.currentSwap},filteredTokens(){return this.query?this.filteredAssets.slice(0,this.n):this.tokens.slice(0,this.n)},ownedTokens(){return this.$store.getters.ownedTokens},tokens(){const{swappableTokens:e,swappableTokensFlat:t}=this.$store.getters;if("to"===this.type){const t=this.currentSwap.fromToken?.chain??{};return e[t?.name]??[]}return t.filter((e=>!!e.balance))}},watch:{query:{handler(e){this.loading=!0,this.filteredAssets=[],e?this.$nextTick((()=>{this.throttle(this.filterList,1e3)(),this.n=F})):this.$nextTick((()=>{this.n=F}))},immediate:!0}},methods:{close(){this.showing=!1},filterList(){const e=this.query.toLowerCase();this.filteredAssets=this.tokens.filter((t=>t.name.toLowerCase().includes(e)||t.symbol.toLowerCase().includes(e))),this.loading=!1},isTokenDisabled(e){if(!Object.keys(this.currentSwap).length)return;const t="from"===this.type?"to":"from",s=z.Z.isSameToken(this.currentSwap[`${t}Token`],e);return s||"from"===this.type&&!e.balance},async itemClicked(e){this.loading=!0,this.callback(e),this.showing=!1,this.loading=!1},onScroll(e){const{target:t}=e,s=t.scrollTop+t.clientHeight>=t.scrollHeight-t.clientHeight;s&&(this.n+F<this.tokens.length?this.n+=F:this.n=this.tokens.length-1)},show(e){this.callback=e,this.showing=!0},throttle(e,t){let s,i;return function(...a){const n=Date.now(),r=this;if(i||(i=n),clearTimeout(s),n-i>t)return i=n,e.apply(r,a),void clearTimeout(s);s=setTimeout((()=>{i=Date.now(),s=null,e.apply(r,a)}),t)}}}},H=M,U=(0,m.Z)(H,q,j,!1,null,null,null),Q=U.exports,W=s(67990),K={name:"SwapInput",components:{PercentageButtons:R.Z,SwapTokenDialog:Q,TokenIcon:W.Z},props:{balance:{default:"",type:c.Z},readOnly:{type:Boolean},type:{default:"",type:String},value:{default:void 0,type:Object}},data(){return{focused:!1,inputPlaceholder:"0.0",token:{}}},computed:{address(){return this.token.address},balanceWithoutDecimals(){const e=this.balance??0;return z.Z.withoutDecimals(e,this.token.decimals)},chain(){return this.token.chain},chainNameFriendly(){if(this.chain)return this.$store.getters.chainNameFriendly(this.chain)},error(){const e="from"===this.type&&this.$store.getters.txError.insufficientFunds;return this.$emit("changeSwapInfo",e),e&&this.$t("errors.generic.insufficientFunds")},fullBalance(){return this.$store.getters.getFullTokenBalance(this.address,this.token,this.chain)},maxValue(){return this.readOnly?Number.MAX_SAFE_INTEGER:this.balance},name(){return this.token.name},symbol(){return this.token.symbol}},watch:{value(e){this.token=e.token}},created(){this.token=this.value.token},methods:{assignNewAmount(e){this.$emit("input",{token:this.token,value:e})},formatNumber:_.ZP.formatNumber,handleValueChanged(e){const t=this.sanitizeValue(e);this.$emit("input",{token:this.token,value:t})},handleValueInput(e){this.$nextTick((()=>{this.handleValueChanged(e)}))},sanitizeValue(e){let{value:t}=e.target;return e.target.value=z.Z.sanitizeTokenAmountInput(t),t=z.Z.sanitizeTokenAmountInput(t),t},showDialog(){this.$refs.dialog.show((e=>{this.token=e,this.$emit("input",{token:this.token,value:null})}))}}},G=K,J=(0,m.Z)(G,O,V,!1,null,"0ba0ca64",null),X=J.exports,Y=s(25108),ee={name:"SwapView",components:{HorizontalDivider:f,LottieComponent:v.Z,PrimaryButton:k.Z,SwapInfo:E,SwapInput:X,TopBar:L.Z},data(){const e=30;return{approve:null,chain:null,defaultRefreshTime:e,error:null,exchangeHover:!1,from:{token:null,value:null},interval:null,isApprovalsPending:!1,loading:{approve:!1,quote:!1,swap:!1},quote:null,refreshTime:e,refreshTimer:null,showInfo:!1,showRefresh:!1,timesSwappableTokensUpdated:0,to:{token:null,value:null}}},computed:{accountAddress(){return this.$store.getters.ethereumAddress},amountWithoutDecimals(){if(!this.from.token||!this.from.value)return null;const e=_.ZP.removeExponential(z.Z.withoutDecimals(this.from.value,this.from.token.decimals));return e},conversion(){const e=this.quote;if(!e)return null;const t=z.Z.withDecimals(e.fromTokenAmount,e.fromToken.decimals),s=e.fromToken.symbol,i=z.Z.withDecimals(e.toTokenAmount,e.toToken.decimals).dividedBy(t),a=e.toToken.symbol;return`1 ${s} ≈ ${_.ZP.formatNumber(i)} ${a}`},currentPendingApprovalHash(){return this.$store.getters.currentPendingApprovalHash},currentSwap(){return this.$store.getters.currentSwap},disableTokenSwitch(){if(this.isLoading)return!0;const e=!!this.ownedTokens.find((e=>{let t=e.contract.contract;return t===n.L1&&(t=n.NA),t===this.to.token?.address}));return!e&&(!e||!this.from.value)},fromBalance(){return this.tokenBeingSwapped?z.Z.tokenDecimal(this.tokenBeingSwapped):null},fromSymbol(){return this.from&&this.from.token?this.from.token.symbol:""},generalTxError(){return!!this.error||Object.values(this.$store.getters.txError).some((e=>e))},invalidBalance(){return!this.from.token||(new c.Z(this.fromBalance).isLessThan(new c.Z(this.from.value))||new c.Z(this.fromBalance).isLessThanOrEqualTo(new c.Z(0))||new c.Z(this.from.value).isLessThanOrEqualTo(new c.Z(0)))},isApproveRequired(){return!!this.approve},isApproveUnavailable(){return this.isInInvalidState||this.isApprovalsPending||!this.isApproveRequired},isInInvalidState(){return this.generalTxError||!!this.error||this.isLoading||this.invalidBalance||!this.quote||!this.$store.getters.isOnMainnet||!this.isValidSlippage},isLoading(){return Object.values(this.loading).some((e=>e))},isSwapUnavailable(){return this.isInInvalidState||this.isApprovalsPending||this.isApproveRequired},isValidSlippage(){return this.$store.getters.isValidSlippage()},ownedTokens(){return this.$store.getters.ownedTokens},pendingApprovals(){return this.$store.getters.pendingApprovals},price(){const e=this.quote;if(!e)return null;const{getPriceForToken:t}=this.$store.getters,s=_.ZP.formatNumber(t(e.fromToken)),i=_.ZP.formatNumber(t(e.toToken)),a=[s,i].find((e=>e.gt(0)))??new c.Z(0),n=a.gt(0)?`(${this.localizeCurrency(a)})`:"";return n},slippage(){return this.$store.getters.slippage},swappableTokens(){return this.$store.getters.swappableTokens},swapper(){return this.$store.getters.swapper},toBalance(){const e=this.determineTokenAddress(this.to.token),{chain:t}=this.to.token,s=this.$store.getters.getToken(e,t);return s?z.Z.tokenDecimal(s):null},toSymbol(){return this.to&&this.to.token?this.to.token.symbol:""},toTokenAmount(){const e=this.quote;return e?z.Z.withDecimals(this.quote.toTokenAmount,this.quote.toToken.decimals):null},tokenBeingSwapped(){if(!this.from.token)return null;const e=this.determineTokenAddress(this.from.token),{chain:t}=this.from.token;return this.$store.getters.getToken(e,t)}},watch:{chain:{deep:!0,handler(){this.$store.dispatch("setSlippageData",this.chain)}},from:{deep:!0,handler(){this.to.token&&(this.chain=this.from.token.chain,this.$store.dispatch("clearTxError"),this.$store.dispatch("createSwapper",this.chain),new c.Z(this.from.value).isGreaterThan(this.fromBalance)&&this.$store.dispatch("setTxError","insufficientFunds"),this.error=null,this.approve=null,this.updateQuote(),this.updateQueryParams(),(0,l.F2)(this.to.token?.chain,this.chain)||this.setInitialToken("to"),this.$store.commit("SET_CURRENT_SWAP",{fromToken:this.from.token,toToken:this.to.token}))}},pendingApprovals:{deep:!0,handler(e){const t=Object.keys(e).length>0;this.isApprovalsPending=t}},quote(e){this.$set(this.to,"value",e?z.Z.withDecimals(e.toTokenAmount,e.toToken.decimals):null)},slippage:{handler(){this.error=null,this.updateQuote(),this.updateQueryParams(),this.$store.commit("SET_CURRENT_SWAP",{fromToken:this.from.token,toToken:this.to.token})}},swappableTokens:{deep:!0,handler(){this.timesSwappableTokensUpdated+=1}},"to.token":{deep:!0,handler(){this.error=null,this.updateQuote(),this.updateQueryParams(),this.$store.commit("SET_CURRENT_SWAP",{fromToken:this.from.token,toToken:this.to.token})}}},beforeDestroy(){this.$store.dispatch("clearTxError"),clearInterval(this.interval)},created(){w.Z.sendStatsEvent(w.Z.types.IMPRESSION,"wt_swap_entered"),this.chain=JSON.parse(this.$route.query.chain);const e=this.$route.query.from,t=this.$route.query.to,s=this.$route.query.value||null;this.setInitialToken("from",e,s),this.setInitialToken("to",t),this.currentPendingApprovalHash&&this.updateQuote()},mounted(){this.$store.getters.getTimesLoaded("swappableTokens")||this.$store.dispatch("getSwappableTokens")},methods:{changeSlippage(e){this.slippage=e},changeSwapInfo(e){this.showInfo=!e},async checkApprove(e){if(this.quote&&!this.error){this.loading.approve=!0;try{e?this.swapper.checkApprove({from:this.from,to:this.to},e).then((e=>{this.approve=e})):await this.swapper.swap({from:this.from,slippage:this.slippage,to:this.to}).then((()=>{setTimeout((()=>{Object.keys(this.pendingApprovals).length&&this.$store.dispatch("clearPendingApproval",{chain:this.chain,symbol:this.from.token.symbol})}),5e3),clearInterval(this.interval),this.approve=null})).catch((async e=>await this.swapper.checkApprove({from:this.from,to:this.to},e).then((e=>{this.approve=e}))))}catch(e){Y.error(e),this.error=this.generateSwapErrorText(e),clearInterval(this.interval)}finally{this.loading.approve=!1}}},determineTokenAddress(e){if(e)return e.address===n.NA?n.L1:e.address},generateSwapErrorText(e){const t=(e.response?.data?.description??"").toLowerCase();return this.fromSymbol===this.toSymbol?this.$t("errors.swappingTheSameToken"):t.includes("insufficient funds")||t.includes("not enough")?this.$t("errors.generic.insufficientFunds"):t.includes("insufficient liquidity")?this.$t("errors.insufficientLiquidity"):t.includes("cannot estimate")?this.$t("errors.insufficientFunds"):this.$t("errors.generic.unknownError")},getApprove(){if(this.currentPendingApprovalHash){const e=this.$store.getters.transactionDetailsUrl(this.currentPendingApprovalHash,this.chain);this.$platform.openNewTab(e)}else this.isApproveUnavailable||this.$router.push({name:"ApproveConfirm",params:{approve:this.approve,contract:this.swapper.contract,token:this.from}})},async getQuote(){this.loading.quote=!0;try{const e=await this.swapper.getQuote({from:this.from,to:this.to});this.quote=this.repopulateQuote(e),this.$store.commit("SET_CURRENT_SWAP",this.quote),this.error=null,await this.checkApprove()}catch(e){Y.error(e),this.quote=null,this.error=this.generateSwapErrorText(e)}this.loading.quote=!1},async getSwap(){if(!this.isSwapUnavailable){this.loading.swap=!0;try{const e=await this.swapper.swap({from:this.from,slippage:this.slippage,to:this.to});this.next(this.repopulateQuote(e))}catch(e){Y.error(e),this.checkApprove(e),this.error=this.generateSwapErrorText(e)}finally{this.loading.swap=!1}}},localizeCurrency:_.ZP.localizeCurrency,async next(e){w.Z.sendStatsEvent(w.Z.types.CLICK,"wt_swap_next_suc",{network:this.$store.getters.getNetworkName(this.chain)}),this.$store.commit("SET_CURRENT_SWAP",e);const{chain:t}=this,s=this.slippage;e.tx.chain=t,this.$router.push({name:"SwapConfirm",params:{chain:t,slippageMax:s,swap:e}})},repopulateQuote(e){return Object.assign({},e,{fromToken:this.from.token,toToken:this.to.token})},setInitialToken(e,t="",s=null){let i=this.$store.getters.getTokenViaSerializedKey(t,this.chain,!0);if(t&&i)this[e]={token:i,value:s};else{const t="from"===e?"to":"from";i=this.swappableTokens[this.chain.name].find((e=>!z.Z.isSameToken(e,this[t].token))),this[e]={token:i,value:s}}},switchTokens(){if(this.isLoading)return;const{from:e,to:t}=this;t.value.gt(z.Z.tokenDecimal(t.token))&&(t.value=new c.Z(z.Z.tokenDecimal(t.token))),this.from=t,this.to=e},updateQueryParams(){const e={};this.from.token&&(this.chain=this.from.token.chain,e.from=this.from.token.address,e.chain=JSON.stringify(this.from.token.chain)),this.from.value&&(e.value=this.from.value),this.to.token&&(e.to=this.to.token.address),this.$router.replace({path:this.$route.path,query:e}).catch((()=>{}))},updateQuote:r((function(){if(0===this.from.value||this.generalTxError||!this.isValidSlippage)return;const e=this.to.token?this.to.token.address:null,t=this.from.token?this.from.token.address:null,s=this.amountWithoutDecimals;if(!(e&&t&&s))return this.quote=null,this.loading.quote=!1,void(this.error=null);this.loading.quote?this.pendingApprovals.length&&this.pendingApprovals.find((e=>e.token.address!==t))&&(clearInterval(this.interval),this.getQuote()):(clearInterval(this.interval),this.currentPendingApprovalHash?this.interval=setInterval((()=>{this.getQuote()}),5e3):this.getQuote())}),1e3)}},te=ee,se=(0,m.Z)(te,i,a,!1,null,null,null),ie=se.exports},51223:function(e,t,s){var i=s(5112),a=s(70030),n=s(3070).f,r=i("unscopables"),o=Array.prototype;void 0==o[r]&&n(o,r,{configurable:!0,value:a(null)}),e.exports=function(e){o[r][e]=!0}},70030:function(e,t,s){var i,a=s(19670),n=s(36048),r=s(80748),o=s(3501),l=s(60490),c=s(80317),p=s(6200),u=">",h="<",d="prototype",m="script",g=p("IE_PROTO"),f=function(){},v=function(e){return h+m+u+e+h+"/"+m+u},k=function(e){e.write(v("")),e.close();var t=e.parentWindow.Object;return e=null,t},w=function(){var e,t=c("iframe"),s="java"+m+":";return t.style.display="none",l.appendChild(t),t.src=String(s),e=t.contentWindow.document,e.open(),e.write(v("document.F=Object")),e.close(),e.F},b=function(){try{i=new ActiveXObject("htmlfile")}catch(t){}b="undefined"!=typeof document?document.domain&&i?k(i):w():k(i);var e=r.length;while(e--)delete b[d][r[e]];return b()};o[g]=!0,e.exports=Object.create||function(e,t){var s;return null!==e?(f[d]=a(e),s=new f,f[d]=null,s[g]=e):s=b(),void 0===t?s:n.f(s,t)}},36048:function(e,t,s){var i=s(19781),a=s(3353),n=s(3070),r=s(19670),o=s(45656),l=s(81956);t.f=i&&!a?Object.defineProperties:function(e,t){r(e);var s,i=o(t),a=l(t),c=a.length,p=0;while(c>p)n.f(e,s=a[p++],i[s]);return e}},81956:function(e,t,s){var i=s(16324),a=s(80748);e.exports=Object.keys||function(e){return i(e,a)}},52262:function(e,t,s){"use strict";var i=s(82109),a=s(47908),n=s(26244),r=s(19303),o=s(51223);i({target:"Array",proto:!0},{at:function(e){var t=a(this),s=n(t),i=r(e),o=i>=0?i:s+i;return o<0||o>=s?void 0:t[o]}}),o("at")},24506:function(e,t,s){"use strict";var i=s(82109),a=s(1702),n=s(84488),r=s(19303),o=s(41340),l=s(47293),c=a("".charAt),p=l((function(){return"\ud842"!=="𠮷".at(-2)}));i({target:"String",proto:!0,forced:p},{at:function(e){var t=o(n(this)),s=t.length,i=r(e),a=i>=0?i:s+i;return a<0||a>=s?void 0:c(t,a)}})}}]);