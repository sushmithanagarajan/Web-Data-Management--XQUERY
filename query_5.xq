(: Query 5 - Category Name and count of people in the category :)

<CategoryGroups>
{
	let $doc := doc("auction.xml")
	for $category in doc("auction.xml")/site/categories/category
	return  <Category>
			<CatId>{data($category/@id)}</CatId>
			<Name>{data($category/name)}</Name>
			<PersonCount>
				{	
					count($doc/site/people/person[profile/interest/@category =  $category/@id])
				}
			</PersonCount>
       		</Category>
}
</CategoryGroups>