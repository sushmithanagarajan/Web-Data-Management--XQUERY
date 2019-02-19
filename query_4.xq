(: Query 4 - Persons according to Interest Category :)

<Categories>
{
	let $doc := doc("auction.xml")
	for $category in $doc/site/categories/category
	return 
		<Category>
			<CatId>{data($category/@id)}</CatId>
			<Name>{data($category/name)}</Name>
			<Persons>
				{
					for $person in $doc/site/people/person
					where $person/profile/interest/@category = $category/@id
					return
						<Person>
							<Name>{$person/name}</Name>
						</Person>
				}
			</Persons>
		</Category>
}
</Categories>