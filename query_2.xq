(: Query 2 - All Items listed in Europe :)

<Items> {
for $europeItems at $pos in doc("auction.xml")/site/regions/europe/item
return 
		<Item>
			<Name>{data($europeItems/name)}</Name>
			<Description>{data($europeItems/description)}</Description>
		</Item>
	}
</Items>