let $doc := doc("Books.xml")

for $category in distinct-values($doc/*/book/@category)
return
    <results>
	<category>{$category}</category>
	<count>{count($doc/*/book[@category=$category])}</count>
    </results>
-------------------------

for $person in $doc/site/people/person 
return
	<Person> 
		<Name>{data($person/name)}</Name>
		{
			for $countItems in distinct-values($doc/site/closed_auctions/closed_auction/buyer/@person)
			where $person/@id = $countItems
			return <ItemCount>
					{
						if(count($doc/site/closed_auctions/closed_auction[buyer/@person = $countItems]))
						then count($doc/site/closed_auctions/closed_auction[buyer/@person = $countItems])
						else 0
					}
			       </ItemCount>
		}
	</Person>

-------------------------------------------------------------------

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

