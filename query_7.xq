(: Query 7 - List of items and their locations alphabetically sorted :)

<Items>
{
let $doc := doc("auction.xml")
for $items in $doc//item
order by $items/name
return <Item>
		<Name>{data($items/name)}</Name>
		<Location>{data($items/location)}</Location>
       </Item>
	}
</Items>