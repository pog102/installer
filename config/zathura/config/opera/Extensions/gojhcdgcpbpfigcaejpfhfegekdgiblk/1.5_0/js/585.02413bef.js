"use strict";(self["webpackChunkdesktop_wallet"]=self["webpackChunkdesktop_wallet"]||[]).push([[585],{49970:function(t,o,e){e.d(o,{Z:function(){return h}});var l=function(){var t=this,o=t.$createElement,l=t._self._c||o;return l("div",{staticClass:"backdrop-blur-2xl bg-dark-N16 cursor-pointer fixed h-14 right-6 rounded-full transition-opacity w-14",style:{opacity:t.showBackToTopOpacity,bottom:t.showBackToTopBottom+"px"},on:{click:function(o){return o.stopPropagation(),t.scrollToTop.apply(null,arguments)}}},[l("img",{staticClass:"mx-auto",style:{marginTop:"23px"},attrs:{src:e(80779)}})])},s=[];const n=22,i=56,r=window.innerHeight;var c={name:"BackToTop",data(){return{showBackToTopBottom:-i,showBackToTopOpacity:0}},computed:{scrollableEl(){return this.$parent.$el}},beforeUnmount(){this.scrollableEl.removeEventListener("scroll",this.onScroll)},mounted(){this.scrollableEl.addEventListener("scroll",this.onScroll)},methods:{onScroll(t){const o=r,{scrollTop:e}=t.target,l=e-o;if(l>0){this.showBackToTopOpacity=1;let t=-i+l;t>n&&(t=n),this.showBackToTopBottom=t}else this.showBackToTopOpacity=0},scrollToTop(){this.scrollableEl.scrollTo(0,0)}}},a=c,p=e(1001),u=(0,p.Z)(a,l,s,!1,null,null,null),h=u.exports},35962:function(t,o,e){e.r(o),e.d(o,{default:function(){return d}});var l=function(){var t=this,o=t.$createElement,e=t._self._c||o;return"CollectionsView"===t.$route.name?e("div",[t.loading?e("spinning-loader",{staticClass:"h-full"}):e("div",[e("top-bar",{attrs:{"back-override":t.back,"test-parent-name":"collections_view",title:t.$t("general.collectibles")}}),e("collections-list",{staticClass:"py-5",attrs:{options:t.collections,"still-loading-count":t.stillLoadingCount}})],1),e("back-to-top")],1):t._e()},s=[],n=(e(84633),e(57658),e(79826)),i=e(49970),r=e(25e3),c=e(38423),a={name:"CollectionsView",components:{BackToTop:i.Z,CollectionsList:n.Z,SpinningLoader:r.Z,TopBar:c.Z},beforeRouteLeave(t,o,e){Object.assign(this.$scrollKeeper,{"nft-gallery-scroll":this.$el.scrollTop}),e()},computed:{collections(){return this.$store.getters.allNfts},collectionsLength(){return this.collections.length},loading(){return this.$store.getters.isLoading("nfts")&&!this.collectionsLength},loadingMore(){return this.$store.getters.isLoading("nfts")},stillLoadingCount(){return this.loadingMore?Math.max(2,2+this.collectionsLength%2):0}},activated(){setImmediate((()=>{this.$el.scrollTop=this.$scrollKeeper["nft-gallery-scroll"]||0}))},async created(){this.$store.getters.getTimesLoaded("nfts")||await this.$store.dispatch("getAllNfts")},methods:{back(){this.$router.push({name:"Overview"})}}},p=a,u=e(1001),h=(0,u.Z)(p,l,s,!1,null,null,null),d=h.exports},80779:function(t,o,e){t.exports=e.p+"img/chevron_up.dbe760c6.svg"}}]);