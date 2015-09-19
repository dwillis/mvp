# MVP
The Most Viewed (at) WashingtonPost.com

WashingtonPost.com publishes JSON feeds of its most-viewed stories on both web and mobile platforms. Using a Ruby wrapper for these endpoints called [PostHaste](https://github.com/dwillis/post_haste), this simple Ruby script grabs the top 100 most viewed pieces each hour and writes the results to day-specific CSV files.

The goal is to gain at least some insights into the data that the Post's own audience development folks are seeing, particularly in terms of which stories are popular on different platforms. All of the fields in the CSV file are directly from the original JSON except for the `rank` column, which I populate using the order of the piece in the listing.
