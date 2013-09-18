/*
 * generated by Xtext
 */
package org.larz.dom4.dm.formatting

import org.eclipse.xtext.formatting.impl.AbstractDeclarativeFormatter
import org.eclipse.xtext.formatting.impl.FormattingConfig
import org.larz.dom4.dm.services.DmGrammarAccess


/**
 * This class contains custom formatting description.
 * 
 * see : http://www.eclipse.org/Xtext/documentation.html#formatting
 * on how and when to use it 
 * 
 * Also see {@link org.eclipse.xtext.xtext.XtextFormattingTokenSerializer} as an example
 */
class DmFormatter extends AbstractDeclarativeFormatter {

//	@Inject extension DmGrammarAccess
	
	override protected void configureFormatting(FormattingConfig c) {
		c.setLinewrap(0, 1, 2).before((getGrammarAccess() as DmGrammarAccess).getSL_COMMENTRule());
		c.setLinewrap(0, 1, 2).before((getGrammarAccess() as DmGrammarAccess).getML_COMMENTRule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getML_COMMENTRule());
		
		// General rules
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getDom4ModAccess().getDescriptionKeyword_0_1_0());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getDom4ModAccess().getIconKeyword_0_2_0());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getDom4ModAccess().getVersionKeyword_0_3_0());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getDom4ModAccess().getDomversionKeyword_0_4_0());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getGeneralPattern1Rule());
		
		// Armor rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectArmorByIdRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectArmorByIdRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectArmorByIdAccess().getEndKeyword_4());
		
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectArmorByNameRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectArmorByNameRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectArmorByNameAccess().getEndKeyword_4());

		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getNewArmorRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getNewArmorRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNewArmorAccess().getEndKeyword_4());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getArmorPattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getArmorPattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getArmorPattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getArmorPattern2Rule());
		
		// Weapon rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectWeaponByIdRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectWeaponByIdRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectWeaponByIdAccess().getEndKeyword_4());
		
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectWeaponByNameRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectWeaponByNameRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectWeaponByNameAccess().getEndKeyword_4());

		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getNewWeaponRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getNewWeaponRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNewWeaponAccess().getEndKeyword_4());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getWeaponPattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getWeaponPattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getWeaponPattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getWeaponPattern2Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getWeaponPattern3Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getWeaponPattern3Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getWeaponPattern4Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getWeaponPattern4Rule());
		
		// Monster rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectMonsterByIdRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectMonsterByIdRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectMonsterByIdAccess().getEndKeyword_4());
		
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectMonsterByNameRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectMonsterByNameRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectMonsterByNameAccess().getEndKeyword_4());

		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getNewMonsterRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getNewMonsterRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNewMonsterAccess().getEndKeyword_4());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMonsterPattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMonsterPattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMonsterPattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMonsterPattern2Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMonsterPattern3Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMonsterPattern3Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMonsterPattern4Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMonsterPattern4Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMonsterPattern5Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMonsterPattern5Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMonsterPattern6Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMonsterPattern6Rule());
		
		// Item rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectItemByIdRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectItemByIdRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectItemByIdAccess().getEndKeyword_4());
		
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectItemByNameRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectItemByNameRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectItemByNameAccess().getEndKeyword_4());

		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getNewItemRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getNewItemRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNewItemAccess().getEndKeyword_3());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getItemPattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getItemPattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getItemPattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getItemPattern2Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getItemPattern3Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getItemPattern3Rule());
		
		// Site rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectSiteByIdRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectSiteByIdRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectSiteByIdAccess().getEndKeyword_4());
		
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectSiteByNameRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectSiteByNameRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectSiteByNameAccess().getEndKeyword_4());

		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getNewSiteRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getNewSiteRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNewSiteAccess().getEndKeyword_4());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSitePattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSitePattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSitePattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSitePattern2Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSitePattern3Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSitePattern3Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSitePattern4Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSitePattern4Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSitePattern5Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSitePattern5Rule());
		
		// Spell rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectSpellByIdRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectSpellByIdRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectSpellByIdAccess().getEndKeyword_4());
		
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectSpellByNameRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectSpellByNameRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectSpellByNameAccess().getEndKeyword_4());

		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getNewSpellRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getNewSpellRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNewSpellAccess().getEndKeyword_3());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSpellPattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSpellPattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSpellPattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSpellPattern2Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSpellPattern3Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSpellPattern3Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSpellPattern4Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSpellPattern4Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSpellPattern5Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getSpellPattern5Rule());
		
		// Nation rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectNationRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectNationRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectNationAccess().getEndKeyword_4());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNationPattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getNationPattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNationPattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getNationPattern2Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNationPattern3Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getNationPattern3Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNationPattern4Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getNationPattern4Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNationPattern5Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getNationPattern5Rule());
		
		// Name rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectNameRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectNameRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectNameAccess().getEndKeyword_4());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNamePattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getNamePattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNamePattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getNamePattern2Rule());

		// Poptype rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getSelectPoptypeRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getSelectPoptypeRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getSelectPoptypeAccess().getEndKeyword_4());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getPoptypePattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getPoptypePattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getPoptypePattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getPoptypePattern2Rule());

		// Mercenary rules
		c.setLinewrap(2, 2, 2).before((getGrammarAccess() as DmGrammarAccess).getNewMercenaryRule());
		c.setLinewrap(1, 1, 2).after((getGrammarAccess() as DmGrammarAccess).getNewMercenaryRule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getNewMercenaryAccess().getEndKeyword_3());
		
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMercenaryPattern1Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMercenaryPattern1Rule());
		c.setLinewrap(1, 1, 1).before((getGrammarAccess() as DmGrammarAccess).getMercenaryPattern2Rule());
		c.setLinewrap(0, 1, 1).after((getGrammarAccess() as DmGrammarAccess).getMercenaryPattern2Rule());
	}
}
