(: Query 3 - All Persons and Number of Items they have bought :)

<Persons>
{
let $doc := doc("auction.xml")	
for $person in $doc/site/people/person 
return
	<Person> 
		<Name>{data($person/name)}</Name>
		{
			for $countItems in distinct-values($doc/site/people/person/@id)
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
	}
</Persons>