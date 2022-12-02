"use strict";(self["webpackChunkdesktop_wallet"]=self["webpackChunkdesktop_wallet"]||[]).push([[826],{72598:function(e,t,i){i.d(t,{Z:function(){return m}});var s=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{ref:"deck"},[i("div",{staticClass:"cursor-pointer flex flex-nowrap flex-row-reverse flex-wrap justify-end overflow-visible",style:{paddingLeft:e.cardFoldPx+"px"}},[e.deckMore?i("div",{staticClass:"align-middle bg-opacity-10 font-semibold inline-block overflow-hidden pl-1 relative rounded-xl text-center",class:e.cardMoreClasses,style:{fontSize:e.deckMoreFontSizePx+"px",height:e.cardHeightPx+"px",lineHeight:e.cardHeightPx+"px",marginLeft:"-"+e.cardMoreFoldPx+"px",width:e.cardMoreWidthPx+"px"},on:{click:function(t){return e.openMore(t)}}},[e.stillLoadingCount>0?i("lottie-component",{staticClass:"absolute",style:{left:0,top:0,height:e.cardHeightPx+"px"},attrs:{src:"loader_nft_more.json"}}):e._e(),i("span",{class:[e.cardMoreFoldPx<=33.5?"ml-5":"ml-3.5"]},[e._v(e._s(e.deckMoreFriendly))])],1):e._e(),i("div",{style:{width:e.unusedSpacePx+"px"}}),e._l(e.deckCards,(function(t,s){return i("div",{key:s,staticClass:"cursor-pointer justify-self-end",class:{"h-32":e.isHovering===s},style:{width:e.cardWidthPx+"px",height:e.cardHeightPx+"px",marginLeft:"-"+e.cardFoldPx+"px",marginRight:(0!==s&&e.cardGapPx||0)+"px",zIndex:e.isHovering===s?1:0},attrs:{title:t.name},on:{click:function(i){return e.openCard(i,t)},mouseout:function(t){e.isHovering=-1},mouseover:function(t){e.isHovering=s}}},[i("lazy-image",{staticClass:"bg-center bg-input-bg inline-block object-cover overflow-hidden rounded-xl",class:"Overview"===e.$route.name?"bg-opacity-50":"bg-opacity-100",style:{transition:"transform 0.1s",transform:e.isHovering===s?"scale(1.1) translateY(-16px)":"",filter:"drop-shadow(4px 4px 8px rgba(0, 0, 0, 0.25))",boxShadow:"1px 4px 4px 0px rgba(0, 0, 0, 0.25)",width:e.cardWidthPx+"px",height:e.cardHeightPx+"px"},attrs:{placeholder:e.placeholder,src:e.getCardImage(t)}})],1)}))],2)])},a=[],n=i(81130),r=i(39944),l=i(4634);const o=8,c=80;var d={name:"CardsDeck",components:{LazyImage:n.Z,LottieComponent:r.Z},props:{cardHeightPx:{default:c,type:Number},cardMoreClasses:{default:()=>["bg-input-bg","text-dark-N12","font-medium"],type:Array},cardMoreFoldPx:{default:33.5,type:Number},cards:{default:()=>[],type:Array},layouts:{default:()=>{const[e,t,i]=[-2,-21.5,-33.5],s=[c,i],a=[c,t],n=[c,e],r=[c,o];return[s,a,n,r]},type:Array},propagateClick:{default:!1,type:Boolean},stillLoadingCount:{default:0,type:Number}},data(){return{DECK_MORE_SAFE_NUMBER:10049,cardFoldPx:0,cardGapPx:o,cardMoreWidthPx:c,cardWidthPx:c,deckLimit:null,deckWidthPx:0,isHovering:-1,placeholder:i(29738),resizeObserver:void 0,unusedSpacePx:0}},computed:{deckCards(){const{cards:e}=this,t=e.slice(0,this.getBestDeckLimit());return t},deckCardsLength(){return this.deckCards.length},deckMore(){return this.cards.length-this.deckCardsLength},deckMoreFontSizePx(){return this.deckMore<=this.DECK_MORE_SAFE_NUMBER?16:12},deckMoreFriendly(){return`+${l.ZP.longNumberToFriendlyFormat(this.deckMore,1)}`}},beforeDestroy(){this.resizeObserver.disconnect()},mounted(){const e=this.$refs.deck;this.resizeObserver=new ResizeObserver(this.onResize.bind(this)),this.resizeObserver.observe(e),this.onResize()},methods:{getBestDeckLimit(){const{layouts:e}=this,t=e.map((e=>this.getDeckLimit.apply(null,e)));t.sort(((e,t)=>e.moreCount-t.moreCount||e.unusedSpacePx-t.unusedSpacePx));const[i]=t;return this.cardWidthPx=i.cardWidthPx,i.cardShiftPx<0?(this.cardFoldPx=-i.cardShiftPx,this.cardGapPx=0):(this.cardFoldPx=0,this.cardGapPx=i.cardShiftPx),this.unusedSpacePx=i.unusedSpacePx,i.maxCardsCount},getCardImage(e){return e.image||e.collectibles?.[0].image},getDeckLimit(e,t=0,i=0){const s={},a=this.cards.length,{cardMoreFoldPx:n,cardMoreWidthPx:r,deckWidthPx:l}=this,o=l+t-i,c=e+t,d=Math.floor(o/c),h=Math.min(d,a),p=h*c-t;if(d<a&&!i)return this.getDeckLimit(e,t,r-n);const u=a-h,m=l-p-i;return Object.assign(s,{_availableSpacePx:o,cardShiftPx:t,cardWidthPx:e,cardsUsed:h,cardsWidthPx:p,deckWidthPx:l,maxCardsCount:d,moreCount:u,moreWidthPx:i,unusedSpacePx:m}),this.deckLimit=s,s},onResize(){const e=this.$refs?.deck?.clientWidth;this.deckWidthPx=e},openCard(e,t){this.propagateClick||e.stopPropagation(),this.isHovering=-1,this.$emit("openCard",t)},openMore(e){this.propagateClick||e.stopPropagation(),this.$emit("openMore")}}},h=d,p=i(1001),u=(0,p.Z)(h,s,a,!1,null,null,null),m=u.exports},81130:function(e,t,i){i.d(t,{Z:function(){return d}});var s=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("figure",{ref:"lazyImage",staticClass:"t-lazy_image"},[e.loading?i("spinning-loader",{staticClass:"h-full"}):e._e()],1)},a=[],n=i(25e3),r={name:"LazyImage",components:{SpinningLoader:n.Z},props:{placeholder:{default:"",type:String},src:{default:"",type:String}},data(){return{loading:!1}},mounted(){this.loadImage()},methods:{loadImage(){this.loading=!0;const e=new Image;e.classList.add("w-full"),e.classList.add("h-full"),e.style.borderRadius="inherit",e.style.objectFit="inherit",e.alt="",e.complete&&this.$nextTick((()=>{e.src=this.src,this.loading=!1})),e.onerror=()=>{this.$nextTick((()=>{e.src=this.placeholder,this.loading=!1}))},this.$refs.lazyImage.appendChild(e)}}},l=r,o=i(1001),c=(0,o.Z)(l,s,a,!1,null,null,null),d=c.exports},79526:function(e,t,i){i.d(t,{Z:function(){return d}});var s=function(){var e=this,t=e.$createElement,i=e._self._c||t;return e.chainNameFriendly?i("div",{staticClass:"flex items-center justify-between pr-4 rounded-full space-x-1 t-chain-badge-v2 text-sm",class:[e.backgroundColor]},[e.chainLogo?i("img",{staticClass:"object-contain w-10",staticStyle:{"margin-right":"5px"},attrs:{alt:"",src:e.chainLogo}}):e._e(),i("span",{staticClass:"t-chain-badge-v2-name text-dark-N77"},[e._v(e._s(e.chainNameFriendly))]),i("span",{staticClass:"t-chain-badge-v2-type"},[e._v(e._s(e.tokenType))])]):e._e()},a=[],n=i(6445),r={name:"ChainBadgeV2",props:{backgroundColor:{default:"bg-dark-N12",type:String},chain:{default:void 0,type:Object},tokenType:{default:"",type:String}},computed:{chainLogo(){if(this.chain)return(0,n.Z)(this.chain).icon()},chainNameFriendly(){if(this.chain)return this.$store.getters.chainNameFriendly(this.chain)}}},l=r,o=i(1001),c=(0,o.Z)(l,s,a,!1,null,null,null),d=c.exports},79826:function(e,t,i){i.d(t,{Z:function(){return L}});var s=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{key:e.timesOptionsUpdated,staticClass:"mb-6 px-7"},[e.options.length?s("div",[s("div",{class:[1===e.options.length?"flex justify-center":"grid gap-4 grid-cols-2"]},[e._l(e.options,(function(t,i){return s("card-item",{key:i,staticClass:"cursor-pointer",attrs:{item:t,type:t.collectibles?"collection":"collectible"},nativeOn:{mousemove:function(i){return e.prepareChainBadge(i,t)},mouseout:function(t){return e.hideChainBadge.apply(null,arguments)}}})})),e._l(e.stillLoadingCount,(function(e){return s("div",{key:"skeletor-"+e,style:{width:"200px"}},[s("lottie-component",{attrs:{src:"loader_gal_nft.json"}})],1)})),e.displayChainBadge?s("chain-badge-v2",{ref:"chainBadge",staticClass:"absolute opacity-0 transition-all z-10",attrs:{chain:e.chain,"token-type":e.tokenType}}):e._e()],2)]):s("div",{staticClass:"absolute flex flex-col inset-0 items-center justify-center my-80"},[s("img",{staticClass:"h-24 w-36",attrs:{src:i(67863)}}),s("p",{staticClass:"font-medium leading-8 mb-10 mt-8 mx-24 text-center text-dark-N77 text-lg"},[e._v(" "+e._s(e.$t("components.nfts.noNfts"))+" ")]),s("receive-nfts-button")],1)])},a=[],n=function(){var e=this,t=e.$createElement,i=e._self._c||t;return e.item.name?i("div",{staticClass:"group overflow-visible",class:["t-"+e.type+"_card_item-click flex justify-center"],on:{click:e.clickItem}},[i("div",{staticClass:"bg-dark-N04 bg-opacity-60 flex flex-col group-hover:bg-opacity-100 items-center justify-between max-w-sm rounded-lg transition-all",class:"t-"+e.type+"_card_item",staticStyle:{width:"200px",height:"260px"}},[e.displayCardDeck?i("div",{staticClass:"h-full mt-5 w-full",staticStyle:{height:"180px"}},[i("cards-deck",{staticClass:"flex items-center min-h-full mx-2.5 rounded-lg",attrs:{"card-height-px":120,"card-more-classes":["bg-dark-N77","text-dark-N77"],"card-more-fold-px":90,cards:e.cards,layouts:e.cardsDeckLayouts,"propagate-click":""}})],1):i("lazy-image",{staticClass:"flex-grow h-full object-cover rounded-lg w-full",style:{maxHeight:(e.displayMetadata?180:200)+"px"},attrs:{placeholder:e.placeholder,src:e.collectibleImage}}),i("div",{staticClass:"flex-grow px-3.5 relative w-full",class:[{"pb-5":e.isCollection}]},[i("div",{staticClass:"flex flex-col justify-between mt-1"},[i("p",{staticClass:"font-bold mb-1 mt-3 text-base truncate",class:["t-"+e.type+"_card_item-name"]},[e._v(" "+e._s(e.item.name)+" ")]),e.displayMetadata?i("p",{staticClass:"text-dark-N77 text-xs truncate"},[e._v(" "+e._s(e.isCollection?e.balance:e.$t("general.noCollection"))+" ")]):e._e()])])],1)]):e._e()},r=[],l=(i(57658),i(72598)),o=i(81130),c=i(56258),d=i(98180),h={name:"CardItem",components:{CardsDeck:l.Z,LazyImage:o.Z},props:{item:{default:void 0,type:Object},type:{default:"",type:String}},data(){return{placeholder:i(29738)}},computed:{balance(){if(!this.isCollection)return;const e=this.item.collectibles.length;return 1===e?this.item.collectibles[0].name:`${e} ${this.$t("general.collectibles")}`},cards(){if(!this.displayCardDeck)return;const e=this.item.collectibles.map((e=>Object.assign({},e,{_image:e.image})));return e},cardsDeckLayouts(){const e=120,[t,i]=[-30,-60],s=[e,i],a=[e,t];return this.cards?.length>2?[a]:[s]},chain(){const e=this.item.collectibles?.[0]??this.item;return e.chain},collectibleImage(){return this.item.image},collectionImage(){return this.item.image_url??this.item.image},displayCardDeck(){return this.isCollection&&this.numberOfCollectibles>1},displayMetadata(){return this.isCollection||this.isCollectible&&"CollectionsView"===this.$route.name},isCollectible(){return"collectible"===this.type},isCollection(){return"collection"===this.type},numberOfCollectibles(){return this.item.collectibles?.length},tokenType(){const e=this.item.collectibles?.[0]??this.item;return d.Z.tokenTypeFriendly(e.type)}},methods:{clickItem(){if(this.isCollectible){c.Z.sendStatsEvent(c.Z.types.CLICK,"wt_nft_nftClicked",{collection:this.item.contract,tokenId:this.item.id});const e=this.$route.params?.collection??this.item.collection;this.$router.push({name:"CollectibleView",params:{collectible:this.item,collection:e}})}else this.isCollection&&(c.Z.sendStatsEvent(c.Z.types.CLICK,"wt_nft_colClicked",{collection:this.item.collectibles[0].contract}),this.$router.push({name:"CollectionView",params:{collection:this.item}}))}}},p=h,u=i(1001),m=(0,u.Z)(p,n,r,!1,null,null,null),g=m.exports,f=i(79526),x=i(39944),y=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("button",{staticClass:"bg-brand-primary flex font-semibold items-center px-4.5 py-3.5 rounded-xl t-receive_button-click text-dark-N08 text-sm",on:{click:e.click}},[i("i",{staticClass:"icon-arrow_down mr-3",staticStyle:{"font-size":"1rem"}}),i("span",[e._v(e._s(e.$t("components.nfts.receiveNfts")))])])},C=[],b={name:"ReceiveNftsButton",props:{title:{default:"",type:String}},methods:{click(){const e=this.$store.getters.getPrimaryAvailableChain,t=this.$store.getters.matchingNativeToken("",e);this.$router.push({name:"ReceiveToken",params:{token:t}})}}},k=b,v=(0,u.Z)(k,y,C,!1,null,null,null),_=v.exports,P={name:"NftList",components:{CardItem:g,ChainBadgeV2:f.Z,LottieComponent:x.Z,ReceiveNftsButton:_},props:{options:{default:()=>[],type:Array},stillLoadingCount:{default:0,type:Number}},data(){return{chain:null,timesOptionsUpdated:0,tokenType:null}},computed:{displayChainBadge(){return this.chain&&this.tokenType&&"CollectionsView"===this.$route.name},optionsLength(){return this.options.length}},watch:{optionsLength(){this.timesOptionsUpdated+=1}},methods:{hideChainBadge(){this.$refs.chainBadge&&(this.$refs.chainBadge.$el.style.opacity="0",this.chain=null,this.tokenType=null)},prepareChainBadge(e,t){this.displayChainBadge&&this.hideChainBadge();const i=t.collectibles?.[0]??t;this.chain=i.chain,i.type&&(this.tokenType=d.Z.tokenTypeFriendly(i.type),this.$nextTick((()=>{if(!this.$refs.chainBadge)return;const t=20,i=e.pageX>240?-160:t;this.$refs.chainBadge.$el.style.left=`${e.pageX+i}px`,this.$refs.chainBadge.$el.style.top=`${e.pageY+t}px`})),setTimeout((()=>{this.$refs.chainBadge&&(this.$refs.chainBadge.$el.style.opacity="0.9")}),2e3))}}},$=P,w=(0,u.Z)($,s,a,!1,null,null,null),L=w.exports},29738:function(e,t,i){e.exports=i.p+"img/collectible_placeholder.90e43ae1.svg"},67863:function(e,t,i){e.exports=i.p+"img/empty_nfts2.21d7223c.svg"}}]);