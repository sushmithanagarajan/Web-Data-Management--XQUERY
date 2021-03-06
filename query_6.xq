(: Query 6 - People who bought items from Europe :)

<EuropeAuction>
{
	let $doc := doc("auction.xml")
	for $europeItem in $doc/site/regions/europe/item
	return 
		{
			for $auction in $doc/site/closed_auctions/closed_auction
			where $auction/itemref/@item = $europeItem/@id
			return 
				{
					for $person in $doc/site/people/person
					where $person/@id = $auction/buyer/@person
					return 	
						<ItemInfo>
							<PersonName>{data($person/name)}</PersonName>
							<ItemName>{data($europeItem/name)}</ItemName>	
						</ItemInfo>
				}	
		}
}
</EuropeAuction>