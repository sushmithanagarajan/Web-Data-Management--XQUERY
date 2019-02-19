(: Query 8 - List the reserve price of the auctions where person3 placed a bid before person6 :)

<Items>
{
	let $doc := doc("auction.xml")
	for $auctions in $doc/site/open_auctions/open_auction
	where $auctions/bidder/personref/@person = "person3" and $auctions/bidder/following-sibling::*[personref/@person = "person6"]
	return
		<AuctionItem>
			<InitialPrice>{data($auctions/initial)}</InitialPrice>
			<ReservePrice>{data($auctions/reserve)}</ReservePrice>
		</AuctionItem>
}
</Items>