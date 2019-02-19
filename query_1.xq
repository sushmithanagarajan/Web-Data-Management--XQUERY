(: Query 1 - No. of Items listed in all continents :)

<Continents>
{
for $conts at $pos in doc("auction.xml")/site/regions/*
return <Continent>
		<Name>{name($conts)}</Name>
		<Count>{count($conts/item)}</Count>
       </Continent>
	}
</Continents>