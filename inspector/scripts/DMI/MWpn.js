//namespace scope
(function( DMI, $, undefined ){
		
var MWpn = DMI.MWpn = DMI.MWpn || {};

var Format = DMI.Format;
var Utils = DMI.Utils;

var modctx = DMI.modctx;
var modconstants = DMI.modconstants;

//////////////////////////////////////////////////////////////////////////
// PREPARE DATA
//////////////////////////////////////////////////////////////////////////



MWpn.initWpn = function(o) {
	o.used_by = [];
}

MWpn.prepareData_PreMod = function() {
	for (var oi=0, o; o= modctx.wpndata[oi]; oi++) {
		o.used_by = [];
	}
}

MWpn.prepareData_PostMod = function() {
	for (var oi=0, o; o= modctx.wpndata[oi]; oi++) {
		o.id = parseInt(o.id);
		
		o.renderOverlay = MWpn.renderOverlay;
		o.matchProperty = MWpn.matchProperty;

		//serachable string
		o.searchable = o.name.toLowerCase();
		
		//may want to display 0 damage (alongside flags)
		if (!o.dmg) 
			o.dmg = '0';
		
		//missile / melee
		if (o.ammo && o.ammo != '0') {
			if (o.att) {
				o.prec = o.att;
				delete o.att;
			}
			o.wpnclass = 'missile';
		}
		else 
			o.wpnclass = 'melee';
		
		
		//special values
		if (o.nostr=='1' && (o.dmg== '-11' || o.dmg== '-12')) {
			o.dmg = '-999';
			o.special = 'banishment';
		}
		
		//backlinks on secondary effects
		var secondaryeffect = modctx.wpnlookup[o.secondaryeffect] || modctx.wpnlookup[o.secondaryeffectalways];
		if (secondaryeffect)
			Utils.joinArray( Utils.wpnRef(o.id)+'(wpn)', secondaryeffect.used_by )
	}
}
		
//////////////////////////////////////////////////////////////////////////
// DEFINE GRID
//////////////////////////////////////////////////////////////////////////

MWpn.CGrid = Utils.Class( DMI.CGrid, function() {
	//grid columns
	var columns = [
		{ id: "name",     width: 145, name: "Weapon Name", field: "name", sortable: true },
		{ id: "wpnclass",     width: 60, name: "Type", field: "wpnclass", sortable: true },
		{ id: "twohanded",     width: 60, name: "2-h", field: "twohanded", sortable: true }
	];
	
	this.superClass.call(this, 'wpn', modctx.wpndata, columns); //superconstructor
	
	$(this.domsel+' .grid-container').css('width', 530);//set table width

	
	//in closure scope
	var that = this;

	//reads search boxes
	this.getSearchArgs = function() {
		var args = Utils.merge(this.getPropertyMatchArgs(), {
			str: $(that.domselp+" input.search-box").val().toLowerCase()
		});
		return args;
	}
	//apply search
	this.searchFilter =  function(o, args) {
		//type in id to ignore filters
		if (args.str && args.str == String(o.id)) return true;
		
		//search string
		if (args.str && o.searchable.indexOf(args.str) == -1)
			return false;

		//key =~ val
		if (args.key) {
			var r = o.matchProperty(o, args.key, args.comp, args.val);
			if (args.not  ?  r  :  !r)
				return false;
		}
		return true;
	}

	//final init
	this.init();
});
MWpn.matchProperty = function(o, key, comp, val) {
	if (key=='ap') key = 'armorpiercing';
	if (DMI.matchProperty(o, key, comp, val))
		return true;

	//check attached weapons
	if (o.secondaryeffect)
		return MWpn.matchProperty(o.secondaryeffect, key, comp, val);
	else if (o.secondaryeffectalways)
		return MWpn.matchProperty(o.secondaryeffectalways, key, comp, val);
}

		
//////////////////////////////////////////////////////////////////////////
// OVERLAY RENDERING
//////////////////////////////////////////////////////////////////////////

var aliases = {};
var formats = {};
var displayorder = DMI.Utils.cutDisplayOrder(aliases, formats,
[
//	dbase key	displayed key		function/dict to format value
	'dmg',		'damage',
	'range',	'range',	{ 1:'0', '-1':'strength', '-2':'strength/2', '-3':'strength/3', '-4':'strength/4', '-5':'strength/5' },
	'att',		'attack',	Format.Signed,
	'prec',		'precision',	Format.Signed,
	'def',		'defence',	Format.Signed,
	'len',		'length',
	'nratt',	'nbr of attacks',
	'ammo',		'ammunition',	{'0':'12'},
	'aoe',		'area of effect',
	'special',	'special',	function(v,o){ 
		return v.replace(/affliction:\s*(.*)/i, 'affliction: '+Utils.ref('affliction $1','$1'));
	}
]);

formats.dmg = function(v,o) {
	//special values
	if (v=='999') v = 'death';
	if (v=='-999') return '0';
	
	//force render 0
	v+= ' ';
	
	//append dmgflags
	var slist = [];
	for (var i=0, k; k=dmgflags[i]; i++)			
		if (o[k] == '1') slist.push('<span class="flag">'+aliases[k]+'</span>');
	if (slist.length)
		v += '(' + slist.join(', ') + ')';
	
	//not useful information
	if (v=='spc ') return '0';
	
	return v;
}

formats.nratt = function(v,o) {
	if (v=='1' && o.isImplicitWpn)  
		return '0';
	//-2 is once every 2 turns
	return (v && v<0)  ?  '1 per '+(-v)+' turns'  :  v; 
}

var flagorder = DMI.Utils.cutDisplayOrder(aliases, formats,
[
	'magic',	'magic weapon',
//	dbase key	displayed key		function/dict to format value
	'onestrike',	'one use only',

//		'dt_cap',	'max 1hp damage',
	'dt_demon',	'x2 vs demons',
	'dt_demononly',	'only damages demons',
	'dt_holy',	'x3 vs undead/demon',
	'dt_magic',	'x2 vs magic beings',
	'dt_magiconly',	'only damages magic beings',
	'dt_small',	'x2 vs smaller beings',
	'dt_large',	'x2 vs larger beings',
	'dt_constructonly','only damages lifeless beings',
	'dt_raise',	'victims raised as soulless',
	'mind',		'mindless beings are immune',
	
	'dt_slave',	'victims are enslaved',
	
	'partdrain',	'partial life drain',
	'drain',	'life drain',
	
	'charge',		'charge bonus',
	'flail',		'+2 att vs shields',
	'mrnegates',		'MR negates',
	'mrnegateseasily',	'MR negates easily'
]);
var dmgflags = DMI.Utils.cutDisplayOrder(aliases, formats,
[
//	dbase key	displayed key		function/dict to format value
	'dt_cap',		'max 1 HP damage',
	'nostr',		'no strength',
	'armorpiercing',	'armor piercing',
	'armornegating',	'armor negating',
	'cold',		'cold',
	'fire',		'fire',
	'shock',	'shock',
	'poison',	'poison',
	//'dt_normal', 	'normal damage',
	'dt_stun',	'stun',
	'dt_paralyze',	'paralyze',
	'dt_poison',	'damage over time'
]);
var hiddenkeys = DMI.Utils.cutDisplayOrder(aliases, formats,
[
	'id', 		'weap id',	function(v,o){ return v + ' ('+o.name+')'; },
	'rcost',	'resource cost'
]);
var ignorekeys = {
	used_by:1,
	modded:1,
	id:1,
	name:1,
	dt_normal: 'damage type normal',
	bonus: 'no hands needed',
	//nostr:1,
	//dt_cap:1,
	secondaryeffect:1,
	secondaryeffectalways:1,
	'twohanded': '2 handed',
	isImplicitWpn:1,

	'fx_iron': 'fx_iron',
	'fx_wood': 'fx_wood',
	wpnclass:1,
	searchable:1, renderOverlay:1, matchProperty:1
};
	

MWpn.renderOverlay = function(o, baseAtt) {
	//template
	var h=''
	h+='<div class="wpn overlay-contents"> ';
	
	var slotusage = (o.bonus=='1')  ?  'no slot'  :  (o['twohanded']=='1')  ?  '2 hands'  :  '1 hand';
	
	//header
	h+='	<div class="overlay-header" title="weap id: '+o.id+'"> ';
	h+='		<p style="float:right; height:0px;">'+slotusage+'</p>';
	h+='		<h2>'+o.name+'</h2> ';
	h+='	</div>';
	
	//mid
	h+='	<div class="overlay-main">';
	h+=' 		<input class="overlay-pin" type="image" src="images/PinPageTrns.png" title="unpin" />';
	
	h+=		MWpn.renderWpnTable(o, true);
	h+='	</div>';
	
	//footer
	if (o.used_by.length) {
		h+='<div class="overlay-footer">';
		if (o.used_by.length > 8) {
			//hide uberlong list
			h+='	<p class="firstline">';
			h+='		Used by: '+o.used_by.length+' things ';
			
			//button to reveal
			var codereveal = "$(this).parent('p').hide().parent('div').find('.full-list').show()"
			h+='<input class="inline-button" style="padding:none" type="button" value="show" onclick="'+codereveal+'"/>';
			h+='	</p>';
		
			//the actual list
			h+='	<p class="firstline full-list" style="display:none">';
			h+='		Used by: '+ o.used_by.join(', ');
			h+='	</p>';
		} else {
			h+='	<p class="firstline">';
			h+='		Used by: '+ o.used_by.join(', ');
			h+='	</p">';
		}
		h+='</div> ';
	}
	h+='</div> ';
	return h;	
}

//weapon tables are also rendered inline in items
MWpn.renderWpnTable = function(o, isImplicitWpn) {
	//force render??
	//if (!o.dmg) o.dmg = '0';
	o.isImplicitWpn = isImplicitWpn;
		
	//ranged weapon specific
	//aliases.att = (o.wpnclass == 'ranged')  ?  'precision'  :  'attack';
	
	//local scope
	//formats.nratt = function(v){ return (v=='1' && isImplicitWpn)  ?  '0'  :  v; };

	
	//template
	var h=''
	h+='		<table class="overlay-table wpn-table"> ';
	h+= 			Utils.renderDetailsRows(o, hiddenkeys, aliases, formats, 'hidden-row');
	h+= 			Utils.renderDetailsRows(o, displayorder, aliases, formats);
	h+= 			Utils.renderDetailsFlags(o, flagorder, aliases, formats);
	h+= 			Utils.renderStrangeDetailsRows(o, ignorekeys, aliases, 'strange');
	
	if (o.modded) {
		h+='	<tr class="modded hidden-row"><td colspan="2">Modded<span class="internal-inline"> [modded]</span>:<br />';
		h+=		o.modded.replace('ERROR:', '<span style="color:red;font-weight:bold;">ERROR:</span>');
		h+='	</td></tr>';
	}
	h+='		</table> ';		

	//effects are implemented as further weapons
	var secondaryeffect = modctx.wpnlookup[o.secondaryeffect];
	var secondaryeffectalways = modctx.wpnlookup[o.secondaryeffectalways];
	
	if (o.secondaryeffectalways && secondaryeffectalways) {
		h+=' <h4>Auto effect: '+secondaryeffectalways.name+'</h4>';
		//detect recursion
		if (secondaryeffectalways == o)
			throw 'Error, weapon 2nd effect as itself: '+o.id+': '+o.name; 
		else {
			h+= MWpn.renderWpnTable(secondaryeffectalways, true);
		}
	} 
	else if (o.secondaryeffect && secondaryeffect) {
		h+=' <h4>On-hit effect: '+secondaryeffect.name+'</h4>';
		//detect recursion
		if (secondaryeffect == o)
			throw 'Error, weapon 2nd effect as itself: '+o.id+': '+o.name; 
		else {
			h+= MWpn.renderWpnTable(secondaryeffect, true);
		}
	}
	return h;
}



//namespace args
}( window.DMI = window.DMI || {}, jQuery ));